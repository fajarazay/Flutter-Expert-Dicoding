import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/blocs/meal_bloc.dart';
import 'package:flutter_expert_dicoding/src/blocs/meal_provider.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';
import 'package:flutter_expert_dicoding/src/ui/itemlist/list.dart';

class Seafood extends StatelessWidget {
  final Meal meal;

  Seafood({this.meal});

  @override
  Widget build(BuildContext context) {
    final MealBloc mealBloc = MealProvider.of(context);
    //mealBloc.storeContext(context);
    mealBloc.fetchAllDataMeals('Seafood');

    return Scaffold(body: getListSeafood(mealBloc));
  }

  getListSeafood(MealBloc mealBloc) {
    return (StreamBuilder(
        stream: mealBloc.getAllMeals,
        builder: (context, AsyncSnapshot<List<Meal>> snapshot) {
          if (snapshot.hasData) {
            return ListMeals(listDataMeals: snapshot.data);
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