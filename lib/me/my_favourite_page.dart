import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node/common/constants.dart';
import 'package:node/news/news_detail_web_page.dart';
import 'package:node/news/news_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyFavouritePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyFavouritePageSate();
  }
}

class MyFavouritePageSate extends State<MyFavouritePage> {
  List<String> _keywords = List();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的收藏"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: _keywords.length,
            itemBuilder: (context, i) {
              return _buildCell(context, i);
            }),
      ),
    );
  }

  _loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> list =
        preferences.getStringList(Constants.SP_KEY_FAVOURITE_KEYWORDS);
    if (list == null) {
      list = List();
    }
    setState(() {
      _keywords = list;
    });
  }

  Widget _buildCell(BuildContext context, int index) {
    String keyword = _keywords[index];
    return ListTile(
      onTap: () {
        NewsListPage.push(context: context, keyword: keyword);
      },
      title: Text(keyword),
    );
  }
}
