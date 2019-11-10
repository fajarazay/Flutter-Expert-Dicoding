import 'package:flutter/cupertino.dart';
import 'package:flutter_expert_dicoding/model/meals.dart';
import 'package:flutter_expert_dicoding/ui/itemlist/item_row.dart';

class ListMeals extends StatefulWidget {
  final List<Meal> listDataMeals;

  ListMeals({Key key, this.listDataMeals}) : super(key: key);

  @override
  _ListMeals createState() {
    // TODO: implement createState
    return _ListMeals();
  }
}

class _ListMeals extends State<ListMeals> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10, left: 10),
        // height: 900,
        child: Padding(
          padding: EdgeInsets.all(0),
          child: GridView.count(
            childAspectRatio: (0.75),
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            padding: EdgeInsets.symmetric(vertical: 8.0),
            children: widget.listDataMeals.map((Meal dataMeals) {
              return ItemRow(dataMeals);
            }).toList(),
          ),
        ));
  }
}
