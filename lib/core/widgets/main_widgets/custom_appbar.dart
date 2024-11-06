import 'package:my_structure/core/app_themes/text_style/app_text_style.dart';
import 'package:my_structure/core/widgets/main_widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    this.leading,
    this.title,
    this.titleText,
    this.actions,
    this.backgroundColor,
    this.centerTitle = true,
    this.elevation,
    this.leadingWidth,
    this.surfaceTintColor,
    super.key,
  });

  final Widget? leading;
  final Widget? title;
  final String? titleText;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool? centerTitle;
  final double? elevation;
  final double? leadingWidth;
  final Color? surfaceTintColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      centerTitle: centerTitle,
      elevation: elevation,
      leadingWidth: leadingWidth,
      leading: leading,
      title: buildTitle(),
      actions: actions,
      surfaceTintColor: surfaceTintColor ?? Colors.transparent,
      shadowColor: Colors.grey,
    );
  }

  Widget buildTitle() {
    return title ??
        AppText(
          titleText ?? '',
          style: AppTextStyle.styleAppbarTitle,
        );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
