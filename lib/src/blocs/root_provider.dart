import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/blocs/root_bloc.dart';

class RootProvider extends InheritedWidget {
  final RootBloc bloc;

  RootProvider({Key key, Widget child})
      : bloc = RootBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static RootBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(RootProvider) as RootProvider)
        .bloc;
  }
}
