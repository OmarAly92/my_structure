import 'package:flutter/material.dart';
import 'package:my_structure/core/utils/extensions.dart';

class LocaleDirectionHandler extends StatelessWidget {
  const LocaleDirectionHandler({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: context.isArabic ? (Matrix4.identity()..scale(-1.0, 1.0)) : Matrix4.identity(),
      child: child,
    );
  }
}
