import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tonal/helper/page_transition.dart';
import 'package:tonal/helper/route_helper.dart';
import 'package:tonal/page/home.dart';

import 'page/main.dart';

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
//    Global.init(context);
    return MaterialApp(
        title: 'tonal',
        showSemanticsDebugger: false,
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
        onGenerateRoute: (setting) => PageRouteBuilder(
            pageBuilder: (BuildContext context, _, __) {
              return HomePage();
            },
            opaque: false,
            transitionDuration: new Duration(milliseconds: 200),
            transitionsBuilder:
                (___, Animation<double> animation, ____, Widget child) {
              return new FadeTransition(
                opacity: animation,
                child: new ScaleTransition(
                  scale: new Tween<double>(begin: 0.5, end: 1.0)
                      .animate(animation),
                  child: child,
                ),
              );
            }),
        home: MainPage());
  }
}
