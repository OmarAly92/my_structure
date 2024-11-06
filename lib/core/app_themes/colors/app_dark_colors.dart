import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppDarkColors implements AppColors {
  AppDarkColors._internal();

  static AppDarkColors? _instances;

  factory AppDarkColors() {
    _instances ??= AppDarkColors._internal();
    return _instances!;
  }

  /// Global Widget UI Colors
  @override
  Color primaryColor = Color(0xff131316);

  @override
  Color secondaryColor = const Color(0xff212126);

  @override
  Color mainColor = AppColors.blue;

  @override
  Color scaffoldBackground = const Color(0xff131316);

  @override
  Color appbarBackground = const Color(0xff212126);

  @override
  Color containerBackground = const Color(0xff212126);

  @override
  Color listTileBackground = const Color(0xff212126);

  @override
  Color text = const Color(0xffFFFFFF);

  @override
  Color icon = const Color(0xffFFFFFF);

  @override
  Color button = const Color(0xff007AFF);

  @override
  Color subtitle = Colors.white.withOpacity(.55);

  @override
  Color get divider => Colors.grey.shade400.withOpacity(.1);

  /// Special Widgets UI Colors
  @override
  Color obdConnectContainer = Color(0xff212126);

}
