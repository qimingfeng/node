
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:node/common/DateUtils.dart';
import 'package:node/news/widgets/news_cells.dart';

import '../../common/constants.dart';
import '../model/news.dart';

class NewsListView extends StatefulWidget{

  String keyword;
  String relativeKeyword;

  NewsListView({this.keyword, this.relativeKeyword});

  @override
  State<StatefulWidget> createState() {
    return new NewsState(keyword: keyword, relativeKeyword: relativeKeyword);
  }

}

class NewsState extends State<NewsListView> with AutomaticKeepAliveClientMixin {

  InfiniteListView _listView;

  String keyword;

  String relativeKeyword;

  NewsState({this.keyword, this.relativeKeyword});

  @override
  Widget build(BuildContext context) {

    _listView = new InfiniteListView<News>(
      headerBuilder: null,
        onRetrieveData: (int i, List<News> news, bool refresh) {
          print(i);
          print(news.length);
          print(refresh);
          return _retrieveData(news, refresh);
        },
        itemBuilder: (List<News> newsList, int i, BuildContext context) {

          News news = newsList[i];
          DateUtils.convertTimeTips(news.time);

          return _buildCell(news);
        }
    );
    return _listView;

  }

  Widget _buildCell(News news) {
    if (news == null) return null;
    Widget cell;
    if (news.imgs == null || news.imgs.isEmpty) {
      cell = NewsCellNoImage(news);
    } else if (news.imgs.length < 3) {
      cell = NewsCellOneImage(news);
    } else {
      cell = NewsCellThreeImage(news);
    }
    return cell;
  }

  Future<bool> _retrieveData(List<News> newsList, bool refresh) {
    return Future<bool>.delayed(new Duration(microseconds: 300), () async {

      if(refresh) {
        newsList.clear();
      }

      String id = newsList.isNotEmpty ? newsList.last.id.toString() : "";

      String url = Constants.URL_GET_NEWS_PRE + "?pagesize=30&minid=" + id;

      if(keyword != null && keyword.isNotEmpty && keyword != Constants.KEYWORD_DEFAULT) {
        url = url + "&mainentity=" + keyword;
      }

      if(relativeKeyword != null && relativeKeyword.isNotEmpty && relativeKeyword != Constants.KEYWORD_DEFAULT) {
        url = url + "&otherentity=" + relativeKeyword;
      }

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