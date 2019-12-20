import 'package:flutter/cupertino.dart';
import 'package:flutter_expert_dicoding/src/blocs/meal_bloc.dart';

class MealProvider extends InheritedWidget {
  final MealBloc bloc;

  MealProvider({Key key, Widget child})
      : bloc = MealBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static MealBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MealProvider) as MealProvider)
        .bloc;
  }
}
