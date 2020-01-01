import 'package:flutter/cupertino.dart';
import 'package:flutter_expert_dicoding/src/blocs/meal_bloc.dart';
import 'package:flutter_expert_dicoding/src/blocs/meal_provider.dart';
import 'package:flutter_expert_dicoding/src/model/meals.dart';
import 'package:flutter_expert_dicoding/src/ui/search/item_row_search.dart';

class ListSearchMeals extends StatelessWidget {
  final List<Meal> listDataMeals;

  ListSearchMeals({this.listDataMeals});

  @override
  Widget build(BuildContext context) {
    MealBloc bloc = MealProvider.of(context);
    bloc.storeContext(context);
    return Container(
        margin: EdgeInsets.only(right: 10, left: 10),
        child: Padding(
            padding: EdgeInsets.all(0),
            child: GridView.count(
                childAspectRatio: (0.75),
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                padding: EdgeInsets.symmetric(vertical: 8.0),
                children: renderList(bloc))));
  }

  renderList(MealBloc bloc) {
    if (listDataMeals != null) {
      return listDataMeals.map((Meal dataMeals) {
        return GestureDetector(
            child: ItemRowSearch(dataMeals: dataMeals),
            onTap: () {
              bloc.goToMealDetail(dataMeals);
            });
      }).toList();
    }
  }
}
