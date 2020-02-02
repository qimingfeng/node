
import 'package:flutter/material.dart';

import 'model/news.dart';

class NewsDetailPage extends StatelessWidget {

  News news;

  List<String> dataList = new List();

  RegExp imgReg = new RegExp(r"\[img][\S\s]*?\[/img]");
  RegExp urlReg = new RegExp("src=\"[\\S\\s]*?\"");

  static void push(BuildContext context, News news) {
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context) {
            return new NewsDetailPage(news);
          }),
    );
  }

  NewsDetailPage(this.news);

  @override
  Widget build(BuildContext context) {

    _convert();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(news.title),
      ),
      body: new Container(
        child: new ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            if(i < dataList.length) {
              String content = dataList[i];
              if (content != null && content.startsWith("http")) {
                return _buildImage(content);
              } else {
                return new Text(dataList[i], style: new TextStyle(fontSize: 16.0),);
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
      child: Image.network(url),
    );
  }

  void _convert() {
    String content = news.content;
    while(true) {
      String img = imgReg.stringMatch(content);
      if(img != null && img.isNotEmpty) {
        List<String> data = content.split(img);
        dataList.add(data[0].trim());
        dataList.add(_parseUrl(img));
        content = data[1];
      } else {
        dataList.add(content.trim());
        break;
      }
    }
//    dataList.clear();
//    dataList.add(news.content);
  }

  String _parseUrl(String data) {
    if (data == null || data.isEmpty) return null;
    String url = urlReg.stringMatch(data);
    if (url != null) {
      url = url.substring(5, url.length - 1);
      if (url.startsWith("//")) {
        url = "https:" + url;
      }
    }
    return url != null ? url : data;
  }


}