const baseUrl = "https://www.themealdb.com/api/json/v1/";
const apiKey = "1";

class API {
  String getBreakfastList() {
    var urlBreakfast = '$baseUrl$apiKey/filter.php?c=Breakfast';
    return urlBreakfast;
  }

  String getDessertList() {
    var urlDessert = '$baseUrl$apiKey/filter.php?c=Dessert';
    return urlDessert;
  }

  String getDetailMeals(String id) {
    var urlDetailMeals = '$baseUrl$apiKey/lookup.php?i=$id';
    return urlDetailMeals;
  }
}
