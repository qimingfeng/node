
import 'package:flutter/material.dart';
import 'package:node/news/news_detail_page.dart';

import '../model/news.dart';

class NewsCell extends StatelessWidget {

  News news;

  NewsCell(this.news);

  @override
  Widget build(BuildContext context) {

  return new Container(
    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
    color: Colors.white,
    child: new GestureDetector(
      onTap: () {
        NewsDetailPage.push(context, news);
      },
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(news.title,
          style: new TextStyle(fontSize: 16.0),),
          new Text(news.keys.toString(),
          style: new TextStyle(fontSize: 12.0, color: Colors.grey),),
        ],
      ),
    ),
  );
  }

}