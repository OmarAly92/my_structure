import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:my_structure/core/app_themes/colors/app_dynamic_colors.dart';
import 'package:my_structure/core/app_themes/text_style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:my_structure/core/app_themes/themes/app_dark_theme.dart';
import 'package:my_structure/core/app_themes/themes/app_light_theme.dart';

sealed class AppThemes {
  static ThemeData dark() {
    return AppDarkThemes.call();
  }

  static ThemeData light() {
    return AppLightThemes.call();
  }
}
