import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/flutter_base.dart';
import 'package:tonal/common/common.dart';
import 'package:tonal/module/module.dart';

void main() {
  _handleUi();
  _handleSdk();
  _handleError();
}

_handleDebug() {
  debugPaintSizeEnabled = Global.debugPaintSizeEnabled;
  debugCheckElevationsEnabled = Global.debugCheckElevationsEnabled;
  debugInstrumentationEnabled = Global.debugInstrumentationEnabled;
  debugPaintBaselinesEnabled = Global.debugPaintBaselinesEnabled;
  debugPaintLayerBordersEnabled = Global.debugPaintLayerBordersEnabled;
  debugPaintPointersEnabled = Global.debugPaintPointersEnabled;
  debugProfileBuildsEnabled = Global.debugProfileBuildsEnabled;
  debugProfilePaintsEnabled = Global.debugProfilePaintsEnabled;
  debugRepaintRainbowEnabled = Global.debugRepaintRainbowEnabled;
  debugRepaintTextRainbowEnabled = Global.debugRepaintTextRainbowEnabled;
}

_handleUi() {
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
}

_handleSdk() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  //  DebugFloat.init(context);
}

_handleError() {
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    //收集Flutter异常发送给runZoned的onError
    Zone.current
        .handleUncaughtError(errorDetails.exception, errorDetails.stack);
    //定制错误页面
    return ErrorPage(errorDetails: errorDetails);
  };
  runZoned(
    () => runApp(App()),
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        if (!Constants.IS_DEBUG()) {
          // _reportLog(line); //收集日志
        }
      },
    ),
    onError: (Object obj, StackTrace stack) {
      if (!Constants.IS_DEBUG()) {
        // _reportError(obj, stack); //收集Dart异常
      }
    },
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _handleDebug();
    return MaterialApp(
      debugShowMaterialGrid: Global.debugShowMaterialGrid,
      showPerformanceOverlay: Global.showPerformanceOverlay,
      debugShowCheckedModeBanner: Global.debugShowCheckedModeBanner,
      showSemanticsDebugger: Global.showSemanticsDebugger,
      checkerboardRasterCacheImages: Global.checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: Global.checkerboardOffscreenLayers,

      title: 'tonal',
      color: Colors.white,

      theme: Global.lightTheme,
      darkTheme: Global.darkTheme,
      themeMode: Global.themeMode,

      navigatorKey: RouteHelper.navigatorKey,
//      routes: Global.routes,
      onGenerateRoute: Global.onGenerateRoute,
//      onUnknownRoute: Global.onUnknownRoute,
      initialRoute: Global.greetPage,
      home: HomePage(),
    );
  }
}
