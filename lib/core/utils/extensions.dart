import 'package:easy_localization/easy_localization.dart';
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
  bool get isArabic => EasyLocalization.of(this)?.currentLocale == AppLocalization.arLocal;

  Future<void>? get setLocale async => await EasyLocalization.of(this)?.setLocale(locale);

  Locale get currentLocale => EasyLocalization.of(this)?.currentLocale ?? AppLocalization.enLocal;
}

extension AppTheme on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil(this, routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.pop(this);
}

extension ShowSnakbarExtension on BuildContext {
  void showSnackBar(String text, {Color? snackColor, Color? textColor}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: snackColor,
        content: AppText(
          text,
          maxLines: 1,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
