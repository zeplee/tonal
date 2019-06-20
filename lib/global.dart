import 'package:flutter/material.dart';
//无效
class Global {
  static BuildContext CONTEXT;

  static init(BuildContext context) {
    CONTEXT = context;
  }
}
