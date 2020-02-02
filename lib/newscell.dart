
import 'package:flutter/material.dart';
import 'package:node/newsdetailpage.dart';

import 'modle/news.dart';

class NewsCell extends StatelessWidget {

  News news;

  NewsCell(this.news);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(
        news.title,
      ),
      subtitle: new Text(news.keys.toString()),
      onTap: () {
        _pushDetail(context);
      },
    );
  }

  void _pushDetail(BuildContext context) {
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context) {
            return new NewsDetailPage(news);
          }),
    );
  }

}