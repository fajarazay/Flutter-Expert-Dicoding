import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/ui/dessert/dessert.dart';
import 'package:flutter_expert_dicoding/ui/seafood/seafood.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff13c5c6),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[Tab(text: 'Seafood'), Tab(text: 'Dessert')],
          ),
          title: Text('Yummy Flutter~'),
        ),
        body: TabBarView(
          children: <Widget>[Seafood(), Dessert()],
        ),
      ),
    );
  }
}
