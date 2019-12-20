import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/blocs/meal_detail_bloc.dart';

class MealDetailProvider extends InheritedWidget {
  final MealDetailBloc bloc;

  MealDetailProvider({Key key, Widget child})
      : bloc = MealDetailBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static MealDetailBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MealDetailProvider)
            as MealDetailProvider)
        .bloc;
  }
}
