import 'package:flutter/material.dart';
import 'package:my_structure/core/app_themes/colors/app_colors.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    super.key,
    this.centered = false,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
  });

  const BottomSheetContainer.centered({
    super.key,
    this.centered = true,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
  });

  final bool centered;
  final double? width;
  final double? height;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    if (centered) {
      return Center(
        child: Container(
          width: width ?? 45,
          height: height ?? 6,
          decoration: buildBoxDecoration(),
        ),
      );
    } else {
      return Container(
        width: width ?? 45,
        height: height ?? 6,
        decoration: buildBoxDecoration(),
      );
    }
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
          color: color ?? AppColors.zn300,
          borderRadius: borderRadius ?? BorderRadius.circular(40),
        );
  }
}
