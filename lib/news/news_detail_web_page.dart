
import 'package:flutter/material.dart';
import 'package:node/common/constants.dart';
import 'package:node/news/model/news.dart';
import 'package:node/news/news_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailWebPage extends StatefulWidget {

  News news;

  static void push(BuildContext context, News news) {
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context) {
              return NewsDetailWebPage(news);
            }));
  }

  NewsDetailWebPage(this.news);

  @override
  State<StatefulWidget> createState() {
    return NewsDetailWebPageState(news);
  }

}

class NewsDetailWebPageState extends State<NewsDetailWebPage> with TickerProviderStateMixin {

  News news;

  bool _saved;

  NewsDetailWebPageState(this.news);

  @override
  void initState() {
    _saved = false;
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(news.mainKey),
        actions: <Widget>[
          GestureDetector (
            child: Container(
              padding: EdgeInsets.all(8),
              child: Icon(_saved ? Icons.star : Icons.star_border),
            ),
            onTap: () {
              _saveData();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: news.keys != null && news.keys.isNotEmpty ? 40 : 0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: news.keys.map((item) {
                return GestureDetector(
                  onTap: () =>
                      NewsListPage.push(context: context, keyword: item),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Text(item, style: TextStyle(fontSize: 16),),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Container(
              child: WebView(
                initialUrl: news.url,
                javascriptMode: JavascriptMode.unrestricted,
                userAgent: "Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Mobile Safari/537.36",),
            ),
          ),
        ],
      ),
    );
  }

  _loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> list = preferences.getStringList(Constants.SP_KEY_FAVOURITE_KEYWORDS);
    print(list);
    setState(() {
      _saved = list != null && list.contains(news.mainKey);
    });
  }

  _saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> list = preferences.getStringList(Constants.SP_KEY_FAVOURITE_KEYWORDS);
    if(list == null) {
      list = new List();
    }
    if(list.contains(news.mainKey)) {
      list.remove(news.mainKey);
    } else {
      list.add(news.mainKey);
    }
    await preferences.setStringList(Constants.SP_KEY_FAVOURITE_KEYWORDS, list);
    setState(() {
      _saved = list != null && list.contains(news.mainKey);
    });
  }

}