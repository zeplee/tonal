import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:tonal/common/global.dart';

import 'widget.dart';

///调试悬浮球
class DebugFloat {
  static FloatWidget _float;

  static _buildWidget() {
    return Wrap(
      children: [
        FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.ac_unit),
        ),
        RaisedButton(
          child: Text('关闭'),
          onPressed: () {
            dismiss();
          },
        ),
      ],
    );
  }

  static init(BuildContext context) {
    if (_float == null) {
      _float = FloatWidget(
        child: DragWidget(
          offset: Offset(0, 0),
          child: _buildWidget(),
        ),
      );
    }
    if (Global.IS_DEBUG()) {
      show(context);
    }
  }

  static show(BuildContext context) {
    SpUtil.putBool(Global.SPKEY_IS_DEBUG, true);
    _float.show(context);
  }

  static dismiss() {
    SpUtil.putBool(Global.SPKEY_IS_DEBUG, false);
    _float.dismiss();
  }
}
