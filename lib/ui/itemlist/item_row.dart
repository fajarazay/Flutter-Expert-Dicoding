import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/model/meals.dart';
import 'package:flutter_expert_dicoding/ui/detail/detail_meals_screen.dart';

class ItemRow extends StatefulWidget {
  final Meal dataMeals;

  ItemRow(Meal dataMeals)
      : dataMeals = dataMeals,
        super(key: ObjectKey(dataMeals));

  @override
  _ItemRowState createState() {
    return _ItemRowState(dataMeals);
  }
}

class _ItemRowState extends State<ItemRow> {
  final Meal _dataMeals;

  _ItemRowState(this._dataMeals);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          moveToDetail();
        },
        child: Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, //add this
                  children: <Widget>[
                    Expanded(
                        child: Hero(
                      tag: _dataMeals.strMeal,
                      child: CachedNetworkImage(
                        imageUrl: _dataMeals.strMealThumb,
                        fit: BoxFit.fill, // add this
                      ),
                    )),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            _dataMeals.strMeal,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14),
                          ),
                        )),
                  ],
                ))));
  }

  void moveToDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailMealsScreen(
                meal: _dataMeals,
              )),
    );
  }
}
