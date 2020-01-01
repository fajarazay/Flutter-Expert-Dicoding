import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';
import 'package:flutter_expert_dicoding/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class SearchMealBloc {
  final _repository = Repository();
  final _mealsFetcher = PublishSubject<List<Meal>>();

  Observable<List<Meal>> get getAllMeals => _mealsFetcher.stream;

  fetchAllDataSearchMeals(String mealName) async {
    List<Meal> meals = await _repository.fetchListSearchMeals(mealName);
    _mealsFetcher.sink.add(meals);
  }

  goToMealDetail(Meal meal) {
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
