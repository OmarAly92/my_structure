import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({
    super.key,
    required this.child,
    this.enabled = false,
  });

  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      enableSwitchAnimation: true,
      effect: const ShimmerEffect(
        baseColor: Color(0xFFf4f4f4),
        highlightColor: Color(0xFFe5e5e5),
      ),
      ignoreContainers: true,
      child: child,
    );
  }
}
