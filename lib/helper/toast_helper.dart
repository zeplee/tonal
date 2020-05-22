import 'package:flutter/material.dart';
import 'package:tonal/widget/toast.dart';

class ToastHelper {
  void showSimple() {}

  static void show(BuildContext context, String message, {int duration = 2}) {
    Toast.show(context, message, duration: duration);
  }
}
