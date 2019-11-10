//class DataMeals {
//  List<Meals> _meals;
//
//  DataMeals({List<Meals> meals}) {
//    this._meals = meals;
//  }
//
//  List<Meals> get meals => _meals;
//  set meals(List<Meals> meals) => _meals = meals;
//
//  DataMeals.fromJson(Map<String, dynamic> json) {
//    if (json['meals'] != null) {
//      _meals = new List<Meals>();
//      json['meals'].forEach((v) {
//        _meals.add(new Meals.fromJson(v));
//      });
//    }
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    if (this._meals != null) {
//      data['meals'] = this._meals.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
//}
//
//class Meals {
//  String _strMeal;
//  String _strMealThumb;
//  String _idMeal;
//
//  Meals({String strMeal, String strMealThumb, String idMeal}) {
//    this._strMeal = strMeal;
//    this._strMealThumb = strMealThumb;
//    this._idMeal = idMeal;
//  }
//
//  String get strMeal => _strMeal;
//  set strMeal(String strMeal) => _strMeal = strMeal;
//  String get strMealThumb => _strMealThumb;
//  set strMealThumb(String strMealThumb) => _strMealThumb = strMealThumb;
//  String get idMeal => _idMeal;
//  set idMeal(String idMeal) => _idMeal = idMeal;
//
//  Meals.fromJson(Map<String, dynamic> json) {
//    _strMeal = json['strMeal'];
//    _strMealThumb = json['strMealThumb'];
//    _idMeal = json['idMeal'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['strMeal'] = this._strMeal;
//    data['strMealThumb'] = this._strMealThumb;
//    data['idMeal'] = this._idMeal;
//    return data;
//  }
//}

// To parse this JSON data, do
//
//     final dataMeals = dataMealsFromJson(jsonString);

import 'dart:convert';

DataMeals dataMealsFromJson(String str) => DataMeals.fromJson(json.decode(str));

String dataMealsToJson(DataMeals data) => json.encode(data.toJson());

class DataMeals {
  List<Meal> meals;

  DataMeals({
    this.meals,
  });

  factory DataMeals.fromJson(Map<String, dynamic> json) => DataMeals(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };
}

class Meal {
  String strMeal;
  String strMealThumb;
  String idMeal;

  Meal({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
      );

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
      };
}
