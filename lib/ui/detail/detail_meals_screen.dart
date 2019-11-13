import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/blocs/mealBloc.dart';
import 'package:flutter_expert_dicoding/model/detail_meals.dart';
import 'package:flutter_expert_dicoding/model/meals.dart';

import 'collapsing_toolbar.dart';
import 'content_detail.dart';

class DetailMealsScreen extends StatefulWidget {
  final Meal meal;

  const DetailMealsScreen({Key key, this.meal}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DetailMealsScreenState();
}

class DetailMealsScreenState extends State<DetailMealsScreen> {
  final detailBloc = MealBloc();

  @override
  void initState() {
    super.initState();
    detailBloc.fetchDataDetailMeal(widget.meal.idMeal);
  }

  @override
  void dispose() {
    detailBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) =>
                [CollapsingToolbar(meal: widget.meal)],
            body: getDetailMeal()));
  }

  getDetailMeal() {
    return (StreamBuilder(
        stream: detailBloc.getDetailMeal,
        builder: (context, AsyncSnapshot<DetailMeals> snapshot) {
          if (snapshot.hasData) {
            return ContentDetail(detailMeals: snapshot.data.meals[0]);
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
