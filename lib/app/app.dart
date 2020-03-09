
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node/app/splash.dart';
import 'package:node/home/home_page.dart';
import 'package:node/me/my_favourite_page.dart';
import 'package:node/news/news_detail_page.dart';
import 'package:node/news/news_detail_web_page.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Node",
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      routes: {
        '/HomePage': (context) => HomePage(),
        '/MyFavouritePage':(context) => MyFavouritePage(),
        '/NewsDetailWebPage':(context) => NewsDetailWebPage(),
        '/NewsDetailPage':(context) => NewsDetailPage(),
      },
      home: Splash(),
    );
  }



}