import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/model/meals.dart';
import 'package:flutter_expert_dicoding/network/service_network.dart';
import 'package:flutter_expert_dicoding/ui/itemlist/list.dart';

class Breakfast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ServiceNetwork serviceNetwork = ServiceNetwork();

    // TODO: implement build
    return Scaffold(
      body: FutureBuilder<List<Meal>>(
        future: serviceNetwork.loadData('breakfast'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListMeals(listDataMeals: snapshot.data);
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              "${snapshot.error}",
              textAlign: TextAlign.center,
            ));
          }
          // By default, show a loading spinner.
          return Center(
              // child: Text(snapshot.data.toString()),
              child: CircularProgressIndicator());
        },
      ),
    );
  }
}
