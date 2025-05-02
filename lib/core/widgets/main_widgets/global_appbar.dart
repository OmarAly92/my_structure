import 'package:flutter/material.dart';
import 'package:my_structure/core/app_themes/text_style/app_text_style.dart';
import 'package:my_structure/core/widgets/app_pop_icon.dart';
import 'package:my_structure/core/widgets/main_widgets/app_text.dart';

class GlobalAppbar extends StatelessWidget implements PreferredSizeWidget {
  const GlobalAppbar({
    this.leading,
    this.title,
    this.titleText,
    this.actions,
    this.backgroundColor,
    this.centerTitle = false,
    this.elevation,
    this.leadingWidth,
    this.surfaceTintColor,
    this.bottom,
    super.key,
  }) : _isSub = false;

  const GlobalAppbar.sub({
    this.leading,
    this.title,
    this.titleText,
    this.actions,
    this.backgroundColor,
    this.centerTitle = true,
    this.elevation,
    this.leadingWidth,
    this.surfaceTintColor,
    this.bottom,
    super.key,
  }) : _isSub = true;

  final bool _isSub;
  final Widget? leading;
  final Widget? title;
  final String? titleText;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double? elevation;
  final double? leadingWidth;
  final Color? surfaceTintColor;
  final bool? centerTitle;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      leading: _isSub ? leading ?? const AppPopIcon() : leading,
      title: buildTitle(),
      actions: actions,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,
      bottom: bottom,
    );
  }

  Widget? buildTitle() {
    if (title != null) {
      return title!;
    }

    if (titleText != null) {
      return AppText(
        titleText!,
        style: _isSub ? AppTextStyle.style16Bold : AppTextStyle.style24SemiBold,
      );
    }

    return null;
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? 56 : 56 + 50);
}
