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

  factory AppDynamicColors() {
    _instances ??= AppDynamicColors._internal();
    return _instances!;
  }

  @override
  Color get primaryColor => PrefHelper.get(PrefKeys.currentTheme) ?? false
      ? AppDarkColors().primaryColor
      : AppLightColors().primaryColor;

  @override
  Color get secondaryColor => PrefHelper.get(PrefKeys.currentTheme) ?? false
      ? AppDarkColors().secondaryColor
      : AppLightColors().secondaryColor;

  @override
  Color get mainColor => PrefHelper.get(PrefKeys.currentTheme) ?? false
      ? AppDarkColors().mainColor
      : AppLightColors().mainColor;

  @override
  Color get scaffoldBackground => PrefHelper.get(PrefKeys.currentTheme) ?? false
      ? AppDarkColors().primaryColor
      : AppLightColors().primaryColor;

  @override
  Color get appbarBackground => PrefHelper.get(PrefKeys.currentTheme) ?? false
      ? AppDarkColors().secondaryColor
      : AppLightColors().secondaryColor;

  @override
  Color get containerBackground =>
      PrefHelper.get(PrefKeys.currentTheme) ?? false
          ? AppDarkColors().secondaryColor
          : AppLightColors().secondaryColor;

  @override
  Color get listTileBackground => PrefHelper.get(PrefKeys.currentTheme) ?? false
      ? AppDarkColors().secondaryColor
      : AppLightColors().secondaryColor;

  @override
  Color get text => PrefHelper.get(PrefKeys.currentTheme) ?? false
      ? AppDarkColors().text
      : AppLightColors().text;

  @override
  Color get icon => PrefHelper.get(PrefKeys.currentTheme) ?? false
      ? AppDarkColors().icon
      : AppLightColors().icon;

  @override
  Color get button => PrefHelper.get(PrefKeys.currentTheme) ?? false
      ? AppDarkColors().mainColor
      : AppLightColors().mainColor;

  @override
  Color get subtitle =>  PrefHelper.get(PrefKeys.currentTheme) ?? false
      ? AppDarkColors().subtitle
      : AppLightColors().subtitle;

  @override
  Color get obdConnectContainer =>  PrefHelper.get(PrefKeys.currentTheme) ?? false
      ? AppDarkColors().obdConnectContainer
      : AppLightColors().obdConnectContainer;

  @override
  Color get divider => PrefHelper.get(PrefKeys.currentTheme) ?? false
      ? AppDarkColors().divider
      : AppLightColors().divider;
}
