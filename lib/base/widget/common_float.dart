import 'package:flutter/material.dart';

//悬浮组件-可定时消失,可多次添加
class CommonFloat {
  OverlayEntry _entry;
  final Widget child;

  CommonFloat({@required this.child});

  show(BuildContext context, {int duration, bool isRepeat = false}) {
    if (!isRepeat) {
      if (_entry == null && Overlay.of(context) != null) {
        _entry = OverlayEntry(builder: (context) => child);
        Overlay.of(context)?.insert(_entry);
      }
    } else {
      _entry = OverlayEntry(builder: (context) => child);
      Overlay.of(context)?.insert(_entry);
    }
    if (duration != null) {
      Future.delayed(Duration(seconds: duration)).then((value) {
        dismiss();
      });
    }
  }

  dismiss() {
    _entry.remove();
  }
}
