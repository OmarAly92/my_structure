import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppRefreshIndicator extends StatelessWidget {
  const AppRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: AppColors.secondary,
      color: AppColors.blue,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
