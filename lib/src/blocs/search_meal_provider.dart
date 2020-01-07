import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/blocs/search_meal_bloc.dart';

class SearchMealProvider extends InheritedWidget {
  final SearchMealBloc bloc;

  SearchMealProvider({Key key, Widget child})
      : bloc = SearchMealBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static SearchMealBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(SearchMealProvider)
    as SearchMealProvider)
        .bloc;
  }
}
