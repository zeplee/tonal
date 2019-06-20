import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tonal/carts.dart';
import 'package:tonal/category.dart';
import 'package:tonal/global.dart';
import 'package:tonal/home.dart';
import 'package:tonal/mine.dart';
import 'package:tonal/prod.dart';
import 'package:tonal/searchResult.dart';
import 'package:tonal/shop.dart';

void main() {
  if (Platform.isAndroid) {
    //透明状态栏，android默认是半透明
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Global.init(context);
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          textSelectionColor: Colors.red,
        ),
        routes: {
          //路由
          'minePage': (BuildContext context) => MinePage(),
          'cartsPage': (BuildContext context) => CartsPage(),
          'categoryPage': (BuildContext context) => CategoryPage(),
          'searchPage': (BuildContext context) => SearchResultPage(),
          'prodPage': (BuildContext context) => ProdPage(),
        },
        home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  State createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List<Widget> mainPages = [
    HomePage(),
    CategoryPage(),
    ShopPage(),
    CartsPage(),
    MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //IndexedStack会初始化所有的页面，并且保存状态
//      body: IndexedStack(
//        index: currentIndex,
//        children: mainPages,
//      ),
      //每次都会重建页面
      body: mainPages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber[500],
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('分类'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            title: Text('店铺'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('购物车'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('我的'),
          ),
        ],
        onTap: onItemSelect,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void onItemSelect(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
