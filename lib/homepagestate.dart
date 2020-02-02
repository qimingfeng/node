
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node/homepage.dart';
import 'package:node/newslistview.dart';

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  int _page = 0;

  CurvedNavigationBar _navigationBar;
  PageView _pageView;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

  }

  @override
  Widget build(BuildContext context) {

    _navigationBar = new CurvedNavigationBar(
      height: 60,
      animationDuration: Duration(milliseconds: 300),
      color: Color.fromARGB(255, 240, 240, 240),
      backgroundColor: Colors.white,
      items: <Widget>[
        Icon(Icons.list, size: 30,),
        Icon(Icons.language, size: 30,),
        Icon(Icons.person, size: 30,),
      ],
      onTap: (index) {
        setState(() {
          _page = index;
          _pageController.animateToPage(index, duration: Duration(microseconds: 300), curve: Curves.ease);
        });
      },
    );

    _pageView = new PageView.builder(
      itemBuilder: (context, i) {
        switch (i) {
          case 0 :
            return NewsListView();
            break;
          case 1:
            return Container(color: Color.fromARGB(255, 200, 200, 200),);
            break;
          case 2:
            return Container(color: Color.fromARGB(255, 160, 160, 160),);
            break;
        }
        return null;
      },
      controller: _pageController,
    physics: NeverScrollableScrollPhysics(),);

    return new Scaffold(
      bottomNavigationBar: _navigationBar,
      body:_pageView,
    );
  }

}