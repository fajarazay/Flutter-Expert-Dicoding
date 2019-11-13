import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/ui/splash/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
