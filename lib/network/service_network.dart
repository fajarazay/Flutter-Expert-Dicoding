import 'dart:convert';

import 'package:flutter_expert_dicoding/model/detail_meals.dart';
import 'package:flutter_expert_dicoding/model/meals.dart';
import 'package:flutter_expert_dicoding/network/api.dart';
import 'package:http/http.dart' as http;

class ServiceNetwork {
  Future<List<Meal>> loadData(String dataType) async {
    String endpoint = API().getDessertList();
    if (dataType == "breakfast") {
      endpoint = API().getBreakfastList();
    }
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

  Future<List<Meals>> loadDataDetail(String id) async {
    String endpoint = API().getDetailMeals(id);

    http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return (jsonResponse['meals'] as List)
          .map((data) => Meals.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed load data');
    }
  }
}
