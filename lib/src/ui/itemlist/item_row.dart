import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/meal_entity.dart';

class ItemRow extends StatelessWidget {
  final Meal dataMeals;
  final MealEntity dataFav;

  ItemRow({this.dataMeals, this.dataFav});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    child: Hero(
                  tag: dataMeals != null ? dataMeals.strMeal : dataFav.strMeal,
                  child: CachedNetworkImage(
                    imageUrl: dataMeals != null
                        ? dataMeals.strMealThumb
                        : dataFav.strMealThumb,
                    fit: BoxFit.fill,
                  ),
                )),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        dataMeals != null ? dataMeals.strMeal : dataFav.strMeal,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                      ),
                    )),
              ],
            )));
  }
}
