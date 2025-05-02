import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_structure/core/error_handling/failures/failure.dart';
import 'package:my_structure/core/utils/app_assets.dart';
import 'package:my_structure/core/utils/app_constants.dart';
import 'package:my_structure/core/widgets/main_widgets/app_assets_image.dart';
import 'package:my_structure/core/widgets/main_widgets/app_text.dart';
import 'package:my_structure/core/widgets/main_widgets/primary_button.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    this.failure,
    this.onPressed,
    this.isEmpty = false,
    this.image,
    this.errorButtonMessage,
  });

  final Failure? failure;
  final void Function()? onPressed;
  final bool isEmpty;
  final Widget? image;
  final String? errorButtonMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Column(
          children: [
            (image != null)
                ? image!
                : (isEmpty)
                ? const AppAssetsImage(AppAsset.errorImage, fit: BoxFit.contain)
                : AppAssetsImage(
                  failure?.statusCode == 404
                      ? AppAsset.errorImage
                      : AppAsset.errorImage,
                  fit: BoxFit.contain,
                ),
            const Gap(10),
            AppText(
              failure?.message ?? '',
              textAlign: TextAlign.center,
              maxLines: 3,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const Gap(30),
          ],
        ),
        if (onPressed == null)
          Visibility(
            visible: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.horizontalPadding,
              ),
              child: PrimaryButton.expand(
                text: errorButtonMessage ?? 'Reload Screen',
                onPressed: () {},
              ),
            ),
          ),
        if (onPressed != null)
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.horizontalPadding,
                ),
                child: PrimaryButton.expand(
                  text: errorButtonMessage ?? 'Reload Screen',
                  onPressed: onPressed,
                ),
              ),
              const Gap(AppConstants.bottomNavBarHeight + 24),
            ],
          ),
      ],
    );
  }
}
