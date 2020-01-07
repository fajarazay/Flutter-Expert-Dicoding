import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/blocs/splash_bloc.dart';

class SplashProvider extends InheritedWidget {
  final SplashBloc bloc;

  SplashProvider({Key key, Widget child})
      : bloc = SplashBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static SplashBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<SplashProvider>()).bloc;
  }
}
