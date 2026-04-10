import 'package:flutter/material.dart';

class OptimizedAssetImage extends StatelessWidget {
  const OptimizedAssetImage({
    required this.assetName,
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.borderRadius,
    this.alignment = Alignment.center,
    this.cacheWidth,
    this.cacheHeight,
  });

  final String assetName;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Alignment alignment;
  final int? cacheWidth;
  final int? cacheHeight;

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      assetName,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      filterQuality: FilterQuality.low,
      isAntiAlias: false,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );

    if (borderRadius != null) {
      image = ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }
}
