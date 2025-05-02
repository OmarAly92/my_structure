import 'package:my_structure/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

class AppListTile<T> extends StatelessWidget {
  const AppListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.contentPadding,
  }) : isSwitch = false,
       isRadio = false,
       isCheckBox = false,
       groupValue = null,
       radioValue = null,
       checkboxValue = null,
       switchValue = false;

  const AppListTile.withSwitch({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    required this.switchValue,
    this.onTap,
    this.contentPadding,
  }) : isSwitch = true,
       isRadio = false,
       isCheckBox = false,
       radioValue = null,
       checkboxValue = null,
       groupValue = null;

  const AppListTile.radio({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.groupValue,
    this.trailing,
    this.onTap,
    this.radioValue,
    this.contentPadding,
  }) : isRadio = true,
       isSwitch = false,
       isCheckBox = false,
       checkboxValue = null,
       switchValue = false;

  const AppListTile.checkBox({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    required this.checkboxValue,
    this.onTap,
    this.contentPadding,
  }) : isRadio = false,
       isSwitch = false,
       isCheckBox = true,
       radioValue = null,
       groupValue = null,
       switchValue = false;

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final void Function()? onTap;

  /// For Radio Widget
  final bool isRadio;
  final Object? radioValue;
  final T? groupValue;

  /// For CheckBox Widget
  final bool isCheckBox;
  final bool? checkboxValue;

  /// For Switch Widget
  final bool isSwitch;
  final bool switchValue;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: buildTrailing(),
      contentPadding: contentPadding,
      shape: RoundedRectangleBorder(
        borderRadius: AppConstants.borderRadiusCircular,
        // BorderRadius.circular(15),
      ),
      onTap: onTap,
    );
  }

  Widget? buildTrailing() {
    if (isSwitch) {
      return Switch(value: switchValue, onChanged: (value) => onTap?.call());
    } else if (isRadio) {
      return Radio.adaptive(
        value: radioValue,
        groupValue: groupValue,
        onChanged: (value) => onTap?.call(),
      );
    } else if (isCheckBox) {
      return Checkbox(
        value: checkboxValue,
        onChanged: (value) => onTap?.call(),
      );
    } else {
      return trailing;
    }
  }
}
