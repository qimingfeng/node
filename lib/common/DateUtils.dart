
class DateUtils {

  static String convertTimeTips(int timestamp) {
    print("time -> " + timestamp.toString());
    String timeTips = "";
    int now = DateTime.now().millisecondsSinceEpoch;
    print("now -> " + now.toString());
    int seconds = ((now - timestamp) / 1000).floor();
    if (seconds < 60) {
      timeTips = seconds.toString() + "秒前";
    } else if(seconds < 60 * 60) {
      int minutes = (seconds / 60).floor();
      timeTips = minutes.toString() + "分前";
    } else if( seconds < 24 * 60 * 60) {
      int hours = (seconds / 60 / 60).floor();
      timeTips = hours.toString() + "小时前";
    } else {
      int month = new DateTime.fromMicrosecondsSinceEpoch(timestamp).month;
      int day = new DateTime.fromMicrosecondsSinceEpoch(timestamp).day;
      timeTips = month.toString() + "月" + day.toString() + "日";
    }

    return timeTips;
  }

}