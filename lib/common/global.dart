import 'package:flutter/material.dart';
import 'package:tonal/module/module.dart';

///全局状态
class Global {
//  static const themes = [];
  static const String BASE_URL = 'https://dalingjia.com';

  static const defaultPage = '/DefaultPage';
  static const errorPage = '/ErrorPage';
  static const greetPage = '/GreetPage';
  static const homePage = '/HomePage';
  static const homeDetailPage = '/HomePage/HomeDetailPage';
  static const homeDetail2Page = '/HomePage/HomeDetail2Page';
  static const homeRecommendPage = '/HomePage/HomeRecommendPage';
  static Map<String, WidgetBuilder> routes = {
    defaultPage: (BuildContext context) => UnknownPage(),
    errorPage: (BuildContext context) => ErrorPage(),
    greetPage: (BuildContext context) => GreetPage(),
    homePage: (BuildContext context) => HomePage(),
    homeDetailPage: (BuildContext context) => HomeDetailPage(),
    homeDetail2Page: (BuildContext context) => HomeDetail2Page(),
    homeRecommendPage: (BuildContext context) => HomeRecommendPage(),
  };

  static Route<dynamic> onUnknownRoute(RouteSettings setting) {
    return MaterialPageRoute(builder: (context) => UnknownPage());
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    String routeName = settings.name;
    switch (routeName) {
      case "/":
        return MaterialPageRoute(builder: (context) => HomePage());
      case homeDetailPage:
        return MaterialPageRoute(builder: (context) => UnknownPage());
      default:
        return MaterialPageRoute(builder: (context) => UnknownPage());
    }
//        AppPageRouteBuilder(
//            builder: (context) => OnboardingScreen(), settings: settings);
  }
}
