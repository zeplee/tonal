import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tonal/helper/global.dart';
import 'package:tonal/helper/route_helper.dart';
import 'package:tonal/page/carts.dart';
import 'package:tonal/page/category.dart';
import 'package:tonal/page/home.dart';
import 'package:tonal/page/mine.dart';
import 'package:tonal/page/myshop.dart';

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
        title: 'tonal',
        showSemanticsDebugger: false,
        color: Colors.white,
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          }),
          primaryColor: Colors.white,
          textSelectionColor: Colors.red,
        ),
        routes: RouteHelper.routes,
        initialRoute: '/greetPage',
//        onGenerateRoute: (setting) => new PageRouteBuilder(
//            pageBuilder: (BuildContext context, _, __) {
//              //这里为返回的Widget
//              return HomePage();
//            },
//            opaque: false,
//            //跳转动画
//            transitionDuration: new Duration(milliseconds: 200),
//            transitionsBuilder:
//                (___, Animation<double> animation, ____, Widget child) {
//              return new FadeTransition(
//                opacity: animation,
//                child: new ScaleTransition(
//                  scale: new Tween<double>(begin: 0.5, end: 1.0)
//                      .animate(animation),
//                  child: child,
//                ),
//              );
//            }),
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
  Widget build(BuildContext context) => Scaffold(
        //IndexedStack会初始化所有的页面，并且保存状态
        body: IndexedStack(
          index: currentIndex,
          children: mainPages,
        ),
        //每次都会重建页面
//      body: mainPages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          fixedColor: Colors.blueAccent,
          selectedFontSize: 13.0,
          unselectedFontSize: 13.0,
          type: BottomNavigationBarType.fixed,
          items: mainNaviItems,
          onTap: onNaviItemSelect,
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          child: Icon(Icons.add),
          onPressed: () {
            //重新创建首页
//            Navigator.pushNamedAndRemoveUntil(
//                context, '/mainPage', (Route route) => false);
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
              currentIndex = 0;
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );

  void onNaviItemSelect(int index) => setState(() {
        currentIndex = index;
      });
}
