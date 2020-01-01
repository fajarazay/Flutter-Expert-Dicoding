import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';

class ItemRowSearch extends StatelessWidget {
  final Meal dataMeals;

  ItemRowSearch({this.dataMeals});

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
                  tag: dataMeals.strMeal,
                  child: CachedNetworkImage(
                    imageUrl: dataMeals.strMealThumb,
                    fit: BoxFit.fill,
                  ),
                )),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        dataMeals.strMeal,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                      ),
                    )),
              ],
            )));
  }
}
