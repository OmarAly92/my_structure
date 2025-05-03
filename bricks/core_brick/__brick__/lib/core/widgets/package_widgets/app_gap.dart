import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@Deprecated('Use Vertical and Horizontal Space instead')
class AppGap extends StatelessWidget {
  const AppGap(this.mainAxisExtent, {super.key});

  final double mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    return Gap(mainAxisExtent);
  }
}
