import 'package:flutter/material.dart';

//无效
class Global {
  static BuildContext mContext;

  static init(BuildContext context) {
    mContext = context;
  }
}
