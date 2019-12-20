import 'package:flutter/cupertino.dart';
import 'package:flutter_expert_dicoding/src/blocs/meal_bloc.dart';
import 'package:flutter_expert_dicoding/src/blocs/meal_provider.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/dessert_entity.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/seafood_entity.dart';

import 'item_row.dart';

class ListMeals extends StatelessWidget {
  final List<Meal> listDataMeals;

  final List<Dessert> listDataFavDessert;
  final List<Seafood> listDataFavSeafood;

  ListMeals(
      {this.listDataMeals, this.listDataFavDessert, this.listDataFavSeafood});

  @override
  Widget build(BuildContext context) {
    MealBloc bloc = MealProvider.of(context);
    bloc.storeContext(context);
    return Container(
        margin: EdgeInsets.only(right: 10, left: 10),
        child: Padding(
            padding: EdgeInsets.all(0),
            child: GridView.count(
                childAspectRatio: (0.75),
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                padding: EdgeInsets.symmetric(vertical: 8.0),
                children: renderList(bloc))));
  }

  renderList(MealBloc bloc) {
    if (listDataMeals != null) {
      return listDataMeals.map((Meal dataMeals) {
        return GestureDetector(
            child: ItemRow(dataMeals: dataMeals),
            onTap: () {
              bloc.goToMealDetail(dataMeals, null, null);
            });
      }).toList();
    } else if (listDataFavDessert != null) {
      return listDataFavDessert.map((Dessert dessert) {
        return GestureDetector(
            child: ItemRow(dataFavDessert: dessert),
            onTap: () {
              bloc.goToMealDetail(null, dessert, null);
            });
      }).toList();
    } else if (listDataFavSeafood != null) {
      return listDataFavSeafood.map((Seafood seafood) {
        return GestureDetector(
            child: ItemRow(dataFavSeafood: seafood),
            onTap: () {
              bloc.goToMealDetail(null, null, seafood);
            });
      }).toList();
    }
  }
}
