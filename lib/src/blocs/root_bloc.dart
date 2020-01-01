import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';
import 'package:flutter_expert_dicoding/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

enum NavBarEnum { DESSERT, SEAFOOD, FAVORITE }

class RootBloc {
  BuildContext _context;

  final _navBar = BehaviorSubject<NavBarEnum>();

  NavBarEnum defaultItem = NavBarEnum.DESSERT;

  //add stream
  Stream<NavBarEnum> get navBar => _navBar.stream;

  //add sink
  Function(NavBarEnum) get changeNavBar => _navBar.sink.add;

  final _repository = Repository();
  final _mealsFetcher = PublishSubject<List<Meal>>();

  Observable<List<Meal>> get getAllMeals => _mealsFetcher.stream;

  pickItem(index) {
    switch (index) {
      case 0:
        changeNavBar(NavBarEnum.DESSERT);
        break;
      case 1:
        changeNavBar(NavBarEnum.SEAFOOD);
        break;
      case 2:
        changeNavBar(NavBarEnum.FAVORITE);
        break;
    }
  }

  fetchAllDataSearchMeals(String mealName) async {
    List<Meal> meals = await _repository.fetchListSearchMeals(mealName);
    _mealsFetcher.sink.add(meals);
  }

  goToSearchMealScreen() {
    Navigator.pushNamed(_context, '/searchMeal');
  }

  storeContext(BuildContext context) {
    _context = context;
  }

  dispose() {
    _navBar.close();
    _mealsFetcher.close();
  }


}
