import 'package:flutter/material.dart';
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

  storeContext(BuildContext context) {
    _context = context;
  }

  dispose() {
    _navBar.close();
  }
}
