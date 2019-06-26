import 'package:flutter/material.dart';
import 'package:tonal/main.dart';
import 'package:tonal/page/about.dart';
import 'package:tonal/page/carts.dart';
import 'package:tonal/page/category.dart';
import 'package:tonal/page/greet.dart';
import 'package:tonal/page/home.dart';
import 'package:tonal/page/login.dart';
import 'package:tonal/page/mine.dart';
import 'package:tonal/page/prod.dart';
import 'package:tonal/page/search_result.dart';
import 'package:tonal/page/settings.dart';
import 'package:tonal/page/shop.dart';

class RouteHelper {
  static Map<String, WidgetBuilder> routes = {
    //路由
    '/greetPage': (BuildContext context) => GreetPage(),
    '/mainPage': (BuildContext context) => MainPage(),
    '/minePage': (BuildContext context) => MinePage(),
    '/homePage': (BuildContext context) => HomePage(),
    '/cartsPage': (BuildContext context) => CartsPage(),
    '/categoryPage': (BuildContext context) => CategoryPage(),
    '/searchPage': (BuildContext context) => SearchResultPage(),
    '/prodPage': (BuildContext context) => ProdPage(),
    '/shopPage': (BuildContext context) => ShopPage(),
    '/aboutPage': (BuildContext context) => AboutPage(),
    '/settingsPage': (BuildContext context) => SettingsPage(),
    '/loginPage': (BuildContext context) => LoginPage(),
  };
}

//    Navigator.push(context, MyPageRouteBuilder(CartsPage()));
class CustomPageRouteBuilder extends PageRouteBuilder {
  final Widget widget;

  CustomPageRouteBuilder(this.widget);
}
