import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/helper/helper.dart';

import 'common/global.dart';
import 'module/module.dart';

void main() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    //透明状态栏，android默认是半透明
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        //启动时状态栏字体颜色，进入后取得是appbar的Brightness
        statusBarIconBrightness: Brightness.light,
//          systemNavigationBarColor: Colors.transparent,
//          systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
  runZoned(
    () async {
      await init();
      runApp(App());
    },
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
//        collectLog(line); //收集日志
      },
    ),
    onError: (Object obj, StackTrace stack) {
//      collectError(obj, stack); //收集错误
    },
  );
}

init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) =>
      ErrorPage(errorDetails: errorDetails);
  debugPaintSizeEnabled = false;
  debugCheckElevationsEnabled = false;
  debugInstrumentationEnabled = false;
  debugPaintBaselinesEnabled = false;
  debugPaintLayerBordersEnabled = false;
  debugPaintPointersEnabled = false;
  debugProfileBuildsEnabled = false;
  debugProfilePaintsEnabled = false;
  debugRepaintRainbowEnabled = false;
  debugRepaintTextRainbowEnabled = false;
//  DebugFloat.init(context);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 是否显示 Material design 基础布局网格，用来调试 UI 的工具
      debugShowMaterialGrid: false,
      // 显示性能标签 顶部覆盖一层GPU和UI曲线图，可即时查看当前流畅度情况
      showPerformanceOverlay: false,
      // 去除右上角debug的标签
      debugShowCheckedModeBanner: true,
      // 显示语义视图 打开Widget边框，类似Android开发者模式中显示布局边界
      showSemanticsDebugger: false,
      // 打开光栅缓存图像的检查板。
      checkerboardRasterCacheImages: false,
      // 检查离屏渲染  打开渲染到屏幕外位图的图层的checkerboarding
      checkerboardOffscreenLayers: false,
      //android 最近列表中的文字 web标签名
      title: 'tonal',
      //android 最近列表中的背景色
      color: Colors.white,
      theme: ThemeData(
        //开启侧滑返回
        platform: TargetPlatform.iOS,
        primaryColor: Colors.white,
        primaryColorDark: Colors.white,
//        primarySwatch: Colors.blue,//主题样本套件
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        primaryColorDark: Colors.black,
        platform: TargetPlatform.iOS,
//        primarySwatch: Colors.brown,//主题样本套件
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.system,
      navigatorKey: RouteHelper.navigatorKey,
      routes: Global.routes,
//      onGenerateRoute: RouteHelper.onGenerateRoute,
      onUnknownRoute: Global.onUnknownRoute,
      initialRoute: Global.greetPage,
      home: HomePage(),
    );
  }
}
