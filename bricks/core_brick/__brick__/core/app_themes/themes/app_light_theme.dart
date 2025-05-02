import 'package:flutter/material.dart';
import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:my_structure/core/app_themes/text_style/app_text_style.dart';

sealed class AppLightThemes {
  static ThemeData call() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      fontFamily: 'SairaSemiCondensed',
      fontFamilyFallback: [
        'Cairo',
      ],
      appBarTheme: const AppBarTheme(
        color: AppColors.appbarBackground,
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: AppColors.blue,
      ),
      switchTheme: SwitchThemeData(
        thumbIcon: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? const Icon(
                  Icons.check,
                  color: AppColors.mainColor,
                  size: 20,
                )
              : const Icon(
                  Icons.close,
                  size: 20,
                ),
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? AppColors.mainColor
              : AppColors.white,
        ),
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? AppColors.white
              : AppColors.mainColor,
        ),
        trackOutlineColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected) ? null : AppColors.mainColor,
        ),
      ),
      badgeTheme: const BadgeThemeData(
        backgroundColor: AppColors.red,
      ),
      sliderTheme: SliderThemeData(
        trackHeight: 7,
        activeTrackColor: AppColors.mainColor,
        inactiveTrackColor: AppColors.secondary,
        thumbColor: AppColors.mainColor,
        overlayColor: AppColors.mainColor.withOpacity(0.3),
        valueIndicatorColor: AppColors.mainColor,
        showValueIndicator: ShowValueIndicator.onlyForContinuous,
        valueIndicatorStrokeColor: AppColors.mainColor,
        valueIndicatorTextStyle: AppTextStyle.style14Medium.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
