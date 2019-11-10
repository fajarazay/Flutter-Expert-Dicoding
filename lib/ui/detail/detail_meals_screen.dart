import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/model/detail_meals.dart';
import 'package:flutter_expert_dicoding/model/meals.dart';
import 'package:flutter_expert_dicoding/network/service_network.dart';

import 'collapsing_toolbar.dart';
import 'content_detail.dart';

class DetailMealsScreen extends StatelessWidget {
  final Meal meal;

  const DetailMealsScreen({Key key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ServiceNetwork serviceNetwork = ServiceNetwork();

    // TODO: implement build
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) =>
          [CollapsingToolbar(meal: meal)],
      body: FutureBuilder<List<Meals>>(
        future: serviceNetwork.loadDataDetail(meal.idMeal),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ContentDetail(detailMeals: snapshot.data[0]);
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          // By default, show a loading spinner.
          return Center(
              // child: Text(snapshot.data.toString()),
              child: CircularProgressIndicator());
        },
      ),
      //  ContentDetail(detailMeals: snapshot.data[0])
    ));
  }
}
