import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:tonal/base/constants.dart';

import 'widget.dart';

///调试悬浮球
class DebugFloat {
  static CommonFloat _float;

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
      _float = CommonFloat(
        child: CommonDrag(
          offset: Offset(0, 0),
          child: _buildWidget(),
        ),
      );
    }
    if (Constants.IS_DEBUG()) {
      show(context);
    }
  }

  static show(BuildContext context) {
    SpUtil.putBool(Constants.SPKEY_IS_DEBUG, true);
    _float?.show(context);
  }

  static dismiss() {
    SpUtil.putBool(Constants.SPKEY_IS_DEBUG, false);
    _float?.dismiss();
  }
}
