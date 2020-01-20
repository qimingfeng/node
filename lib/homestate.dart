
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node/home.dart';
import 'package:node/news.dart';

class HomeState extends State<Home> with SingleTickerProviderStateMixin{

  int _page = 0;

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 3)..addListener(() {
      setState(() {
        _page = _tabController.index;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Color.fromARGB(255, 240, 240, 240),
        items: <Widget>[
          Icon(Icons.list, size: 30,),
          Icon(Icons.language, size: 30,),
          Icon(Icons.person, size: 30,),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            _tabController.animateTo(index, duration: Duration(microseconds: 300), curve: Curves.ease);
          });
        },
      ),
      body: TabBarView(
          controller: _tabController,
          children: <Widget> [
            NewsList(),
            Container(
              color: Color.fromARGB(255, 200, 200, 200),
            ),
            Container(
              color: Color.fromARGB(255, 160, 160, 160),
            ),
          ]),
    );
  }

}