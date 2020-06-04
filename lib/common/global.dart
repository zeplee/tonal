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
  static const homeDetail1Page = '/HomePage/HomeDetail1Page';
  static const homeDetail2Page = '/HomePage/HomeDetail2Page';
  static const homeDetail3Page = '/HomePage/HomeDetail3Page';
  static const homeDetail4Page = '/HomePage/HomeDetail4Page';
  static const homeDetail5Page = '/HomePage/HomeDetail5Page';
  static const homeDetail6Page = '/HomePage/HomeDetail6Page';
  static const homeDetail7Page = '/HomePage/HomeDetail7Page';

  static Map<String, WidgetBuilder> routes = {
    defaultPage: (BuildContext context) => UnknownPage(),
    errorPage: (BuildContext context) => ErrorPage(),
    greetPage: (BuildContext context) => GreetPage(),
    homePage: (BuildContext context) => HomePage(),
    homeDetail1Page: (BuildContext context) => HomeDetail1Page(),
    homeDetail2Page: (BuildContext context) => HomeDetail2Page(),
    homeDetail3Page: (BuildContext context) => HomeDetail3Page(),
    homeDetail4Page: (BuildContext context) => HomeDetail4Page(),
    homeDetail5Page: (BuildContext context) => HomeDetail5Page(),
    homeDetail6Page: (BuildContext context) => HomeDetail6Page(),
    homeDetail7Page: (BuildContext context) => HomeDetail7Page(),
  };

  static Route<dynamic> onUnknownRoute(RouteSettings setting) {
    return MaterialPageRoute(builder: (context) => UnknownPage());
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    String routeName = settings.name;
    switch (routeName) {
      case "/":
        return MaterialPageRoute(builder: (context) => HomePage());
      case homeDetail1Page:
        return MaterialPageRoute(builder: (context) => UnknownPage());
      default:
        return MaterialPageRoute(builder: (context) => UnknownPage());
    }
//        AppPageRouteBuilder(
//            builder: (context) => OnboardingScreen(), settings: settings);
  }
}
