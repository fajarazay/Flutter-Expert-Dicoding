import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/blocs/mealBloc.dart';
import 'package:flutter_expert_dicoding/model/meals.dart';
import 'package:flutter_expert_dicoding/ui/itemlist/list.dart';

class Seafood extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SeafoodState();
}

class SeafoodState extends State<Seafood> {
  final mealBloc = MealBloc();

  @override
  void initState() {
    super.initState();
    mealBloc.fetchAllDataMeals('Seafood');
  }

  @override
  void dispose() {
    mealBloc.dispose();
    super.dispose();
  }

  getListSeafood() {
    return (StreamBuilder(
        stream: mealBloc.getAllMeals,
        builder: (context, AsyncSnapshot<List<Meal>> snapshot) {
          if (snapshot.hasData) {
            return ListMeals(listDataMeals: snapshot.data);
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              "${snapshot.error}",
              textAlign: TextAlign.center,
            ));
          }
          // By default, show a loading spinner.
          return Center(
              child: CircularProgressIndicator());
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getListSeafood());
  }
}
