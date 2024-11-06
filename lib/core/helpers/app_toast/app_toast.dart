import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_structure/core/app_themes/colors/app_dynamic_colors.dart';

sealed class AppToast {
  static void showToast({
    required String message,
    ToastGravity? gravity,
    Color? color,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: color ?? AppDynamicColors().mainColor,
      textColor: textColor,
    );
  }
}
