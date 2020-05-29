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

# 规范
## 每行都要加逗号，格式化后代码更清晰，并且添加删除属性更方便
## 导包，多个同类型应该用一个工具包裹一下，这样只需要导入一个包即可
## ThemeData.dark().copyWith
## defaultTargetPlatform == TargetPlatform.android  与 try { if (Platform.isAndroid) {}效果相同  web平台时会无法通过，所以try catch