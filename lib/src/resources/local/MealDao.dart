import 'dart:io';

import 'package:flutter_expert_dicoding/src/model/detail_meals.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'entity/meal_entity.dart';

class MealDao {
  static MealDao _mealDao;
  static Database _database;

  MealDao._createObject();

  factory MealDao() {
    if (_mealDao == null) {
      _mealDao = MealDao._createObject();
    }
    return _mealDao;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'dicoding_meal.db';

    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    return todoDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
      "CREATE TABLE meal(id INTEGER PRIMARY KEY AUTOINCREMENT, idMeal TEXT, strMeal TEXT, strDrinkAlternate TEXT,"
      " strCategory TEXT, strArea TEXT, strInstructions TEXT, strMealThumb TEXT, strTags TEXT, strYoutube TEXT,"
      " strIngredient1 TEXT, strIngredient2 TEXT, strIngredient3 TEXT, strIngredient4 TEXT, strIngredient5 TEXT,"
      " strIngredient6 TEXT, strIngredient7 TEXT, strIngredient8 TEXT, strIngredient9 TEXT,"
      " strIngredient10 TEXT, strIngredient11 TEXT, strIngredient12 TEXT, strIngredient13 TEXT,"
      " strIngredient14 TEXT, strIngredient15 TEXT, strIngredient16 TEXT, strIngredient17 TEXT,"
      " strIngredient18 TEXT, strIngredient19 TEXT, strIngredient20 TEXT, "
      " strMeasure1 TEXT, strMeasure2 TEXT, strMeasure3 TEXT, strMeasure4 TEXT,"
      " strMeasure5 TEXT, strMeasure6 TEXT, strMeasure7 TEXT, strMeasure8 TEXT, strMeasure9 TEXT,"
      " strMeasure10 TEXT, strMeasure11 TEXT, strMeasure12 TEXT, strMeasure13 TEXT, strMeasure14 TEXT,"
      " strMeasure15 TEXT, strMeasure16 TEXT, strMeasure17 TEXT, strMeasure18 TEXT, strMeasure19 TEXT,"
      " strMeasure20 TEXT, strSource TEXT, dateModified TEXT"
      " )",
    );
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> selectByCategory(String category) async {
    Database db = await this.database;
    var mapList = await db.query("meal",
        where: 'strCategory=?', whereArgs: [category], orderBy: 'id');
    return mapList;
  }

  Future<List<Map<String, dynamic>>> selectByIdMeal(String idMeal) async {
    Database db = await this.database;
    var mapList = await db.query("meal",
        where: 'idMeal=?', whereArgs: [idMeal], orderBy: 'id');
    return mapList;
  }

  Future<DetailMeals> getFavMealById(idMeal) async {
    var listMealEntity = await selectByIdMeal(idMeal);
    return listMealEntity.isEmpty
        ? null
        : DetailMeals.fromJson(listMealEntity.first);
  }

  Future<List<MealEntity>> getFavDessert() async {
    var dessertMapList = await selectByCategory("Dessert");
    int count = dessertMapList.length;
    List<MealEntity> dessertList = List<MealEntity>();
    for (int i = 0; i < count; i++) {
      dessertList.add(MealEntity.fromJson(dessertMapList[i]));
    }
    return dessertList;
  }

  Future<List<MealEntity>> getFavSeafood() async {
    var seafoodMapList = await selectByCategory("Seafood");
    int count = seafoodMapList.length;
    List<MealEntity> seafoodList = List<MealEntity>();
    for (int i = 0; i < count; i++) {
      seafoodList.add(MealEntity.fromJson(seafoodMapList[i]));
    }
    return seafoodList;
  }

  Future<int> insertMeal(MealEntity data) async {
    Database db = await this.database;
    return await db.insert('meal', data.toJson());
  }

  Future<int> deleteMeal(String idMeal) async {
    Database db = await this.database;
    return await db.delete('meal', where: 'idMeal=?', whereArgs: [idMeal]);
    ;
  }
}
