import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/blocs/favorite_bloc.dart';

class FavoriteProvider extends InheritedWidget {
  final FavoriteBloc bloc;

  FavoriteProvider({Key key, Widget child})
      : bloc = FavoriteBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static FavoriteBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<FavoriteProvider>())
        .bloc;

  }
}
