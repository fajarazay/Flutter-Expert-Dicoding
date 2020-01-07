import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'app_test_key.dart';

void main() {
  group('instrument test', () {
    // First, define the Finders. We can use these to locate Widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("show list seafood", () async {
      await driver.tap(find.text('Seafood'));
      await Future.delayed(Duration(seconds: 3));
      await driver.waitFor(listMealsKey);
      await Future.delayed(Duration(seconds: 1));
      await driver.scroll(listMealsKey, 0, 200, Duration(milliseconds: 500));
      await driver.scroll(listMealsKey, 0, -600, Duration(milliseconds: 500));
      await driver.scroll(listMealsKey, 0, 800, Duration(milliseconds: 500));
      await Future.delayed(Duration(seconds: 1));
    });

    test("show list dessert", () async {
      await driver.tap(find.text('Dessert'));
      await Future.delayed(Duration(seconds: 3));
      await driver.waitFor(bottomNavKey);
      await Future.delayed(Duration(seconds: 1));
      await driver.waitFor(listMealsKey);
      await Future.delayed(Duration(seconds: 1));
      await driver.scroll(listMealsKey, 0, 200, Duration(milliseconds: 500));
      await driver.scroll(listMealsKey, 0, -600, Duration(milliseconds: 500));
      await driver.scroll(listMealsKey, 0, 800, Duration(milliseconds: 500));
      await Future.delayed(Duration(seconds: 1));
      await driver.tap(find.text('Banana Pancakes'));
      await Future.delayed(Duration(seconds: 5));
    });
  });
}
