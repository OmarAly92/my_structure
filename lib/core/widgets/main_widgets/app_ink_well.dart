import 'package:flutter/material.dart';

class AppInkWell extends StatelessWidget {
  const AppInkWell({
    super.key,
    this.child,
    this.onTap,
    this.borderRadius,
    this.overlayColor,
    this.splashColor,
  });

  final Widget? child;
  final void Function()? onTap;
  final BorderRadius? borderRadius;
  final WidgetStateProperty<Color?>? overlayColor;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      onTap: onTap,
      borderRadius: borderRadius,
      splashColor: splashColor,
      overlayColor: overlayColor,
      child: child,
    );
  }
}
