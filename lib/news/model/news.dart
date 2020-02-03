
import 'dart:convert';

class News {

  int id;
  int time;
  String title;
  String url;
  String mainKey;
  List<dynamic> imgs;
  List<dynamic> keys;

  News();

  News.fromJson(Map<String, dynamic> map) {
    id = map['newsid'];
    time= map['time'];
    title = map['title'];
    url = map['url'];
    imgs = map['imgs'];
    Map prekeys = map['prekeys'];
    mainKey = prekeys['main'];
    keys = prekeys['list'];
  }



}