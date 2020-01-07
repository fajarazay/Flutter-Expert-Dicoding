import 'package:flutter/cupertino.dart';
import 'package:flutter_expert_dicoding/src/blocs/meal_bloc.dart';
import 'package:flutter_expert_dicoding/src/blocs/meal_provider.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/meal_entity.dart';

import 'item_row.dart';

class ListMeals extends StatelessWidget {
  final List<Meal> listDataMeals;

  final List<MealEntity> listDataFav;

  ListMeals({this.listDataMeals, this.listDataFav});

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
            key: Key("tap_item_meals_" + dataMeals.idMeal),
            onTap: () {
              bloc.goToMealDetail(dataMeals);
            });
      }).toList();
    } else if (listDataFav != null) {
      return listDataFav.map((MealEntity dataFav) {
        Meal meal = Meal.fromJson(dataFav.toJson());
        return GestureDetector(
            child: ItemRow(dataFav: dataFav),
            onTap: () {
              bloc.goToMealDetail(meal);
            });
      }).toList();
    }
  }
}
