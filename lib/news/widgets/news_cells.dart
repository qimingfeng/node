
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:node/news/news_detail_page.dart';
import 'package:node/news/news_list_page.dart';

import '../model/news.dart';
import '../news_detail_web_page.dart';

class NewsCellNoImage extends StatelessWidget {

  News _news;

  NewsCellNoImage(this._news);

  @override
  Widget build(BuildContext context) {

  return new Container(
    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
    color: Colors.white,
    child: GestureDetector(
      onTap: () {
        NewsCellUtils.onCellTap(context, _news);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_news.title,
          style: new TextStyle(fontSize: 16.0),),
          GestureDetector (
            child: Text(_news.keys.toString(),
              style: TextStyle(fontSize: 12.0, color: Colors.grey), maxLines: 1,),
            onTap: () {
              if(_news.keys.isNotEmpty) {
                NewsListPage.push(context: context, keyword: _news.keys.first);
              }
            },
          ),
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

    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          NewsCellUtils.onCellTap(context, _news);
        },
        child: Row(
          children: <Widget>[
            Expanded (
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_news.title,
                    style: new TextStyle(fontSize: 16.0),),
                  GestureDetector (
                    child: Text(_news.keys.toString(),
                      style: TextStyle(fontSize: 12.0, color: Colors.grey), maxLines: 1,),
                    onTap: () {
                      if(_news.keys.isNotEmpty) {
                        NewsListPage.push(context: context, keyword: _news.keys.first);
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              width: 80,
              height: 80,
              child:  CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: _news.imgs[0],
                placeholder: (context, url) => new Icon(Icons.image),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
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

    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          NewsCellUtils.onCellTap(context, _news);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(_news.title,
              style: new TextStyle(fontSize: 16.0),),
            GestureDetector (
              child: Text(_news.keys.toString(),
                style: TextStyle(fontSize: 12.0, color: Colors.grey), maxLines: 1,),
              onTap: () {
                if(_news.keys.isNotEmpty) {
                  NewsListPage.push(context: context, keyword: _news.keys.first);
                }
              },
            ),
            Row (
              children: <Widget>[
                Expanded(
                  child: Container (
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
                    height: 80,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: _news.imgs[0],
                      placeholder: (context, url) => new Icon(Icons.image),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    ),
                  ),
                ),
                Expanded(
                  child: Container (
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
                    height: 80,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: _news.imgs[1],
                      placeholder: (context, url) => new Icon(Icons.image),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    ),
                  ),
                ),
                Expanded(
                  child: Container (
                    padding: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
                    height: 80,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: _news.imgs[2],
                      placeholder: (context, url) => new Icon(Icons.image),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

class NewsCellUtils {

  static void onCellTap(BuildContext context, News news) {
    NewsDetailWebPage.push(context, news);
  }

}