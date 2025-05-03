import 'package:flutter/material.dart';

class AppSlider extends StatelessWidget {
  const AppSlider({
    super.key,
    this.min = 0.0,
    this.max = 100.0,
    this.label,
    required this.value,
    this.divisions,
    this.disable = false,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
  });

  final double min;
  final double max;
  final double value;
  final String? label;
  final int? divisions;
  final bool disable;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;

  @override
  Widget build(BuildContext context) {
    return Slider.adaptive(
      value: value,
      min: min,
      max: max,
      label: label,
      divisions: divisions,
      onChanged: disable ? null : onChanged,
      onChangeStart: onChangeStart,
      onChangeEnd: onChangeEnd,
    );
  }
}
