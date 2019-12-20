import 'dart:async';

import 'package:flutter/material.dart';

class SplashBloc {
  getInitialData(BuildContext context) async {
    var _duration = Duration(seconds: 5);
    return Timer(_duration, () {
      Navigator.pushNamed(context, '/root');
    });
  }
}
