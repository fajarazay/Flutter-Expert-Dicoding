import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expert_dicoding/ui/breakfast/breakfast.dart';
import 'package:flutter_expert_dicoding/ui/dessert/dessert.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff13c5c6),
          bottom: TabBar(
            tabs: <Widget>[Tab(text: 'Breakfast'), Tab(text: 'Dessert')],
          ),
          title: Text('Yummy Flutter~'),
        ),
        body: TabBarView(
          children: <Widget>[Breakfast(), Dessert()],
        ),
      ),
    );
  }
}
