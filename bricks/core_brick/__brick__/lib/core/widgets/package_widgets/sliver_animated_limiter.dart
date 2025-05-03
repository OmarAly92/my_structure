import 'package:flutter/material.dart';

class SliverAnimationLimiter extends StatefulWidget {
  const SliverAnimationLimiter({super.key, required this.child});

  final Widget child;

  @override
  State<StatefulWidget> createState() => _SliverAnimationLimiterState();
}

class _SliverAnimationLimiterState extends State<SliverAnimationLimiter> {
  bool _allowAnimation = true; // true for first frame

  @override
  void initState() {
    super.initState();
    // After the first frame, schedule turning off animations for subsequent builds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _allowAnimation = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedAnimationLimiter(
      allowAnimation: _allowAnimation,
      child: widget.child,
    );
  }
}

// Inherited widget to provide the flag to all descendants (list children)
class _InheritedAnimationLimiter extends InheritedWidget {
  final bool allowAnimation;

  const _InheritedAnimationLimiter({
    required super.child,
    required this.allowAnimation,
  });

  @override
  bool updateShouldNotify(_InheritedAnimationLimiter old) {
    // Notify dependents if the flag changes (true -> false after first frame)
    return allowAnimation != old.allowAnimation;
  }

  // static bool shouldRunAnimation(BuildContext context) {
  //   final _InheritedAnimationLimiter? limiter =
  //       context
  //           .dependOnInheritedWidgetOfExactType<_InheritedAnimationLimiter>();
  //   // Default to true if no limiter found
  //   return limiter?.allowAnimation ?? true;
  // }
}
