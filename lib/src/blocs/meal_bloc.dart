import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/dessert_entity.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/seafood_entity.dart';
import 'package:flutter_expert_dicoding/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MealBloc {
  final _repository = Repository();
  final _mealsFetcher = PublishSubject<List<Meal>>();

  Observable<List<Meal>> get getAllMeals => _mealsFetcher.stream;

  fetchAllDataMeals(String dataType) async {
    List<Meal> meals = await _repository.fetchListMeals(dataType);
    _mealsFetcher.sink.add(meals);
  }

  goToMealDetail(Meal meal, Dessert dessert, Seafood seafood) {
    Navigator.pushNamed(_context, '/mealDetail', arguments: meal);
  }

  dispose() {
    _mealsFetcher.close();
  }

  BuildContext _context;

  storeContext(BuildContext context) {
    _context = context;
  }
}
