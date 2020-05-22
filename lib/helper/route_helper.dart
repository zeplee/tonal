import 'package:flutter/material.dart';
import 'package:tonal/module/default/page/default_page.dart';
import 'package:tonal/module/greet/page/greet_page.dart';
import 'package:tonal/module/home/page/home_detail_page.dart';
import 'package:tonal/module/home/page/home_page.dart';

//https://www.psvmc.cn/article/2020-05-10-flutter-start-05-route.html
class RouteHelper {
  //用此可以代替Navigator.of(context)，用于某些情况没有context对象时的跳转
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static const defaultPage = '/DefaultPage';
  static const greetPage = '/GreetPage';
  static const homePage = '/HomePage';
  static const detailPage = '/DetailPage';
  static Map<String, WidgetBuilder> routes = {
    defaultPage: (BuildContext context) => DefaultPage(),
    greetPage: (BuildContext context) => GreetPage(),
    homePage: (BuildContext context) => HomePage(),
    detailPage: (BuildContext context) => HomeDetailPage(),
  };

  //打开页面
  static void push(String path, {Object arguments}) {
    navigatorKey.currentState.pushNamed(path);
  }

  //替换页面
  static void pushReplacementNamed(String path, {Object arguments}) {
    navigatorKey.currentState.pushReplacementNamed(path);
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
