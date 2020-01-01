import 'package:flutter_expert_dicoding/src/model/detail_meals.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';
import 'package:flutter_expert_dicoding/src/resources/local/MealDao.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/meal_entity.dart';

import 'remote/api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();
  final mealDao = MealDao();

  Future<List<Meal>> fetchListSearchMeals(String mealName) =>
      apiProvider.fetchDataSearchMeals(mealName);

  Future<List<Meal>> fetchListMeals(String dataType) =>
      apiProvider.fetchDataMeals(dataType);

  Future<DetailMeals> fetchDetailMeal(String idMeal) =>
      apiProvider.fetchDataDetailMeal(idMeal);

  Future<List<MealEntity>> getFavDessert() => mealDao.getFavDessert();

  Future<List<MealEntity>> getFavSeafood() => mealDao.getFavSeafood();

  Future<DetailMeals> getDataFromDB(String idMeal) =>
      mealDao.getFavMealById(idMeal);
}
