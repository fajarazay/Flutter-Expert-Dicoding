import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/src/ui/favorite/fav_dessert.dart';
import 'package:flutter_expert_dicoding/src/ui/favorite/fav_seafood.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color(0xff13c5c6),
          appBar: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[400],
            indicatorColor: Color(0xffEDCE4A),
            indicatorWeight: 5,
            tabs: [
              Tab(text: "Dessert"),
              Tab(text: "Seafood"),
            ],
          ),
          body: TabBarView(
            children: <Widget>[FavDessert(), FavSeafood()],
          ),

        ));
  }
}
