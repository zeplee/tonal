import 'package:flutter/material.dart';
import 'package:tonal/helper/route_helper.dart';

import 'module/home/page/home_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //MaterialApp详解 https://www.jianshu.com/p/1d44ae246652
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
      title: 'Flutter Demo',
      //android 最近列表中的文字
      color: Colors.white,
      //android 最近列表中的背景色
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: RouteHelper.navigatorKey,
      routes: RouteHelper.routes,
//      onGenerateRoute: MaterialPageRoute(),
      initialRoute: RouteHelper.greetPage,
      home: HomePage(title: 'HomePage'),
    );
  }

//  static Route<dynamic> _onGenerateRoute(RouteSettings settings) {
//    return AppPageRouteBuilder(
//        builder: (context) => OnboardingScreen(), settings: settings);
//  }
}
