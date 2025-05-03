import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_structure/core/utils/app_assets.dart';
import 'package:my_structure/core/utils/extensions.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage(
    this.imageUrl, {
    super.key,
    this.fit,
    this.width,
    this.height,
  });

  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit ?? BoxFit.contain,
      width: width ?? context.width,
      height: height ?? context.width,
      errorWidget:
          (context, url, error) => Image.asset(
            AppAsset.errorImage,
            fit: fit ?? BoxFit.contain,
            width: width ?? context.width,
            height: height ?? context.width,
          ),
      placeholder:
          (context, url) => Image.asset(
            AppAsset.errorImage,
            fit: fit ?? BoxFit.contain,
            width: width ?? context.width,
            height: height ?? context.width,
          ),
    );
  }
}
