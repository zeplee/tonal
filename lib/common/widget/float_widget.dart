import 'package:flutter/material.dart';

//悬浮组件-可定时消失 https://blog.csdn.net/qq_40836488/article/details/105715752
class FloatWidget {
  OverlayEntry _entry; // UI浮层
  final Widget child;

  FloatWidget({@required this.child});

  show(BuildContext context, {int duration}) {
    _entry = OverlayEntry(builder: (context) => child);
    Overlay.of(context)?.insert(_entry);
    if (duration != null) {
      Future.delayed(Duration(seconds: duration)).then((value) {
        _entry.remove();
      });
    }
  }

  dismiss() {
    _entry.remove();
  }
}
