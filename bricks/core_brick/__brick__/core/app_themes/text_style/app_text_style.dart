import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:my_structure/core/app_themes/text_style/font_weight_helper.dart';

sealed class AppTextStyle {
  /// Style Generator
  static TextStyle _textStyle(double size, FontWeight weight) {
    return TextStyle(
      fontSize: size.spMin,
      color: AppColors.white,
      fontWeight: weight,
    );
  }

  /// Text Styles from size 12 to 24
  static TextStyle get style12Light => _textStyle(12, FontWeightHelper.light);

  static TextStyle get style12Medium => _textStyle(12, FontWeightHelper.medium);

  static TextStyle get style14Light => _textStyle(14, FontWeightHelper.light);

  static TextStyle get style14Regular =>
      _textStyle(14, FontWeightHelper.regular);

  static TextStyle get style14Medium => _textStyle(14, FontWeightHelper.medium);

  static TextStyle get style14SemiBold =>
      _textStyle(14, FontWeightHelper.semiBold);

  static TextStyle get style16Light => _textStyle(16, FontWeightHelper.light);

  static TextStyle get style16Regular =>
      _textStyle(16, FontWeightHelper.regular);

  static TextStyle get style16Medium => _textStyle(16, FontWeightHelper.medium);

  static TextStyle get style16SemiBold =>
      _textStyle(16, FontWeightHelper.semiBold);

  static TextStyle get style16Bold => _textStyle(16, FontWeightHelper.bold);

  static TextStyle get style18Medium => _textStyle(18, FontWeightHelper.medium);

  static TextStyle get style20Medium => _textStyle(20, FontWeightHelper.medium);

  static TextStyle get style18SemiBold =>
      _textStyle(18, FontWeightHelper.semiBold);

  static TextStyle get style20SemiBold =>
      _textStyle(20, FontWeightHelper.semiBold);

  static TextStyle get style20Bold => _textStyle(20, FontWeightHelper.bold);

  static TextStyle get style24Medium => _textStyle(24, FontWeightHelper.medium);

  static TextStyle get style24SemiBold => _textStyle(24, FontWeightHelper.semiBold);


}
