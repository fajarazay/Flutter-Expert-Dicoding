import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/dessert_entity.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/seafood_entity.dart';

class ItemRow extends StatelessWidget {
  final Meal dataMeals;
  final Dessert dataFavDessert;
  final Seafood dataFavSeafood;
  ItemRow({this.dataMeals, this.dataFavDessert, this.dataFavSeafood});

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
              crossAxisAlignment: CrossAxisAlignment.stretch, //add this
              children: <Widget>[
                Expanded(
                    child: Hero(
                  tag: dataMeals != null
                      ? dataMeals.strMeal
                      : dataFavDessert.strMeal,
                  child: CachedNetworkImage(
                    imageUrl: dataMeals != null
                        ? dataMeals.strMealThumb
                        : dataFavDessert.strMealThumb,
                    fit: BoxFit.fill, // add this
                  ),
                )),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        dataMeals != null
                            ? dataMeals.strMeal
                            : dataFavDessert.strMeal,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                      ),
                    )),
              ],
            )));
  }
}
