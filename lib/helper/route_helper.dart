import 'package:flutter/material.dart';
import 'package:tonal/page/about.dart';
import 'package:tonal/page/carts.dart';
import 'package:tonal/page/category.dart';
import 'package:tonal/page/greet.dart';
import 'package:tonal/page/login.dart';
import 'package:tonal/page/index.dart';
import 'package:tonal/page/mine.dart';
import 'package:tonal/page/prod.dart';
import 'package:tonal/page/search_result.dart';
import 'package:tonal/page/settings.dart';
import 'package:tonal/page/shop.dart';

class RouteHelper {
  static const mainPage = '/mainPage';
  static const greetPage = '/greetPage';
  static const minePage = '/minePage';
  static const cartsPage = '/cartsPage';
  static const categoryPage = '/categoryPage';
  static const searchPage = '/searchPage';
  static const prodPage = '/prodPage';
  static const shopPage = '/shopPage';
  static const aboutPage = '/aboutPage';
  static const settingsPage = '/settingsPage';
  static const loginPage = '/loginPage';
  static Map<String, WidgetBuilder> routes = {
    mainPage: (BuildContext context) => IndexPage(),
    greetPage: (BuildContext context) => GreetPage(),
    minePage: (BuildContext context) => MinePage(),
    cartsPage: (BuildContext context) => CartsPage(),
    categoryPage: (BuildContext context) => CategoryPage(),
    searchPage: (BuildContext context) => SearchResultPage(),
    prodPage: (BuildContext context) => ProdPage(),
    shopPage: (BuildContext context) => ShopPage(),
    aboutPage: (BuildContext context) => AboutPage(),
    settingsPage: (BuildContext context) => SettingsPage(),
    loginPage: (BuildContext context) => LoginPage(),
  };
}

//    Navigator.push(context, MyPageRouteBuilder(CartsPage()));
class CustomPageRouteBuilder extends PageRouteBuilder {
  final Widget widget;

  CustomPageRouteBuilder(this.widget);
}
