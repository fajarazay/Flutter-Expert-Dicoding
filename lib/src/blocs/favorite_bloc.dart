import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/dessert_entity.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/seafood_entity.dart';
import 'package:flutter_expert_dicoding/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteBloc {
  final _repository = Repository();
  final _dessertFetcher = PublishSubject<List<Dessert>>();
  final _seafoodFetcher = PublishSubject<List<Seafood>>();

  Observable<List<Dessert>> get getListFavDessert => _dessertFetcher.stream;
  Observable<List<Seafood>> get getListFavSeafood => _seafoodFetcher.stream;

  getAllDataFavDessert() async {
    List<Dessert> dessert = await _repository.getFavDessert();
    _dessertFetcher.sink.add(dessert);
  }

  getAllDataFavSeafood() async {
    List<Seafood> seafood = await _repository.getFavSeafood();
    _seafoodFetcher.sink.add(seafood);
  }

  goToMealDetail(Meal meal) {
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
