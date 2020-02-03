
import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:node/common/constants.dart';
import 'package:node/news/model/news_detail.dart';

import 'model/news.dart';

class NewsDetailPage extends StatefulWidget {

  News news;

  NewsDetailPage(this.news);

  static void push(BuildContext context, News news) {
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context) {
            return new NewsDetailPage(news);
          }),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return new NewsDetailPageSate(news.id);
  }

}

class NewsDetailPageSate extends State<NewsDetailPage> {

  int newsId;

  NewsDetail _newsDetail;

  List<String> _dataList = new List();

  RegExp _imgReg = new RegExp(r"\[img][\S\s]*?\[/img]");
  RegExp _urlReg = new RegExp("src=\"[\\S\\s]*?\"");

  NewsDetailPageSate(this.newsId);

  @override
  void initState() {
    super.initState();

    _fetchDetail(newsId)
        .then((result) {
          _newsDetail = result;
          _convert();
          setState(() {

          });
    });

  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_newsDetail == null ? "" : _newsDetail.title),
      ),
      body: new Container(
        child: new ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _dataList == null ? 0 : _dataList.length,
          itemBuilder: (context, i) {
            if(i < _dataList.length) {
              String content = _dataList[i];
              if (content != null && content.startsWith("http")) {
                return _buildImage(content);
              } else {
                return new Text(_dataList[i], style: new TextStyle(fontSize: 16.0),);
              }
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildImage(String url) {
    return new Container(
      padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
      height: 200,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: url,
        placeholder: (context, url) => new Icon(Icons.image),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      ),
    );
  }

  void _convert() {
    String content = _newsDetail.content;
    while(true) {
      String img = _imgReg.stringMatch(content);
      if(img != null && img.isNotEmpty) {
        List<String> data = content.split(img);
        _dataList.add(data[0].trim());
        _dataList.add(_parseUrl(img));
        content = data[1];
      } else {
        _dataList.add(content.trim());
        break;
      }
    }
//    dataList.clear();
//    dataList.add(newsDetail.content);
  }

  String _parseUrl(String data) {
    if (data == null || data.isEmpty) return null;
    String url = _urlReg.stringMatch(data);
    if (url != null) {
      url = url.substring(5, url.length - 1);
      if (url.startsWith("//")) {
        url = "https:" + url;
      }
    }
    return url != null ? url : data;
  }

  Future<NewsDetail> _fetchDetail(int id) async {
    String url = Constants.URL_NEWS_DETAIL_PRE + "?newsid=" + id.toString();
    Response response = await new Dio().get(url);
    Map map = JsonDecoder().convert(response.data);
    NewsDetail detail = NewsDetail.fromJson(map);
    return detail;
  }

}