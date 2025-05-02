import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:my_structure/core/app_themes/text_style/app_text_style.dart';
import 'package:my_structure/core/helpers/localization/locale_keys.g.dart';
import 'package:my_structure/core/widgets/main_widgets/app_ink_well.dart';
import 'package:my_structure/core/widgets/main_widgets/app_text.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      borderRadius: BorderRadius.circular(5.r),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.r)),
        child: AppText(
          LocaleKeys.edit.tr(context: context),
          style: AppTextStyle.style14Medium.copyWith(color: AppColors.zn300),
        ),
      ),
    );
  }
}
