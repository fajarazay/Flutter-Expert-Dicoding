import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/blocs/root_bloc.dart';
import 'package:flutter_expert_dicoding/src/blocs/root_provider.dart';
import 'package:flutter_expert_dicoding/src/ui/dessert/dessert.dart';
import 'package:flutter_expert_dicoding/src/ui/favorite/favorite_screen.dart';
import 'package:flutter_expert_dicoding/src/ui/seafood/seafood.dart';

class RootScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final RootBloc bloc = RootProvider.of(context);
    bloc.storeContext(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: buildAppBar(context),
        bottomNavigationBar: buildBottomNavigationBar(bloc),
        body: SafeArea(
            child: StreamBuilder(
          stream: bloc.navBar,
          initialData: NavBarEnum.DESSERT,
          builder: (context, AsyncSnapshot<NavBarEnum> snapshot) {
            switch (snapshot.data) {
              case NavBarEnum.DESSERT:
                return Dessert();
              case NavBarEnum.SEAFOOD:
                return Seafood();
              case NavBarEnum.FAVORITE:
                return FavoriteScreen();
            }
            return Container();
          },
        )),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xff13c5c6),
      automaticallyImplyLeading: false,
      title: Text("Yummy Flutter"),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
            size: 25.0,
          ),
          onPressed: () {
            //TODO: search icon clicked event
            print('pressed');
          },
        ),
        SizedBox(
          width: 15.0,
        )
      ],
    );
  }

  Widget buildBottomNavigationBar(RootBloc bloc) {
    return StreamBuilder(
        stream: bloc.navBar,
        builder: (context, AsyncSnapshot<NavBarEnum> snapshot) {
          int index = snapshot?.data?.index ?? 0;
          return BottomNavigationBar(
            currentIndex: index,
            onTap: bloc.pickItem,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xff13c5c6),
            unselectedItemColor: Color(0xFF90949C),
            items: [
              BottomNavigationBarItem(
                  title: Text('Dessert'),
                  icon: ImageIcon(AssetImage('assets/img/ice_cream.png'))),
              BottomNavigationBarItem(
                  title: Text('Seafood'),
                  icon: ImageIcon(AssetImage('assets/img/shell.png'))),
              BottomNavigationBarItem(
                title: Text('Favorite'),
                icon: Icon(Icons.favorite),
              ),
            ],
          );
        });
  }
}
