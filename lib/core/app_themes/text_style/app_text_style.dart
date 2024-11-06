import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:my_structure/core/app_themes/text_style/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

sealed class AppTextStyle {
  static TextStyle get styleRegular12 => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.regular,
      );

  static TextStyle get styleMedium12 => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.medium,
      );

  static TextStyle get styleRegular13 => TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeightHelper.medium,
      );

  static TextStyle get styleRegular14 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.regular,
      );

  static TextStyle get styleRegularGrey14 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.medium,
        color: Colors.black.withOpacity(.5),
      );

  static TextStyle get styleMedium14 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.medium,
      );

  static TextStyle get styleSemiBold14 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.semiBold,
      );

  static TextStyle get styleBold14 => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle get styleRegular16 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.regular,
      );

  static TextStyle get styleMedium16 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.medium,
      );

  static TextStyle get styleSemiBold16 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.semiBold,
      );

  static TextStyle get styleBold16 => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle get styleSemiBold18 => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeightHelper.semiBold,
      );

  static TextStyle get styleBold18 => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle get styleMedium20 => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeightHelper.medium,
      );

  static TextStyle get styleSemiBold20 => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeightHelper.semiBold,
      );

  static TextStyle get styleBold20 => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle get styleBold20Blue => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeightHelper.bold,
        color: AppColors.blue,
      );

  static TextStyle get styleSemiBold24 => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeightHelper.semiBold,
      );

  static TextStyle get styleAppbarTitle => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle get styleCarGauge => TextStyle(
        fontSize: 22.spMax,
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle get styleBold40 => TextStyle(
        fontSize: 40.sp,
        fontWeight: FontWeightHelper.bold,
      );
}
