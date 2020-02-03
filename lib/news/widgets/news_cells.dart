
import 'package:flutter/material.dart';
import 'package:node/news/news_detail_page.dart';

import '../model/news.dart';

class NewsCellNoImage extends StatelessWidget {

  News _news;

  NewsCellNoImage(this._news);

  @override
  Widget build(BuildContext context) {

  return new Container(
    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
    color: Colors.white,
    child: new GestureDetector(
      onTap: () {
        NewsDetailPage.push(context, _news);
      },
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(_news.title,
          style: new TextStyle(fontSize: 16.0),),
          new Text(_news.keys.toString(),
          style: new TextStyle(fontSize: 12.0, color: Colors.grey),),
        ],
      ),
    ),
  );
  }

}

class NewsCellOneImage extends StatelessWidget {

  News _news;

  NewsCellOneImage(this._news);

  @override
  Widget build(BuildContext context) {

    return new Container(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      color: Colors.white,
      child: new GestureDetector(
        onTap: () {
          NewsDetailPage.push(context, _news);
        },
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(_news.title,
              style: new TextStyle(fontSize: 16.0),),
            new Text(_news.keys.toString(),
              style: new TextStyle(fontSize: 12.0, color: Colors.grey),),
          ],
        ),
      ),
    );
  }

}

class NewsCellThreeImage extends StatelessWidget {

  News _news;

  NewsCellThreeImage(this._news);

  @override
  Widget build(BuildContext context) {

    return new Container(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      color: Colors.white,
      child: new GestureDetector(
        onTap: () {
          NewsDetailPage.push(context, _news);
        },
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(_news.title,
              style: new TextStyle(fontSize: 16.0),),
            new Text(_news.keys.toString(),
              style: new TextStyle(fontSize: 12.0, color: Colors.grey),),
          ],
        ),
      ),
    );
  }

}