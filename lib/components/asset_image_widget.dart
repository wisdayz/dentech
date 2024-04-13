import 'package:flutter/material.dart';

//membuat widget gambar hanya dgn memberikan path gambar dan opsionalnya
class AssetImageWidget extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const AssetImageWidget({
    Key? key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}