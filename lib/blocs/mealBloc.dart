import 'package:flutter_expert_dicoding/model/detail_meals.dart';
import 'package:flutter_expert_dicoding/model/meals.dart';
import 'package:flutter_expert_dicoding/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MealBloc {
  final _repository = Repository();
  final _mealsFetcher = PublishSubject<List<Meal>>();
  final _detailMealFetcher = PublishSubject<DetailMeals>();

  Observable<List<Meal>> get getAllMeals => _mealsFetcher.stream;

  fetchAllDataMeals(String dataType) async {
    List<Meal> meals = await _repository.fetchListMeals(dataType);
    _mealsFetcher.sink.add(meals);
  }

  Observable<DetailMeals> get getDetailMeal => _detailMealFetcher.stream;

  fetchDataDetailMeal(String idMeal) async {
    DetailMeals detailMeal = await _repository.fetchDetailMeal(idMeal);
    _detailMealFetcher.sink.add(detailMeal);
  }

  dispose() {
    _mealsFetcher.close();
    _detailMealFetcher.close();
  }
}
