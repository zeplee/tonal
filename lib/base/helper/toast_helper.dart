import 'package:flutter/material.dart';
import 'package:tonal/base/widget/widget.dart';

//吐司
class ToastHelper {
  static CommonFloat _float;

  static Widget _getDefaultWidget(BuildContext context, String msg) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.7,
      ),
      alignment: Alignment.center,
      child: Center(
        child: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Material(
              child: Text(
                msg,
                style: TextStyle(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static show(BuildContext context, String msg, {int duration = 2}) {
    if (_float == null) {
      _float = CommonFloat(child: _getDefaultWidget(context, msg));
    }
    _float.show(context, duration: duration);
  }

  static dismiss() {
    _float.dismiss();
  }
}
