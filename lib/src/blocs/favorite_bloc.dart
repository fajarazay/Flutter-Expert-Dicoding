import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/meal_entity.dart';
import 'package:flutter_expert_dicoding/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteBloc {
  final _repository = Repository();
  final _dessertFetcher = PublishSubject<List<MealEntity>>();
  final _seafoodFetcher = PublishSubject<List<MealEntity>>();

  Observable<List<MealEntity>> get getListFavDessert => _dessertFetcher.stream;

  Observable<List<MealEntity>> get getListFavSeafood => _seafoodFetcher.stream;

  getAllDataFavDessert() async {
    List<MealEntity> dessert = await _repository.getFavDessert();
    _dessertFetcher.sink.add(dessert);
  }

  getAllDataFavSeafood() async {
    List<MealEntity> seafood = await _repository.getFavSeafood();
    _seafoodFetcher.sink.add(seafood);
  }

  goToMealDetail(MealEntity meal) {
    Navigator.pushNamed(_context, '/mealDetail', arguments: meal);
  }

  dispose() {
    _dessertFetcher.close();
    _seafoodFetcher.close();
  }

  BuildContext _context;

  storeContext(BuildContext context) {
    _context = context;
  }
}
