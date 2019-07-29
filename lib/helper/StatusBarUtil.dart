//import 'package:flutter/material.dart';
//
//class StatusBarUtil {
//  static List<String> lightRouteNameList = [
//    TaskhallPage.sName,
//    //...
//  ];
//  static List darkRoutNameList = [
//    SplashPage.sName,
//    LoginPage.sName,
//    MainPage.sName,
//    //...
//  ];
//
//  static init() {
//    NavigatorManager.getInstance().streamController.stream.listen((state) {
//      setupStatusBar(state[state.length - 1]);
//    })
//  }
//
//  setupStatusBar(Route currentRoute) {
//    if (lightRouteNameList.contains(currentRoute.settings.name)) {
//      setLight();
//    } else if (darkRoutNameList.contains(currentRoute.settings.name)) {
//      setDart();
//    }
//  }
//}
