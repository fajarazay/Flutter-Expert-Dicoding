import 'package:flutter_expert_dicoding/model/detail_meals.dart';
import 'package:flutter_expert_dicoding/model/meals.dart';
import 'package:flutter_expert_dicoding/resources/api_provider.dart';

class Repository {
  final apiProvider = ApiProvider();

  Future<List<Meal>> fetchListMeals(String dataType) =>
      apiProvider.fetchDataMeals(dataType);

  Future<DetailMeals> fetchDetailMeal(String idMeal) =>
      apiProvider.fetchDataDetailMeal(idMeal);
}
