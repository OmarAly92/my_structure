import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:my_structure/core/app_themes/colors/app_dark_colors.dart';
import 'package:my_structure/core/app_themes/colors/app_light_colors.dart';
import 'package:my_structure/core/helpers/shared_preference/shared_preference_helper.dart';
import 'package:my_structure/core/helpers/shared_preference/shared_preference_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDynamicColors implements AppColors {
  AppDynamicColors._internal();

  static AppDynamicColors? _instances;

  static bool? isDark;

  factory AppDynamicColors() {
    isDark ??= PrefHelper.get(PrefKeys.currentTheme) ?? false;
    _instances ??= AppDynamicColors._internal();
    return _instances!;
  }

  @override
  Color get primaryColor =>
      isDark ?? false ? AppDarkColors().primaryColor : AppLightColors().primaryColor;

  @override
  Color get secondaryColor =>
      isDark ?? false ? AppDarkColors().secondaryColor : AppLightColors().secondaryColor;

  @override
  Color get mainColor => isDark ?? false ? AppDarkColors().mainColor : AppLightColors().mainColor;

  @override
  Color get scaffoldBackground =>
      isDark ?? false ? AppDarkColors().primaryColor : AppLightColors().primaryColor;

  @override
  Color get appbarBackground =>
      isDark ?? false ? AppDarkColors().secondaryColor : AppLightColors().secondaryColor;

  @override
  Color get containerBackground =>
      isDark ?? false ? AppDarkColors().secondaryColor : AppLightColors().secondaryColor;

  @override
  Color get listTileBackground =>
      isDark ?? false ? AppDarkColors().secondaryColor : AppLightColors().secondaryColor;

  @override
  Color get text => isDark ?? false ? AppDarkColors().text : AppLightColors().text;

  @override
  Color get icon => isDark ?? false ? AppDarkColors().icon : AppLightColors().icon;

  @override
  Color get button => isDark ?? false ? AppDarkColors().mainColor : AppLightColors().mainColor;

  @override
  Color get subtitle => isDark ?? false ? AppDarkColors().subtitle : AppLightColors().subtitle;

  @override
  Color get obdConnectContainer =>
      isDark ?? false ? AppDarkColors().obdConnectContainer : AppLightColors().obdConnectContainer;

  @override
  Color get divider => isDark ?? false ? AppDarkColors().divider : AppLightColors().divider;
}
