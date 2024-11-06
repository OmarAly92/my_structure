import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xff323435).withOpacity(.4),
      highlightColor: const Color(0xff757575).withOpacity(.25),
      child: child,
    );
  }
}
