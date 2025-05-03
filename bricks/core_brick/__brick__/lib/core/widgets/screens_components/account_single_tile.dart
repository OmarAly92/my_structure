import 'package:flutter/material.dart';
import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:my_structure/core/app_themes/text_style/app_text_style.dart';
import 'package:my_structure/core/utils/extensions.dart';
import 'package:my_structure/core/widgets/main_widgets/app_container.dart';
import 'package:my_structure/core/widgets/main_widgets/app_text.dart';
import 'package:my_structure/core/widgets/main_widgets/space_widgets.dart';
import 'package:my_structure/core/widgets/package_widgets/app_svg_image.dart';

class AccountSingleTile extends StatelessWidget {
  const AccountSingleTile({
    super.key,
    required this.title,
    this.trailingText,
    this.trailingSvgIcon,
    this.onTap,
  });

  final String title;
  final String? trailingText;
  final String? trailingSvgIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      onTap: onTap,
      child: Row(
        children: [
          AppText(title, style: AppTextStyle.style16Regular),
          const Spacer(),
          if (trailingText != null) ...[
            AppText(trailingText!, style: AppTextStyle.style16Regular),
            const HorizontalSpace(16),
          ],
          Visibility(
            visible: trailingSvgIcon != null,
            replacement: Icon(
              context.isArabic
                  ? Icons.keyboard_arrow_left_outlined
                  : Icons.keyboard_arrow_right_outlined,
              color: AppColors.black,
              size: 28,
            ),
            child: AppSvgImage(path: trailingSvgIcon ?? '', size: 32),
          ),
        ],
      ),
    );
  }
}
