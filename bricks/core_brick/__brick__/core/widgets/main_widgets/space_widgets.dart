import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(key: key, height: height);
  }
}

class SliverVerticalSpace extends StatelessWidget {
  const SliverVerticalSpace(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(key: key, child: SizedBox(height: height));
  }
}

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(key: key, width: width);
  }
}

class SliverHorizontalSpace extends StatelessWidget {
  const SliverHorizontalSpace(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(key: key, child: SizedBox(width: width));
  }
}
