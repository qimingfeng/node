
import 'dart:convert';

class NewsDetail {

  int id;
  int time;
  String title;
  String content;
  String mainKey;
  List<dynamic> keys;

  NewsDetail();

  NewsDetail.fromJson(Map<String, dynamic> map) {
    id = map['newsid'];
    time= map['time'];
    title = map['title'];
    content = map['content'];
//    Map prekeys = map['prekeys'];
//    mainKey = prekeys['main'];
//    keys = prekeys['list'];
  }



}