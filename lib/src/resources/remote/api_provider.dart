import 'dart:convert';

import 'package:flutter_expert_dicoding/src/model/detail_meals.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  final baseUrl = "https://www.themealdb.com/api/json/v1/1";

  Future<List<Meal>> fetchDataSearchMeals(String mealName) async {
    String endpoint = '$baseUrl/search.php?s=$mealName';
    http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return (jsonResponse['meals'] as List)
          .map((data) => Meal.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed load data');
    }
  }

  Future<List<Meal>> fetchDataMeals(String dataType) async {
    String endpoint = '$baseUrl/filter.php?c=$dataType';
    http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return (jsonResponse['meals'] as List)
          .map((data) => Meal.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed load data');
    }
  }

  Future<DetailMeals> fetchDataDetailMeal(String id) async {
    String endpoint = '$baseUrl/lookup.php?i=$id';
    http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      print("response.body" + response.body.toString());
      var jsonResponse = json.decode(response.body);
      print("jsonResponse" + jsonResponse.toString());
      return DetailMeals.fromJson(jsonResponse);
    } else {
      throw Exception('Failed load data');
    }
  }
}
