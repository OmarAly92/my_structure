import 'package:flutter/material.dart';
import 'package:my_structure/core/app_themes/colors/app_colors.dart';
import 'package:my_structure/core/app_themes/text_style/app_text_style.dart';
import 'package:my_structure/core/utils/app_constants.dart';
import 'package:my_structure/core/widgets/main_widgets/app_container.dart';
import 'package:my_structure/core/widgets/main_widgets/app_disable_widget.dart';
import 'package:my_structure/core/widgets/main_widgets/app_text.dart';

/// TODO: COLORS AND TEXT SIZE
class AppDropDown<T> extends StatelessWidget {
  const AppDropDown({
    super.key,
    this.isLoading = false,
    this.disable = false,
    this.failureMessage,
    required this.items,
    required this.title,
    this.onSelected,
    this.retryRequestOnFailure,
  });

  final bool isLoading;
  final bool disable;
  final String? failureMessage;
  final String title;
  final List<PopupMenuEntry<T>> items;
  final void Function(T value)? onSelected;
  final void Function()? retryRequestOnFailure;

  @override
  Widget build(BuildContext context) {
    return AppDisableWidget(
      disable: disable,
      iconSize: 21,
      child: PopupMenuButton<T>(
        position: PopupMenuPosition.under,
        padding: EdgeInsets.zero,
        menuPadding: EdgeInsets.zero,
        iconSize: 0,
        elevation: 0,
        color: AppColors.zn800,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        constraints: const BoxConstraints(maxWidth: 155, minWidth: 155),
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),

        ),
        itemBuilder: (BuildContext context) => items,
        onSelected: onSelected,
        child: AppContainer(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Center(
            child: AppText(
              title,
              style: AppTextStyle.style14Light.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget buildTrailing() {
  //   if (isLoading) {
  //     return const SizedBox(
  //       height: 20,
  //       width: 20,
  //       child: CircularProgressIndicator(strokeWidth: 3),
  //     );
  //   } else if (failureMessage != null) {
  //     return SizedBox(
  //       height: 20,
  //       width: 20,
  //       child: IconButton(
  //         onPressed: retryRequestOnFailure,
  //         tooltip: failureMessage,
  //         style: IconButton.styleFrom(
  //           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //           padding: EdgeInsets.zero,
  //         ),
  //         icon: const Icon(Icons.error, size: 20, color: AppColors.red),
  //       ),
  //     );
  //   } else {
  //     return const Icon(Icons.keyboard_arrow_down, size: 20);
  //   }
  // }
}
