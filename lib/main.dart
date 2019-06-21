import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tonal/carts.dart';
import 'package:tonal/category.dart';
import 'package:tonal/global.dart';
import 'package:tonal/home.dart';
import 'package:tonal/mine.dart';
import 'package:tonal/myshop.dart';
import 'package:tonal/router.dart';

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
        routes: Router.router,
        home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  State createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List<Widget> mainPages;
  List<BottomNavigationBarItem> mainNaviItems;

  @override
  void initState() {
    super.initState();
    mainPages = [
      HomePage(),
      CategoryPage(),
      MyShopPage(),
      CartsPage(),
      MinePage(),
    ];
    mainNaviItems = [
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
    ];
  }

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
        items: mainNaviItems,
        onTap: onItemSelect,
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            if (mainNaviItems.length == 5) {
              mainPages.removeAt(2);
              mainNaviItems.removeAt(2);
            } else {
              mainPages.insert(2, MyShopPage());
              mainNaviItems.insert(
                  2,
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shop),
                    title: Text('店铺'),
                  ));
            }
          });
        },
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
