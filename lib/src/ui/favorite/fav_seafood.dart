import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/blocs/favorite_bloc.dart';
import 'package:flutter_expert_dicoding/src/blocs/favorite_provider.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/meal_entity.dart';
import 'package:flutter_expert_dicoding/src/ui/itemlist/list.dart';

class FavSeafood extends StatelessWidget {
  final MealEntity seafood;

  FavSeafood({this.seafood});

  @override
  Widget build(BuildContext context) {
    final FavoriteBloc bloc = FavoriteProvider.of(context);
    bloc.getAllDataFavSeafood();

    return Scaffold(body: getListFavSeafood(bloc));
  }

  getListFavSeafood(FavoriteBloc bloc) {
    return (StreamBuilder(
        stream: bloc.getListFavSeafood,
        builder: (context, AsyncSnapshot<List<MealEntity>> snapshot) {
          if (snapshot.hasData) {
            return ListMeals(listDataFav: snapshot.data);
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
