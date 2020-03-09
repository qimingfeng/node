
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:node/common/date_utils.dart';
import 'package:node/news/news_list_page.dart';

import '../model/news.dart';

class NewsCellNoImage extends StatelessWidget {

  News news;

  NewsCellNoImage(this.news);

  @override
  Widget build(BuildContext context) {

  return new Container(
    padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
    color: Colors.white,
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        NewsCellUtils.onCellTap(context, news);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          NewsCellUtils.buildTitle(context, news),
          NewsCellUtils.buildTail(context, news),
        ],
      ),
    ),
  );
  }

}

class NewsCellOneImage extends StatelessWidget {

  News news;

  NewsCellOneImage(this.news);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          NewsCellUtils.onCellTap(context, news);
        },
        child: Row(
          children: <Widget>[
            Expanded (
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  NewsCellUtils.buildTitle(context, news),
                  NewsCellUtils.buildTail(context, news),
                ],
              ),
            ),
            NewsCellUtils.buildImage(context, news.imgs, 0),
          ],
        ),
      ),
    );
  }

}

class NewsCellThreeImage extends StatelessWidget {

  News news;

  NewsCellThreeImage(this.news);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          NewsCellUtils.onCellTap(context, news);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NewsCellUtils.buildTitle(context, news),
            NewsCellUtils.buildTail(context, news),
            Row (
              children: <Widget>[
                Expanded(
                  child: NewsCellUtils.buildImage(context, news.imgs, 0),
                ),
                Expanded(
                  child: NewsCellUtils.buildImage(context, news.imgs, 1),
                ),
                Expanded(
                  child: NewsCellUtils.buildImage(context, news.imgs, 2),
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
    Navigator.pushNamed(context, "/NewsDetailWebPage", arguments:news);
  }

  static Widget buildImage(BuildContext context, List<dynamic> imgs, int index) {
    String url = imgs != null && index >= 0 && index < imgs.length ? imgs[index] : "";
    bool last = imgs != null && index == imgs.length - 1;
    bool one = imgs.length < 3;
    return Container (
      padding: EdgeInsets.fromLTRB(one ? 8.0 : 0 , 8.0, 8.0, last ? 0 : 8.0),
      height: 80,
      width: one ? 120 : 0,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: url,
        placeholder: (context, url) => new Icon(Icons.image),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      ),
    );
  }

  static Widget buildTitle(BuildContext context, News news) {
    return Text(news.title,
      style: new TextStyle(fontSize: 16.0),);
  }

  static Widget buildTail(BuildContext context, News news) {

  List<dynamic> keys = news.keys.length > 3 ? news.keys.sublist(0, 3) : news.keys;

    return Container (
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child:
          GestureDetector (
            child: Text(keys.toString() + "  " + DateUtils.convertTimeTips(news.time),
              style: TextStyle(fontSize: 14.0, color: Colors.grey), maxLines: 1,),
            onTap: () {
              if(news.mainKey != null) {
                NewsListPage.push(context: context, keyword: news.mainKey);
              }
            },
          ),
    );
  }

}