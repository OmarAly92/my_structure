import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:my_structure/core/helpers/localization/app_localization.dart';
import 'package:my_structure/core/widgets/main_widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;

  double get toPadding => MediaQuery.of(this).viewPadding.top;

  double get bottom => MediaQuery.of(this).viewInsets.bottom;

  Orientation get orientation => MediaQuery.of(this).orientation;

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isPortrait => orientation == Orientation.portrait;
}

extension AppLocaization on BuildContext {
  bool get isArabic =>
      EasyLocalization.of(this)?.currentLocale == AppLocalization.arLocal;

  Future<void>? get setLocale async =>
      await EasyLocalization.of(this)?.setLocale(locale);

  Locale get currentLocale =>
      EasyLocalization.of(this)?.currentLocale ?? AppLocalization.enLocal;
}

extension AppTheme on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}

extension HandleNullOrEmptyString on String? {
  bool get isNullOrEmpty => this == null || (this?.isEmpty ?? true);

  bool get isNotNullOrEmpty => this != null && (this?.isNotEmpty ?? false);
}

extension HandleNullOrEmptyList on List? {
  bool get isNullOrEmpty => this == null || (this?.isEmpty ?? true);

  bool get isNotNullOrEmpty => this != null && (this?.isNotEmpty ?? false);
}

extension HandleNullOrEmptyMap on Map? {
  bool get isNullOrEmpty => this == null || (this?.isEmpty ?? true);

  bool get isNotNullOrEmpty => this != null && (this?.isNotEmpty ?? false);
}

extension HandleNullInt on int? {
  bool get isNull => this == null;

  bool get isNotNull => this != null;
}

extension HandleNullNum on num? {
  bool get isNull => this == null;

  bool get isNotNull => this != null;
}

extension HandleNullDouble on double? {
  bool get isNull => this == null;

  bool get isNotNull => this != null;
}

extension ShowSnakbarExtension on BuildContext {
  void showSnackBar(String text, {Color? snackColor, Color? textColor}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 2000),
        backgroundColor: snackColor ?? AppColors.error,
        content: AppText(
          text,
          maxLines: 3,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
      rootNavigator: true,
    ).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
      rootNavigator: true,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return Navigator.of(
      this,
      rootNavigator: true,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.pop(this);
}

extension DatePicker on BuildContext {
  Future<DateTime?> showDatePickerDialog({DateTime? initialDate}) async {
    final DateTime today = DateTime.now();
    final DateTime initial = initialDate ?? today;

    final DateTime? pickedDate = await showDatePicker(
      context: this,
      initialDate: initial,
      firstDate: today,
      lastDate: today.add(const Duration(days: 356)),
    );

    return pickedDate;
  }
}
