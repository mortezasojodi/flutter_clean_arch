import 'package:flutter/material.dart';
import 'package:fluttertest/app/component/loading.dart';
import 'package:fluttertest/app/config/image_constants.dart';

Widget networkimage(String? imageSource,
    {String? errorWidget,
    double? width,
    double? height,
    double spinSize = 12,
    double? widthAssetImage,
    double? heightAssetImage,
    BoxFit? fit}) {
  return (imageSource != null && imageSource.isNotEmpty)
      ? Image.network(
          imageSource,
          errorBuilder: (context, url, error) => Image.asset(errorWidget ?? fan,
              width: width,
              height: height,
              color: Colors.white.withOpacity(0.3),
              colorBlendMode: BlendMode.modulate),
          loadingBuilder: (context, Widget, ImageChunkEvent) {
            if (ImageChunkEvent == null) return Widget;
            return apploading(size: spinSize);
          },
          width: width,
          height: height,
          fit: fit,
        )
      : Image.asset(errorWidget ?? fan,
          width: width == null ? null : widthAssetImage ?? (width - 10),
          height: height == null ? null : heightAssetImage ?? (height - 10),
          color: Colors.white.withOpacity(0.3),
          colorBlendMode: BlendMode.modulate);
}
