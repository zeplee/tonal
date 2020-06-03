import 'package:flutter/material.dart';

//https://www.psvmc.cn/article/2020-05-10-flutter-start-05-route.html
class RouteHelper {
  //用此可以代替Navigator.of(context)，用于某些情况没有context对象时的跳转
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  //打开页面
  static void push(String path, {Object arguments}) {
    navigatorKey.currentState.pushNamed(path, arguments: arguments);
  }

  //替换页面
  static void pushReplacementNamed(String path, {Object arguments}) {
    navigatorKey.currentState.pushReplacementNamed(path, arguments: arguments);
  }

  //关闭页面
  static void pop<T extends Object>([T result]) {
    navigatorKey.currentState.pop<T>(result);
  }
}

class AppPageRouteBuilder extends PageRouteBuilder {
  final Widget widget;

  AppPageRouteBuilder(this.widget);
}
