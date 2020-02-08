
import 'package:flutter/material.dart';
import 'package:node/common/constants.dart';
import 'package:node/news/widgets/news_pageview.dart';

class NewsFragment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("新闻节点"), centerTitle: true,),
      body: NewsPageView(keyword: Constants.KEYWORD_DEFAULT,),
    );
  }

}