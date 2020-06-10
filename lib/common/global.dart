import 'package:flutter/material.dart';
import 'package:flutter_base/flutter_base.dart';
import 'package:tonal/common/common.dart';
import 'package:tonal/module/module.dart';

///全局状态
class Global {
//  static const themes = [];
// 是否显示 Material design 基础布局网格，用来调试 UI 的工具
  static const debugShowMaterialGrid = false;

  // 显示性能标签 顶部覆盖一层GPU和UI曲线图，可即时查看当前流畅度情况
  static const showPerformanceOverlay = false;

  // 去除右上角debug的标签
  static const debugShowCheckedModeBanner = false;

  // 显示语义视图 打开Widget边框，类似Android开发者模式中显示布局边界
  static const showSemanticsDebugger = false;

  // 打开光栅缓存图像的检查板。
  static const checkerboardRasterCacheImages = false;

  // 检查离屏渲染  打开渲染到屏幕外位图的图层的checkerboarding
  static const checkerboardOffscreenLayers = false;

  // 显示布局边界-所有的盒子都会得到一个明亮的深青色边框，padding（来自widget如Padding）显示为浅蓝色，子widget周围有一个深蓝色框， 对齐方式（来自widget如Center和Align）显示为黄色箭头. 空白（如没有任何子节点的Container）以灰色显示
  static const debugPaintSizeEnabled = false;

  // 显示渲染顺序
  static const debugCheckElevationsEnabled = false;
  static const debugInstrumentationEnabled = false;

  // 做了类似的事情，但对于具有基线的对象，文字基线以绿色显示，表意(ideographic)基线以橙色显示。
  static const debugPaintBaselinesEnabled = false;

  // 用橙色或轮廓线标出每个层的边界
  static const debugPaintLayerBordersEnabled = false;

  // 显示点击反应区 标志打开一个特殊模式，任何正在点击的对象都会以深青色突出显示。 这可以帮助您确定某个对象是否以某种不正确地方式进行hit测试（Flutter检测点击的位置是否有能响应用户操作的widget）,例如，如果它实际上超出了其父项的范围，首先不会考虑通过hit测试
  static const debugPaintPointersEnabled = false;
  static const debugProfileBuildsEnabled = false;
  static const debugProfilePaintsEnabled = false;

  // widget重绘标记
  static const debugRepaintRainbowEnabled = false;

  // Text重绘标记
  static const debugRepaintTextRainbowEnabled = false;

  static const ThemeMode themeMode = ThemeMode.system;
  static ThemeData lightTheme = ThemeData(
    platform: TargetPlatform.android,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: Global.pageTransitionsTheme,
// primarySwatch: Colors.blue,//主题样本套件
    primaryColor: Colors.white,
    //次级色，决定大多数Widget的颜色，如进度条、开关,列表顶部水波纹回弹色
    accentColor: Colors.red,
//    primaryColorDark: Colors.white,
    //水波纹波纹色
    splashColor: Color(0x55ffffff),
    //水波纹底色
    highlightColor: Color(0x55ffffff),
//        dividerColor: Colors.pink,
//        cursorColor: Colors.red,
//        textSelectionColor: Colors.red,
//        hintColor: Colors.indigoAccent,
//        errorColor: Colors.indigoAccent,
//        canvasColor: Colors.yellow,
//        primaryColorBrightness: Brightness.dark,
  );
  static var darkTheme = ThemeData(
    //设置为ios,那么所有平台的列表都有越界回弹，列表滑动有滑动效果增量，有侧滑返回等ios平台的效果
    platform: TargetPlatform.iOS,
    visualDensity: VisualDensity.adaptivePlatformDensity,
//        pageTransitionsTheme: Global.pageTransitionsTheme,
    // primarySwatch: Colors.brown,//主题样本套件
    primaryColor: Colors.black,
//        primaryColorDark: Colors.black,
//        splashColor: Colors.red,
//        highlightColor: Colors.red,
//        dividerColor: Colors.pink,
//        cursorColor: Colors.red,
//        textSelectionColor: Colors.red,
//        hintColor: Colors.indigoAccent,
//        errorColor: Colors.indigoAccent,
//        canvasColor: Colors.yellow,
//        primaryColorBrightness: Brightness.dark,
  );

  //统一转场动画（会覆盖掉侧滑返回功能）
  static var pageTransitionsTheme = PageTransitionsTheme(builders: {
    TargetPlatform.android: FadePageTransitionsBuilder(),
    TargetPlatform.iOS: FadePageTransitionsBuilder(),
  });

  static const String BASE_URL = 'https://dalingjia.com';

  static const unknownPage = '/UnknownPage';
  static const errorPage = '/ErrorPage';

  static const greetPage = '/GreetPage';

  static const homePage = '/HomePage';
  static const homeDetail1Page = '/HomePage/HomeDetail1Page';
  static const homeDetail2Page = '/HomePage/HomeDetail2Page';
  static const homeDetail3Page = '/HomePage/HomeDetail3Page';
  static const homeDetail4Page = '/HomePage/HomeDetail4Page';
  static const homeDetail5Page = '/HomePage/HomeDetail5Page';
  static const homeDetail6Page = '/HomePage/HomeDetail6Page';
  static const homeDetail7Page = '/HomePage/HomeDetail7Page';
  static const homeDetail8Page = '/HomePage/HomeDetail8Page';
  static const homeDetail9Page = '/HomePage/HomeDetail9Page';
  static const homeDetail10Page = '/HomePage/HomeDetail10Page';
  static const homeDetail11Page = '/HomePage/HomeDetail11Page';
  static const homeDetail12Page = '/HomePage/HomeDetail12Page';
  static const homeDetail13Page = '/HomePage/HomeDetail13Page';
  static const homeDetail14Page = '/HomePage/HomeDetail14Page';

  static const shopIndexPage = '/ShopIndexPage';
  static const shopCartsPage = '/ShopCartsPage';

  ///路由方案1 routes+onUnknownRoute 默认使用MaterialPageRoute 无法单独设置转场动画，背景是黑色，统一转场动画可通过pageTransitionsTheme
  static Map<String, WidgetBuilder> routes = {
    errorPage: (BuildContext context) => ErrorPage(),
    unknownPage: (BuildContext context) => UnknownPage(),
    greetPage: (BuildContext context) => GreetPage(),
    homePage: (BuildContext context) => HomePage(),
    homeDetail1Page: (BuildContext context) => HomeDetail1Page(),
    homeDetail2Page: (BuildContext context) => HomeDetail2Page(),
    homeDetail3Page: (BuildContext context) => HomeDetail3Page(),
    homeDetail4Page: (BuildContext context) => HomeDetail4Page(),
    homeDetail5Page: (BuildContext context) => HomeDetail5Page(),
    homeDetail6Page: (BuildContext context) => HomeDetail6Page(),
    homeDetail7Page: (BuildContext context) => HomeDetail7Page(),
    homeDetail8Page: (BuildContext context) => HomeDetail8Page(),
    homeDetail9Page: (BuildContext context) => HomeDetail9Page(),
    homeDetail10Page: (BuildContext context) => HomeDetail10Page(),
    homeDetail11Page: (BuildContext context) => HomeDetail11Page(),
    homeDetail12Page: (BuildContext context) => HomeDetail12Page(),
    homeDetail13Page: (BuildContext context) => HomeDetail13Page(),
    homeDetail14Page: (BuildContext context) => HomeDetail14Page(),
    shopIndexPage: (BuildContext context) => ShopIndexPage(),
    shopCartsPage: (BuildContext context) => ShopCartsPage(),
  };

  static Route<dynamic> onUnknownRoute(RouteSettings setting) =>
      MaterialPageRoute(builder: (context) => UnknownPage());

  ///路由方案2 onGenerateRoute，可以定制单独PageRoute以及转场动画，界面背景透明 并可以设置默认动画，但是传参无法通过ModalRoute.of(context).settings.arguments获取
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    String routeName = settings.name;
    switch (routeName) {
      case errorPage:
        return RouteHelper.appPageRoute(ErrorPage());
      case unknownPage:
        return RouteHelper.appPageRoute(UnknownPage());
      case greetPage:
        return RouteHelper.appPageRoute(GreetPage());
      case homePage:
        return RouteHelper.appPageRoute(HomePage());
      case homeDetail1Page:
        return RouteHelper.appPageRoute(HomeDetail1Page());
      case homeDetail2Page:
        return RouteHelper.appPageRoute(HomeDetail2Page());
      case homeDetail3Page:
        return RouteHelper.appPageRoute(HomeDetail3Page());
      default:
//        return MaterialPageRoute(builder: (context) => UnknownPage());
        return RouteHelper.appPageRoute(UnknownPage());
    }
  }
}
