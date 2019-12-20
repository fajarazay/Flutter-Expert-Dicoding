import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/blocs/favorite_provider.dart';
import 'package:flutter_expert_dicoding/src/blocs/meal_detail_provider.dart';
import 'package:flutter_expert_dicoding/src/blocs/meal_provider.dart';
import 'package:flutter_expert_dicoding/src/blocs/root_provider.dart';
import 'package:flutter_expert_dicoding/src/blocs/splash_provider.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';
import 'package:flutter_expert_dicoding/src/ui/detail/detail_meals_screen.dart';
import 'package:flutter_expert_dicoding/src/ui/root/root_screen.dart';
import 'package:flutter_expert_dicoding/src/ui/splash/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MealDetailProvider(
        child: FavoriteProvider(
            child: MealProvider(
                child: RootProvider(
                    child: SplashProvider(
      child: MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        title: 'YUMMY FLUTTER',
        onGenerateRoute: routes,
      ),
    )))));
  }

  static Route<dynamic> routes(RouteSettings settings) {
    bool firstLoad = true;

    String getRouteName(String route) {
      String result = '';

      if (route == '/') {
        return '/';
      }

      if (route.contains('/')) {
        result = route.split('/')[1];
      }

      return result;
    }

    switch (getRouteName(settings.name)) {
      case '/':
        return MaterialPageRoute(builder: (context) {
          if (firstLoad) {
            firstLoad = false;
            final bloc = SplashProvider.of(context);
            bloc.getInitialData(context);
          }
          return SplashScreen();
        });
      case 'root':
        return MaterialPageRoute(builder: (context) {
          return RootScreen();
        });
      case 'mealDetail':
        return MaterialPageRoute(builder: (context) {
          final Meal meal = settings.arguments;
          return DetailMealsScreen(
            meal: meal,
            dataType: 1,
          );
        });

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
