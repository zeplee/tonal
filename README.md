# tonal

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


#TickerProviderStateMixin的界面的floatingActionButton不设置这个就会黑屏-why
heroTag: 'fda',

#https://www.jianshu.com/p/047eb78dce53
#顶部有一个listview，那么就会有问题，可能是listview里面默认加了一个padding
padding: EdgeInsets.all(0.0)
DefaultTabController与TabController区别：https://www.jianshu.com/p/fbd1d0e22f9c
router:https://blog.csdn.net/weixin_34999505/article/details/86760606 https://juejin.im/post/5c7d19f751882555a8223602
https://www.jianshu.com/p/307119ba0659
吸顶：1
https://www.jianshu.com/p/b5292ef7c38c
https://www.codercto.com/a/34161.html
https://www.cnblogs.com/pythonClub/p/10659521.html
https://blog.csdn.net/yumi0629/article/details/833056272
https://www.jianshu.com/p/d96508c9d174

--enable-software-rendering



# 规范
## 每行都要加逗号，格式化后代码更清晰，并且添加删除属性更方便
## 导包，多个同类型应该用一个工具包裹一下，这样只需要导入一个包即可
## ThemeData.dark().copyWith
## defaultTargetPlatform == TargetPlatform.android  与 try { if (Platform.isAndroid) {}效果相同  web平台时会无法通过，所以try catch