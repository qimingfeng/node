
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node/homepage.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Node",
      theme: new ThemeData(
        primaryColor: Colors.white
      ),
      home: new HomePage(),
    );
  }



}