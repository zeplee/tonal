import 'package:flutter/material.dart';
import 'package:tonal/about.dart';
import 'package:tonal/carts.dart';
import 'package:tonal/category.dart';
import 'package:tonal/greet.dart';
import 'package:tonal/home.dart';
import 'package:tonal/mine.dart';
import 'package:tonal/prod.dart';
import 'package:tonal/search_result.dart';
import 'package:tonal/settings.dart';
import 'package:tonal/shop.dart';

class Router {
  static Map<String, WidgetBuilder> router = {
//  Navigator.push(context,
//  MaterialPageRoute(builder: (BuildContext context) => CartsPage()));
//  Navigator.push(context, MyPageRouteBuilder(CartsPage()));
    //路由
    '/greetPage': (BuildContext context) => GreetPage(),
    '/minePage': (BuildContext context) => MinePage(),
    '/homePage': (BuildContext context) => HomePage(),
    '/cartsPage': (BuildContext context) => CartsPage(),
    '/categoryPage': (BuildContext context) => CategoryPage(),
    '/searchPage': (BuildContext context) => SearchResultPage(),
    '/prodPage': (BuildContext context) => ProdPage(),
    '/shopPage': (BuildContext context) => ShopPage(),
    '/aboutPage': (BuildContext context) => AboutPage(),
    '/settingsPage': (BuildContext context) => SettingsPage(),
  };
}

class MyPageRouteBuilder extends PageRouteBuilder {
  final Widget widget;

  MyPageRouteBuilder(this.widget);
}
