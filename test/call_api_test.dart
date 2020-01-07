import 'package:flutter_expert_dicoding/src/model/detail_meals.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';
import 'package:flutter_expert_dicoding/src/resources/remote/api_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements http.Client {}

main() {
  ApiProvider mealsApiProvider = ApiProvider();
  String mealNameTest = "apple";
  String idMealTest = "52893";
  final client = MockClient();

  group('test request api', () {
    test("get data dessert", () async {
      when(client.get(mealsApiProvider.baseUrl + '/filter.php?c=Dessert'))
          .thenAnswer((_) async => http.Response(Meal().toString(), 200));
      expect(await mealsApiProvider.fetchDataMeals("Dessert"),
          isInstanceOf<List<Meal>>());
    });

    test("get data seafood", () async {
      when(client.get(mealsApiProvider.baseUrl + '/filter.php?c=Seafood'))
          .thenAnswer((_) async => http.Response(Meal().toString(), 200));
      expect(await mealsApiProvider.fetchDataMeals("Seafood"),
          isInstanceOf<List<Meal>>());
    });

    test("get data detail", () async {
      when(client.get(mealsApiProvider.baseUrl + '/lookup.php?i=$idMealTest'))
          .thenAnswer((_) async => http.Response(Meal().toString(), 200));
      expect(await mealsApiProvider.fetchDataDetailMeal(idMealTest),
          isInstanceOf<DetailMeals>());
      var result = await mealsApiProvider.fetchDataDetailMeal(idMealTest);
      expect(result.meals.first.strMeal, "Apple & Blackberry Crumble");
    });

    test("get data search", () async {
      when(client.get(mealsApiProvider.baseUrl + '/search.php?s=$mealNameTest'))
          .thenAnswer((_) async => http.Response(Meal().toString(), 200));
      expect(await mealsApiProvider.fetchDataSearchMeals(mealNameTest),
          isInstanceOf<List<Meal>>());
    });
  });
}
