import 'package:flutter/material.dart';

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
          width: width ?? 50,
          height: height ?? 7,
          decoration: BoxDecoration(
            color: color ?? Colors.grey.shade300,
            borderRadius: borderRadius ?? BorderRadius.circular(40),
          ),
        ),
      );
    } else {
      return Container(
        width: width ?? 50,
        height: height ?? 7,
        decoration: BoxDecoration(
          color: color ?? Colors.grey.shade300,
          borderRadius: borderRadius ?? BorderRadius.circular(40),
        ),
      );
    }
  }
}
