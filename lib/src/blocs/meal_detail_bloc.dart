import 'dart:async';

import 'package:flutter_expert_dicoding/src/model/detail_meals.dart';
import 'package:flutter_expert_dicoding/src/resources/local/MealDao.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/dessert_entity.dart';
import 'package:flutter_expert_dicoding/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MealDetailBloc {
  Dessert _dessert;
  final _repository = Repository();
  final _dbHelper = MealDao();
  final _detailMealFetcher = BehaviorSubject<DetailMeals>();
  final _isFavorite = BehaviorSubject<bool>();

  Observable<DetailMeals> get getDetailMeal => _detailMealFetcher.stream;

  //get stream
  Stream<bool> get isFavorite => _isFavorite.stream;

  Function(bool) get isFav => _isFavorite.sink.add;

  // Input stream for adding new notes. We'll call this from our pages.
  final _controller = StreamController<DetailMeals>.broadcast();

  StreamSink<DetailMeals> get inAddNote => _controller.sink;

  fetchDataDetailMeal(String idMeal) async {
    DetailMeals detailMeal = await _repository.fetchDetailMeal(idMeal);
    _detailMealFetcher.sink.add(detailMeal);
  }

  onPressFavButton() {
    DetailMeals detailMeals = _detailMealFetcher.value;
    insert(detailMeals);
  }

  insert(DetailMeals data) async {
    _dessert = Dessert.fromJson(data.meals[0].toJson());
    int a = await _dbHelper.insertDessert(_dessert);
    if (a > 0) {
      isFav(true);
    } else {
      isFav(false);
    }
  }

  dispose() {
    _detailMealFetcher.close();
    _isFavorite.close();
    _controller.close();
  }
}
