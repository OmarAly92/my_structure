import 'package:my_structure/core/app_themes/colors/app_dynamic_colors.dart';
import 'package:my_structure/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

class AppContainerBackground extends StatelessWidget {
  const AppContainerBackground({
    super.key,
    required this.child,
    this.constraints,
    this.onTap,
    this.padding,
    this.margin,
    this.disable = false,
  });

  final Widget child;
  final BoxConstraints? constraints;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disable ? .5 : 1,
      child: Container(
        margin: margin,
        child: Material(
          color: AppDynamicColors().containerBackground,
          borderRadius: AppConstants.borderRadiusCircular,
          child: Container(
            padding: padding,
            constraints: constraints,
            decoration: BoxDecoration(
              borderRadius: AppConstants.borderRadiusCircular,
            ),
            child: onTap == null
                ? child
                : InkWell(
                    borderRadius: AppConstants.borderRadiusCircular,
                    onTap: onTap,
                    child: child,
                  ),
          ),
        ),
      ),
    );
  }
}
