import 'package:flustars/flustars.dart';
import 'package:flutter/foundation.dart';

///全局状态
class Global {
  //手动开发者模式sp_key
  static const SPKEY_IS_DEBUG = "isDebugMode";

  // 是否为debug模式-默认debug与开发模式
  static bool IS_DEBUG() =>
      !kReleaseMode || SpUtil.getBool(SPKEY_IS_DEBUG, defValue: false);

//  static const themes = [];
  static const String BASE_URL = 'https://dalingjia.com';
}
