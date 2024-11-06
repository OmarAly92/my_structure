import 'package:flutter/material.dart';

abstract class AppColors {
  /// Global App color
  static const Color blueGreyOpacity15 = Color(0x26607D8B);
  static const Color blueGreyOpacity2 = Color(0x33607D8B);
  static const Color blue = Color(0xFF007AFF);
  static const Color green = Color(0xff34C759);
  static const Color red = Color(0xffcf152a);
  static const Color hint = Color(0xFFBDBDBD);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  ///* For Dynamic Colors
  /// Global Widget UI Colors
  Color get primaryColor;

  Color get secondaryColor;

  Color get mainColor;

  Color get scaffoldBackground;

  Color get appbarBackground;

  Color get containerBackground;

  Color get listTileBackground;

  Color get text;

  Color get icon;

  Color get button;

  Color get subtitle;

  Color get divider;

  /// Special Widgets UI Colors
  Color get obdConnectContainer;
}
