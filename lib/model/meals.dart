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
