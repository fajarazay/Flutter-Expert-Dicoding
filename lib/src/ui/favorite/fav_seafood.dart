//import 'package:flutter/material.dart';
//import 'package:flutter_expert_dicoding/src/blocs/favorite_bloc.dart';
//import 'package:flutter_expert_dicoding/src/blocs/favorite_provider.dart';
//import 'package:flutter_expert_dicoding/src/resources/local/entity/seafood_entity.dart';
//import 'package:flutter_expert_dicoding/src/ui/itemlist/list.dart';
//
//class FavSeafood extends StatelessWidget {
//  final Seafood seafood;
//
//  FavSeafood({this.seafood});
//
//  @override
//  Widget build(BuildContext context) {
//    final FavoriteBloc bloc = FavoriteProvider.of(context);
//    bloc.getAllDataFavDessert();
//
//    return Scaffold(
//        body: getListFavDessert(bloc));
//  }
//
//  getListFavDessert(FavoriteBloc bloc) {
//    return (StreamBuilder(
//        stream: bloc.getAllDataFavSeafood(),
//        builder: (context, AsyncSnapshot<List<Seafood>> snapshot) {
//          if (snapshot.hasData) {
//            return ListMeals(listDataFavSeafood: snapshot.data);
//          } else if (snapshot.hasError) {
//            return Center(
//                child: Text(
//                  "${snapshot.error}",
//                  textAlign: TextAlign.center,
//                ));
//          }
//          // By default, show a loading spinner.
//          return Center(child: CircularProgressIndicator());
//        }));
//  }
//}
