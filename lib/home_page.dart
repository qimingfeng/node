
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node/news/widgets/news_pageview.dart';

import 'common/constants.dart';

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
            return NewsPageView(keyword: Constants.KEYWORD_DEFAULT,);
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
      physics: NeverScrollableScrollPhysics(),
    );

    return new Scaffold(
      appBar: AppBar(title: Text("新闻节点"), centerTitle: true,),
      bottomNavigationBar: _navigationBar,
      body:new Container(
        padding: const EdgeInsets.all(0.0),
        child: _pageView,
      ),
    );
  }

}