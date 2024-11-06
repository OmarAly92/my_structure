import 'package:flutter/material.dart';
import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:my_structure/core/app_themes/colors/app_dynamic_colors.dart';
import 'package:my_structure/core/app_themes/text_style/app_text_style.dart';

sealed class AppLightThemes {
  static ThemeData call() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppDynamicColors().scaffoldBackground,
      fontFamily: 'SairaSemiCondensed',
      fontFamilyFallback: [
        'Cairo',
      ],
      appBarTheme: AppBarTheme(
        color: AppDynamicColors().appbarBackground,
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        primary: AppColors.blue,
      ),
      switchTheme: SwitchThemeData(
        thumbIcon: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? Icon(
                  Icons.check,
                  color: AppDynamicColors().mainColor,
                  size: 20,
                )
              : Icon(
                  Icons.close,
                  size: 20,
                ),
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? AppDynamicColors().mainColor
              : AppColors.white,
        ),
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? AppColors.white
              : AppDynamicColors().mainColor,
        ),
        trackOutlineColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected) ? null : AppDynamicColors().mainColor,
        ),
      ),
      badgeTheme: BadgeThemeData(
        backgroundColor: AppColors.red,
      ),
      sliderTheme: SliderThemeData(
        trackHeight: 7,
        activeTrackColor: AppDynamicColors().mainColor,
        inactiveTrackColor: AppDynamicColors().secondaryColor,
        thumbColor: AppDynamicColors().mainColor,
        overlayColor: AppDynamicColors().mainColor.withOpacity(0.3),
        valueIndicatorColor: AppDynamicColors().mainColor,
        showValueIndicator: ShowValueIndicator.onlyForContinuous,
        valueIndicatorStrokeColor: AppDynamicColors().mainColor,
        valueIndicatorTextStyle: AppTextStyle.styleMedium14.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
