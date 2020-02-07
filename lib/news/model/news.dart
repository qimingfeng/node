
class News {

  int id;
  int time;
  String title;
  String url;
  String mainKey;
  List<dynamic> imgs = new List();
  List<dynamic> keys = new List();

  News();

  News.fromJson(Map<String, dynamic> map) {
    id = map['newsid'];
    time= map['time'];
    title = map['title'];
    url = map['url'];
    imgs = map['imgs'];
    Map prekeys = map['prekeys'];
    mainKey = prekeys['main'];

    keys.add(mainKey);
    List<dynamic> list = prekeys['list'];
    if(list != null && list.isNotEmpty) {
      for(var i = 0; i < list.length; i ++) {
        if(list[i] != mainKey) {
          keys.add(list[i]);
        }
      }
    }

  }



}