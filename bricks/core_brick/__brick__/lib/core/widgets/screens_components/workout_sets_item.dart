import 'package:flutter/material.dart';
import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:my_structure/core/app_themes/text_style/app_text_style.dart';
import 'package:my_structure/core/widgets/main_widgets/app_text.dart';

class WorkoutSetsItem extends StatelessWidget {
  const WorkoutSetsItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.zn500,
      ),
      child: AppText(
        title,
        style: AppTextStyle.style12Light.copyWith(color: AppColors.zn200),
      ),
    );
  }
}
