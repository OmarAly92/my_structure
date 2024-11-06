import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_structure/core/app_themes/text_style/app_text_style.dart';
import 'package:my_structure/core/widgets/main_widgets/app_text.dart';

sealed class AppDialogs {
  static void showErrorDialog(
    BuildContext context, {
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: AppText(
            message,
            style: AppTextStyle.styleRegular16,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: AppTextStyle.styleBold14,
              ),
              child: const AppText('Ok'),
            ),
          ],
        );
      },
    );
  }
}
