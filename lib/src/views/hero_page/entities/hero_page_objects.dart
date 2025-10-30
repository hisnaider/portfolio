import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/constants.dart';

abstract class HeroPageObjects {
  double depth = 0;
  final double size;
  final Color color;
  Offset position = Offset.zero;
  ui.Image? image;

  HeroPageObjects({
    required this.size,
    required this.color,
    required String image,
  }) {
    _init(image);
  }

  Future<void> _init(String image) async {
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

class MeStar extends HeroPageObjects {
  MeStar()
      : super(
          size: 150,
          color: const Color(0xffFFC082),
          image: Assets.photo,
        );
}

class MySkills extends HeroPageObjects {
  late final double verticalRadius;
  late final double normalizeRadius;
  final double horizontalRadius = 250;
  final double initialAngle;
  double angle = 0;
  MySkills({
    required super.image,
    required this.initialAngle,
  }) : super(size: 60, color: const Color(0xff3E3E49)) {
    angle = initialAngle * (pi / 180);
    verticalRadius = horizontalRadius * 0.5;
    normalizeRadius =
        (horizontalRadius + verticalRadius) / (horizontalRadius * 2);
    _updatePosition();
  }

  void update(double deltaTime) {
    angle += (2 / sqrt(normalizeRadius * horizontalRadius) * deltaTime);
    angle %= (2 * pi);

    _updatePosition();
  }

  void _updatePosition() {
    final _tiltRadian = -30 * (pi / 180);
    final x = horizontalRadius * cos(angle);
    final y = verticalRadius * sin(angle);
    depth = sin(angle) * horizontalRadius;
    final screenX = x * cos(_tiltRadian) - y * sin(_tiltRadian);
    final screenY = x * sin(_tiltRadian) + y * cos(_tiltRadian);

    // 4. Define a posição final na tela
    position = Offset(screenX, screenY);
  }
}
