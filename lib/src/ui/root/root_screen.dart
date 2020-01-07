import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/blocs/root_bloc.dart';
import 'package:flutter_expert_dicoding/src/blocs/root_provider.dart';
import 'package:flutter_expert_dicoding/src/commons/key.dart';
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
            key: Key(KEY_BOTTOM_NAV_BAR),
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
  @override
  List<Widget> buildActions(BuildContext context) {
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
    final RootBloc bloc = RootProvider.of(context);

    if (query.length > 2) {
      bloc.fetchAllDataSearchMeals(query);
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
            } else if (snapshot.data == null) {
              return Container(
                  child: Center(
                    child: Text("Data not found"),
                  ));
            }
            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          }));
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final RootBloc bloc = RootProvider.of(context);

    if (query.length > 2) {
      bloc.fetchAllDataSearchMeals(query);
      return (StreamBuilder(
          stream: bloc.getAllMeals,
          builder: (context, AsyncSnapshot<List<Meal>> snapshot) {
            print("snapshot.hasData " + snapshot.hasData.toString());
            print("snapshot.data " + snapshot.data.toString());
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                return ListSearchMeals(
                  listDataMeals: snapshot.data,
                );
              } else {
                return Container(
                    child: Center(
                      child: Text("Data not found"),
                    ));
              }
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                    "${snapshot.error}",
                    textAlign: TextAlign.center,
                  ));
            } else if (snapshot.data == null) {
              return Container(
                  child: Center(
                    child: Text("Data not found"),
                  ));
            }
            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          }));
    } else {
      return Container();
    }
  }
}
