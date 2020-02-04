import 'package:flutter/material.dart';
import 'package:node/news/widgets/news_pageview.dart';

class NewsListPage extends StatefulWidget {
  String keyword;
  String relativeKeyword;

  static void push(
      {@required BuildContext context,
      @required String keyword,
      String relativeKeyword}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return NewsListPage(
            keyword: keyword,
            relativeKeyword: relativeKeyword,
          );
        },
      ),
    );
  }

  NewsListPage({@required this.keyword, this.relativeKeyword});

  @override
  State<StatefulWidget> createState() {
    return NewsListPageState(keyword: keyword, relativeKeyword: relativeKeyword);
  }
}

class NewsListPageState extends State<NewsListPage> {

  String keyword;
  String relativeKeyword;

  NewsListPageState({@required this.keyword, this.relativeKeyword});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text(keyword),
      ),
      body: NewsPageView(keyword: keyword, relativeKeyword: relativeKeyword,),
    );
  }
}
