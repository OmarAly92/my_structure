import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AppAnimate extends StatelessWidget {
  const AppAnimate({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        horizontalOffset: 50,
        child: FadeInAnimation(child: child),
      ),
    );
  }
}
