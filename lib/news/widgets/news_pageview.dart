
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:node/common/constants.dart';
import 'package:node/news/widgets/news_listview.dart';

class NewsPageView extends StatefulWidget {

  String keyword;
  String relativeKeyword;

  NewsPageView({@required this.keyword, this.relativeKeyword});

  @override
  State<StatefulWidget> createState() {
    return new NewsPageViewState(keyword: keyword, relativeKeyword: relativeKeyword);
  }

}

class NewsPageViewState extends State<NewsPageView> with TickerProviderStateMixin {

  String keyword;
  String relativeKeyword;

  List<dynamic> _keywordList;

  TabController _tabController;
  PageController _pageController;

  NewsPageViewState({@required this.keyword, this.relativeKeyword});

  @override
  void initState() {

    _keywordList = new List();

    if(keyword != null && keyword.isNotEmpty) _keywordList.add(keyword);
    if(relativeKeyword != null && relativeKeyword.isNotEmpty) _keywordList.add(relativeKeyword);

    _fetchData();

    _pageController = PageController();
    _pageController.addListener(() {

    });

    _tabController = TabController(
      length: _keywordList.length,
      vsync: this,
    );
    _tabController.addListener(() {//TabBar的监听
      if (_tabController.indexIsChanging) {//判断TabBar是否切换
        print(_tabController.index);
        _onPageChange(_tabController.index, pageController: _pageController);
      }
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: _keywordList.isNotEmpty ? 40 : 0,
          alignment: Alignment.centerLeft,
          color: Colors.black12,
          child: _keywordList.isEmpty ? null : TabBar(
            isScrollable: true,
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontSize: 17.0),
            tabs: _keywordList.map((item) {
              return Tab(text: item);
            }).toList(),
          ),
        ),
        Expanded(
          child: Container(
            child: PageView.builder(
                itemCount: _keywordList.isNotEmpty ? _keywordList.length : 1,
                controller: _pageController,
                onPageChanged: (i) {
                  _onPageChange(i, tabController: _tabController);
                },
                itemBuilder: (context, i) {
                  String main = _keywordList.isNotEmpty
                      ? _keywordList[i]
                      : null;
                  return NewsListView(keyword: main, relativeKeyword: keyword);
                }),
          ),
        )
      ],
    );
  }

  void _fetchData() async {
    String url = Constants.URL_GET_NEWS_PRE + "?pagesize=0";

    if(keyword != null && keyword.isNotEmpty && keyword != Constants.KEYWORD_DEFAULT) {
      url = url + "&mainentity=" + keyword;
    }

    if(relativeKeyword != null && relativeKeyword.isNotEmpty) {
      url = url + "&otherentity=" + relativeKeyword;
    }

    print(url);

    Response response = await new Dio().get(url);
    JsonDecoder decoder = new JsonDecoder();
    Map map = decoder.convert(response.data);
    List<dynamic> list = map['relationshipentity'];

    if(list == null) return;

    for (var i = 0; i < list.length; i++) {
      String item = list[i];
      if (item != null && item != keyword && item != relativeKeyword) {
        _keywordList.add(item);
      }
    }

    print(_keywordList.length);

    setState(() {
      _tabController = TabController(
        length: _keywordList.length,
        vsync: this,
      );
      _tabController.addListener(() {//TabBar的监听
        if (_tabController.indexIsChanging) {//判断TabBar是否切换
          print(_tabController.index);
          _onPageChange(_tabController.index, pageController: _pageController);
        }
      });

    });
  }

  _onPageChange(int index, {PageController pageController, TabController tabController}) {
    if (pageController != null) {
      _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      _tabController.animateTo(index);
    }
  }

}