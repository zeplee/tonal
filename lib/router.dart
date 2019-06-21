import 'package:flutter/material.dart';
import 'package:tonal/about.dart';
import 'package:tonal/carts.dart';
import 'package:tonal/category.dart';
import 'package:tonal/mine.dart';
import 'package:tonal/settings.dart';
import 'package:tonal/shop.dart';

import 'prod.dart';
import 'search_result.dart';

class Router {
  static Map<String, WidgetBuilder> router = {
    //路由
    'minePage': (BuildContext context) => MinePage(),
    'cartsPage': (BuildContext context) => CartsPage(),
    'categoryPage': (BuildContext context) => CategoryPage(),
    'searchPage': (BuildContext context) => SearchResultPage(),
    'prodPage': (BuildContext context) => ProdPage(),
    'shopPage': (BuildContext context) => ShopPage(),
    'aboutPage': (BuildContext context) => AboutPage(),
    'settingsPage': (BuildContext context) => SettingsPage(),
  };
}
