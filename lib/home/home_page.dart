
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node/home/widgets/me_fragment.dart';
import 'package:node/home/widgets/news_fragment.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }

}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

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
          _pageController.animateToPage(index, duration: Duration(microseconds: 300), curve: Curves.ease);
        });
      },
    );

    _pageView = new PageView.builder(
      itemBuilder: (context, i) {
        switch (i) {
          case 0 :
            return NewsFragment();
            break;
          case 1:
            return Container(color: Colors.white);
            break;
          case 2:
            return MeFragment();
            break;
        }
        return null;
      },
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
    );

    return new Scaffold(
      bottomNavigationBar: _navigationBar,
      body: _pageView,
    );
  }

}