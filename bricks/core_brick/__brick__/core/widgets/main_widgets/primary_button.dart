import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:my_structure/core/app_themes/text_style/app_text_style.dart';
import 'package:my_structure/core/utils/app_constants.dart';
import 'package:my_structure/core/widgets/main_widgets/app_text.dart';
import 'package:my_structure/core/widgets/main_widgets/space_widgets.dart';
import 'package:my_structure/core/widgets/package_widgets/app_svg_image.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.textColor,
    this.borderRadius,
    required this.onPressed,
    this.isExpand = false,
    this.padding,
    this.isLoading = false,
    this.fixedSize,
    this.svgIconPath,
  });

  const PrimaryButton.expand({
    super.key,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.textColor,
    this.borderRadius,
    required this.onPressed,
    this.isExpand = true,
    this.padding,
    this.isLoading = false,
    this.fixedSize,
    this.svgIconPath,
  });

  final String text;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? textColor;
  final Size? fixedSize;
  final bool isExpand;
  final bool isLoading;
  final BorderRadiusGeometry? borderRadius;
  final void Function()? onPressed;
  final String? svgIconPath;

  @override
  Widget build(BuildContext context) {
    if (isExpand) {
      return Row(
        children: [
          Expanded(
            child: buildElevatedButton(),
          ),
        ],
      );
    } else {
      return buildElevatedButton();
    }
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      style: buildButtonStyleFrom(),
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading
          ? const Center(
              child: SpinKitThreeBounce(
                color: AppColors.primary,
                size: 35,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text,
                  style: textStyle ??
                      AppTextStyle.style18Medium.copyWith(
                        color: textColor ?? Colors.black,
                      ),
                ),
                const HorizontalSpace(8),
                if (svgIconPath != null)
                  AppSvgImage(
                    color: AppColors.white,
                    path: svgIconPath!,
                  ),
              ],
            ),
    );
  }

  ButtonStyle buildButtonStyleFrom() {
    return ElevatedButton.styleFrom(
      padding: padding,
      fixedSize: fixedSize ?? const Size.fromHeight(48),
      foregroundColor: foregroundColor ?? AppColors.primary,
      backgroundColor: backgroundColor ?? AppColors.mainColor,
      disabledBackgroundColor: backgroundColor ?? AppColors.zn300,
      disabledForegroundColor: foregroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? AppConstants.borderRadiusCircularButton,
      ),
    );
  }
}
