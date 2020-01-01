import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/blocs/meal_detail_bloc.dart';
import 'package:flutter_expert_dicoding/src/blocs/meal_detail_provider.dart';
import 'package:flutter_expert_dicoding/src/model/detail_meals.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';

import 'collapsing_toolbar.dart';
import 'content_detail.dart';

class DetailMealsScreen extends StatelessWidget {
  final Meal meal;

  DetailMealsScreen({this.meal});

  @override
  Widget build(BuildContext context) {
    final MealDetailBloc bloc = MealDetailProvider.of(context);
    bloc.fetchDataDetailMeal(meal.idMeal);
    return Scaffold(
        body:
        NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) =>
                [CollapsingToolbar(meal: meal)],
            body: getDetailMeal(bloc)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            bloc.onPressFavButton();
          },
          child: StreamBuilder(
              stream: bloc.isFavorite,
              builder: (context, AsyncSnapshot<bool> snapshot) {
                print("snapshot.data isFavorite " + snapshot.data.toString());
                return snapshot.data == true
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border);
              }),
        ));
  }

  getDetailMeal(MealDetailBloc bloc) {
    return (StreamBuilder(
        stream: bloc.getDetailMeal,
        builder: (context, AsyncSnapshot<DetailMeals> snapshot) {
          if (snapshot.hasData) {
            return ContentDetail(detailMeals: snapshot.data.meals.first);
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
