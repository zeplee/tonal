//app工具类
class AppUtils {
  //防误触返回
  static DateTime _lastPressedAt; //上次点击时间

  //false-误触,true-返回
  static bool doubleClickExit(int duration) {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt) >
            Duration(seconds: duration)) {
      //两次点击间隔超过duration秒则重新计时
      _lastPressedAt = DateTime.now();
      return false;
    }
    return true;
  }
}
