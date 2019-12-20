import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/model/detail_meals.dart';

class ContentDetail extends StatelessWidget {
  final Meals detailMeals;

  const ContentDetail({this.detailMeals});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(top: 16, bottom: 16, right: 8, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Card(
                            elevation: 5,
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    "Country",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color(0xff13c5c6)),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    detailMeals.strArea,
                                  ),
                                )
                              ],
                            )),
                      ),
                      Expanded(
                        child: Card(
                            elevation: 5,
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    "Category",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Color(0xff13c5c6)),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    detailMeals.strCategory,
                                  ),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          child: Center(
                            child: Text(
                              "Ingredients",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Color(0xff13c5c6)),
                            ),
                          )),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                ...listMeasures()
                                    .where(
                                        (i) => i != null && i.trim().isNotEmpty)
                                    .map((value) => Text(value))
                                    .toList()
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // cara 1
                                // for(var item in listIngredients().where((i) => i.trim()!="") ) Text(value)
                                // cara 2
                                ...listIngredients()
                                    .where(
                                        (i) => i != null && i.trim().isNotEmpty)
                                    .map((value) => Text(value))
                                    .toList()
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          child: Center(
                            child: Text(
                              "Instructions",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Color(0xff13c5c6)),
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.all(16),
                          child: Text(detailMeals.strInstructions))
                    ],
                  ),
                ),
              ],
            )));
  }

  List<String> listIngredients() {
    List<String> list = <String>[];
    list.add(detailMeals.strIngredient1);
    list.add(detailMeals.strIngredient2);
    list.add(detailMeals.strIngredient3);
    list.add(detailMeals.strIngredient4);
    list.add(detailMeals.strIngredient5);
    list.add(detailMeals.strIngredient6);
    list.add(detailMeals.strIngredient7);
    list.add(detailMeals.strIngredient8);
    list.add(detailMeals.strIngredient9);
    list.add(detailMeals.strIngredient10);
    list.add(detailMeals.strIngredient11);
    list.add(detailMeals.strIngredient12);
    list.add(detailMeals.strIngredient13);
    list.add(detailMeals.strIngredient14);
    list.add(detailMeals.strIngredient15);
    list.add(detailMeals.strIngredient16);
    list.add(detailMeals.strIngredient17);
    list.add(detailMeals.strIngredient18);
    list.add(detailMeals.strIngredient19);
    list.add(detailMeals.strIngredient20);

    return list;
  }

  List<String> listMeasures() {
    List<String> list = <String>[];
    list.add(detailMeals.strMeasure1);
    list.add(detailMeals.strMeasure2);
    list.add(detailMeals.strMeasure3);
    list.add(detailMeals.strMeasure4);
    list.add(detailMeals.strMeasure5);
    list.add(detailMeals.strMeasure6);
    list.add(detailMeals.strMeasure7);
    list.add(detailMeals.strMeasure8);
    list.add(detailMeals.strMeasure9);
    list.add(detailMeals.strMeasure10);
    list.add(detailMeals.strMeasure11);
    list.add(detailMeals.strMeasure12);
    list.add(detailMeals.strMeasure13);
    list.add(detailMeals.strMeasure14);
    list.add(detailMeals.strMeasure15);
    list.add(detailMeals.strMeasure16);
    list.add(detailMeals.strMeasure17);
    list.add(detailMeals.strMeasure18);
    list.add(detailMeals.strMeasure19);
    list.add(detailMeals.strMeasure20);

    return list;
  }
}
