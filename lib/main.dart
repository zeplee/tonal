import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tonal/helper/page_transition.dart';
import 'package:tonal/helper/route_helper.dart';

import 'page/index.dart';

void main() {
  //https://www.jianshu.com/p/9409845d8794
  //https://www.jianshu.com/p/b931c05b0df9
  try {
    //web平台时会无法通过，所以try catch
    if (Platform.isAndroid) {
      //透明状态栏，android默认是半透明
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          //启动时状态栏字体颜色，进入后取得是appbar的Brightness
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark));
    }
  } catch (e, stack) {
    print(e);
  } finally {
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    Global.init(context);
    return MaterialApp(
        showSemanticsDebugger: false,
        //最近列表中的文字和背景
        title: 'tonal',
        color: Colors.white,
        //https://www.jianshu.com/p/8d8ded72e673
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: FadePageTransitionsBuilder(),
            TargetPlatform.iOS: FadePageTransitionsBuilder(),
          }),
          primaryColor: Colors.white,
//          scaffoldBackgroundColor: Colors.white,
          splashColor: Colors.red,
          highlightColor: Colors.red,
          dividerColor: Colors.pink,
          cursorColor: Colors.red,
          textSelectionColor: Colors.red,
          hintColor: Colors.indigoAccent,
          errorColor: Colors.indigoAccent,
//          canvasColor: Colors.yellow,
//          primaryColorBrightness: Brightness.dark,
        ),
        routes: RouteHelper.routes,
        initialRoute: RouteHelper.greetPage,
//        onGenerateRoute: (setting) => PageRouteBuilder(
//            pageBuilder: (BuildContext context, _, __) {
//              return MainPage();
//            },
//            opaque: false,
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
        home: IndexPage());
  }
}
