import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppSliverGap extends StatelessWidget {
  const AppSliverGap(this.mainAxisExtent, {super.key});

  final double mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    return SliverGap(mainAxisExtent);
  }
}
