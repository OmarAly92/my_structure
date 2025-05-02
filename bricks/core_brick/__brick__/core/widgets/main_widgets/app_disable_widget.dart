import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_structure/core/app_themes/colors/app_colors.dart';

class AppDisableWidget extends StatelessWidget {
  const AppDisableWidget({
    super.key,
    this.disable = false,
    this.tooltipMessage = '',
    required this.child,
    this.iconSize,
  });

  final bool disable;
  final Widget child;
  final String tooltipMessage;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipMessage,
      child: AbsorbPointer(
        absorbing: disable,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(opacity: .5, child: child),
            Icon(
              CupertinoIcons.lock_fill,
              color: AppColors.black,
              size: iconSize,
            ),
          ],
        ),
      ),
    );
  }
}
