import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/model/meals.dart';

class CollapsingToolbar extends StatelessWidget {
  final Meal meal;

  const CollapsingToolbar({Key key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverOverlapAbsorber(
        child: SliverSafeArea(
          top: false,
          sliver: SliverAppBar(
            backgroundColor: Color(0xff13c5c6),
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  meal.strMeal,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                background: Container(
                  child: Hero(
                    tag: 'dash' + meal.idMeal,
                    child: Image.network(
                      meal.strMealThumb,
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
          ),
        ),
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context));
  }
}
