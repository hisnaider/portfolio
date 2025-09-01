import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class CelestialBody {
  final double size;
  double depth;
  final Offset center;
  final Color color;
  Offset position = const Offset(0, 0);
  ui.Image? image;
  final ImageStyle imageStyle;
  final GlowStyle? glowStyle;

  CelestialBody({
    this.size = 0,
    this.depth = 0,
    this.center = const Offset(0, 0),
    required this.color,
    String? image,
    this.imageStyle = const ImageStyle(),
    this.glowStyle,
  }) {
    _init(image);
  }

  Future<void> _init(String? image) async {
    if (image != null) {
      if (image.endsWith('.svg')) {
        final PictureInfo pictureInfo =
            await vg.loadPicture(SvgAssetLoader(image), null);
        this.image = await pictureInfo.picture.toImage(
            pictureInfo.size.width.toInt(), pictureInfo.size.height.toInt());
        return;
      }
      final data = await rootBundle.load(image);
      final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
      final frame = await codec.getNextFrame();
      this.image = frame.image;
    }
  }
}

class ImageStyle {
  final Offset position;
  final double scale;
  final ColorFilter? color;
  const ImageStyle(
      {this.position = const Offset(0, 0), this.scale = 1, this.color});
}

class GlowStyle {
  final double glowOpacity;
  final double sigma;
  final BlurStyle blurStyle;
  const GlowStyle(
      {this.glowOpacity = 0.6,
      this.sigma = 15,
      this.blurStyle = BlurStyle.normal});
}
