import 'package:flutter_expert_dicoding/src/model/detail_meals.dart';
import 'package:flutter_expert_dicoding/src/resources/local/MealDao.dart';
import 'package:flutter_expert_dicoding/src/resources/local/entity/meal_entity.dart';
import 'package:flutter_expert_dicoding/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MealDetailBloc {
  MealEntity _dataMeal;
  final _repository = Repository();
  final _dbHelper = MealDao();
  final _detailMealFetcher = BehaviorSubject<DetailMeals>();
  final _isFavorite = BehaviorSubject<bool>();

  Observable<DetailMeals> get getDetailMeal => _detailMealFetcher.stream;

  //get stream
  Observable<bool> get isFavorite => _isFavorite.stream;

  fetchDataDetailMeal(String idMeal) async {
    var isExistInDB = await _repository.getDataFromDB(idMeal);
    print("isExistInDB bloc ");
    print(isExistInDB.toString());
    isExistInDB == null
        ? _isFavorite.sink.add(false)
        : _isFavorite.sink.add(true);

    DetailMeals detailMeal = isExistInDB == null
        ? await _repository.fetchDetailMeal(idMeal)
        : DetailMeals.fromJson(isExistInDB.toJson());
    _detailMealFetcher.sink.add(detailMeal);
  }

  onPressFavButton() {
    DetailMeals detailMeals = _detailMealFetcher.value;
    insert(detailMeals);
  }

  insert(DetailMeals data) async {
    _dataMeal = MealEntity.fromJson(data.meals.first.toJson());
    int a = await _dbHelper.insertMeal(_dataMeal);
    if (a > 0) {
      _isFavorite.sink.add(true);
    } else {
      _isFavorite.sink.add(false);
    }
  }

  dispose() {
    _detailMealFetcher.close();
    _isFavorite.close();
  }
}
