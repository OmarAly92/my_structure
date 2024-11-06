import 'package:my_structure/core/app_themes/colors/app_dynamic_colors.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.color,
    this.height,
    this.endIndent,
    this.indent,
    this.thickness,
  });

  final Color? color;
  final double? height;
  final double? endIndent;
  final double? indent;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppDynamicColors().divider,
      height: height ?? 0,
      endIndent: endIndent,
      indent: indent,
      thickness: thickness,
    );
  }
}
