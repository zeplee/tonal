import 'package:flutter/material.dart';

//非弹窗组件
class CommonDlg extends Dialog {
  final Widget child;

  CommonDlg({@required this.child});

  show(BuildContext context) {}

  dismiss() {}
}
