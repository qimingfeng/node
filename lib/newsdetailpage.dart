
import 'package:flutter/material.dart';

import 'modle/news.dart';

class NewsDetailPage extends StatelessWidget {

  News news;

  NewsDetailPage(this.news);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(news.title),
      ),
      body: new Container(
        child: new ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            new Text(news.content)
          ],
        ),
      ),
    );
  }

}