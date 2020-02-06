
import 'package:flutter/material.dart';
import 'package:node/news/model/news.dart';
import 'package:node/news/news_list_page.dart';
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

  TabController _tabController;

  NewsDetailWebPageState(this.news);

  @override
  void initState() {

    _tabController = new TabController(length: news.keys.length, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print(news.url);

    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
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

}