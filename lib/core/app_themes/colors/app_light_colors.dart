import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppLightColors implements AppColors {
  AppLightColors._internal();

  static AppLightColors? _instances;

  factory AppLightColors() {
    _instances ??= AppLightColors._internal();
    return _instances!;
  }

  /// Global Widget UI Colors
  @override
  Color primaryColor = Color(0xffebebeb);

  @override
  Color secondaryColor = const Color(0x33607D8B);

  @override
  Color mainColor = AppColors.blue;

  @override
  Color scaffoldBackground = const Color(0xffebebeb);

  @override
  Color appbarBackground = const Color(0xffebebeb);

  @override
  Color containerBackground = Color(0x33607D8B);

  @override
  Color listTileBackground = Color(0x33607D8B);

  @override
  Color text = const Color(0xff000000);

  @override
  Color icon = const Color(0xff000000);

  @override
  Color button = const Color(0xff007AFF);

  @override
  Color subtitle = Colors.black.withOpacity(.5);

  @override
  Color divider = Colors.grey.shade400.withOpacity(.6);

  /// Special Widgets UI Colors
  @override
  Color obdConnectContainer = const Color(0xff30344d);
}
