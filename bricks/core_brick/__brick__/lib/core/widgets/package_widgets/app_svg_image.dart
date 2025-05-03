import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppSvgImage extends StatelessWidget {
  const AppSvgImage({
    required this.path,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.cover,
    super.key,
    this.size,
  });

  final String path;
  final double? width;
  final double? height;
  final double? size;
  final Color? color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: size?.sp ?? width,
      height: size?.sp ?? height,
      fit: fit,
      colorFilter: color != null
          ? ColorFilter.mode(
        color!,
        BlendMode.srcIn,
      )
          : null,
    );
  }
}
