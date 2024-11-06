import 'package:my_structure/core/app_themes/colors/app_dynamic_colors.dart';
import 'package:flutter/material.dart';

class DotItem extends StatelessWidget {
  const DotItem({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isActive ? AppDynamicColors().mainColor : AppDynamicColors().containerBackground,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
