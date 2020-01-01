import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/blocs/root_bloc.dart';
import 'package:flutter_expert_dicoding/src/blocs/root_provider.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';
import 'package:flutter_expert_dicoding/src/ui/dessert/dessert.dart';
import 'package:flutter_expert_dicoding/src/ui/favorite/favorite_screen.dart';
import 'package:flutter_expert_dicoding/src/ui/seafood/seafood.dart';
import 'package:flutter_expert_dicoding/src/ui/search/list_search_meals.dart';

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
        appBar: buildAppBar(context, bloc),
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

  AppBar buildAppBar(BuildContext context, RootBloc bloc) {
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
            //  bloc.goToSearchMealScreen();
            showSearch(context: context, delegate: DataSearch());
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

class DataSearch extends SearchDelegate<String> {
  final listDummy = ["arsenal", "Man city", "Liverpoool"];
  final listDummyResult = ["a", "b", "c"];

  final listEmpty = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    final RootBloc bloc = RootProvider.of(context);
    bloc.fetchAllDataSearchMeals(query);

    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final resultList = query.isEmpty ? listEmpty : listDummyResult;

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.access_alarms),
        title: Text(resultList[index]),
      ),
      itemCount: resultList.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final RootBloc bloc = RootProvider.of(context);

    if (query.length > 3) {
      return (StreamBuilder(
          stream: bloc.getAllMeals,
          builder: (context, AsyncSnapshot<List<Meal>> snapshot) {
            if (snapshot.hasData) {
              return ListSearchMeals(
                listDataMeals: snapshot.data,
              );
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                "${snapshot.error}",
                textAlign: TextAlign.center,
              ));
            }
            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          }));
    } else {
      return Container();
    }
    // ListSearchMeals()
//      ListView.builder(
//      itemBuilder: (context, index) => ListTile(
//        leading: Icon(Icons.access_alarms),
//        title: Text(suggestionList[index]),
//      ),
//      itemCount: suggestionList.length,
//    );
  }
}
