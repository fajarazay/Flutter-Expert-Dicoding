const baseUrl = "https://www.themealdb.com/api/json/v1/";
const apiKey = "1";

class API {
  String getMealsList(String categoryMeals) {
    var urlGetMeals = '$baseUrl$apiKey/filter.php?c=$categoryMeals';
    return urlGetMeals;
  }

  String getDetailMeals(String id) {
    var urlDetailMeals = '$baseUrl$apiKey/lookup.php?i=$id';
    return urlDetailMeals;
  }
}
