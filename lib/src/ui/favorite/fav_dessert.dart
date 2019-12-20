import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/blocs/favorite_bloc.dart';
import 'package:flutter_expert_dicoding/src/blocs/favorite_provider.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/dessert_entity.dart';
import 'package:flutter_expert_dicoding/src/ui/itemlist/list.dart';

class FavDessert extends StatelessWidget {
  final Dessert dessert;

  FavDessert({this.dessert});

  @override
  Widget build(BuildContext context) {
    final FavoriteBloc bloc = FavoriteProvider.of(context);
    bloc.getAllDataFavDessert();

    return Scaffold(body: getListFavDessert(bloc));
  }

  getListFavDessert(FavoriteBloc bloc) {
    return (StreamBuilder(
        stream: bloc.getListFavDessert,
        builder: (context, AsyncSnapshot<List<Dessert>> snapshot) {
          if (snapshot.hasData) {
            return ListMeals(listDataFavDessert: snapshot.data);
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
  }
}
