
class News {

  int id;
  int time;
  String title;
  String content;
  List<dynamic> keys;

  News();

  News.fromJson(Map<String, dynamic> map)
      : id = map['newsid'],
        time= map['time'],
        title = map['title'],
        content = map['content'],
        keys = map['keywords'];


}