
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:node/news/widgets/news_cells.dart';

import '../../common/constants.dart';
import '../model/news.dart';

class NewsListView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new NewsState();
  }

}

class NewsState extends State<NewsListView> with AutomaticKeepAliveClientMixin {

  InfiniteListView listView;

  @override
  Widget build(BuildContext context) {

    listView = new InfiniteListView<News>(
        onRetrieveData: (int i, List<News> news, bool refresh) {
          print(i);
          print(news.length);
          print(refresh);
          return _retrieveData(news, refresh);
        },
        itemBuilder: (List<News> newsList, int i, BuildContext context) {

          News news = newsList[i];

          return NewsCell(news);
        }
    );
    return listView;

  }

  Future<bool> _retrieveData(List<News> newsList, bool refresh) {
    return Future<bool>.delayed(new Duration(microseconds: 300), () async {

      if(refresh) {
        newsList.clear();
      }

      String id = newsList.isNotEmpty ? newsList.last.id.toString() : "";

      String url = Constants.URL_GET_NEW_PRE + "?pagesize=30&minid=" + id;

      print(url);

      Response response = await Dio().get(url);
      JsonDecoder decoder = new JsonDecoder();
      Map map = decoder.convert(response.data);
      List<dynamic> list = map['newslist'];

      for (var i = 0; i < list.length; i++) {
        News news = News.fromJson(list[i]);
        newsList.add(news);
      }
      print("retrieve Data -> " + list.length.toString());
      return true;
    });

  }

  @override
  bool get wantKeepAlive => true;

}