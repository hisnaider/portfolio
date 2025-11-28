import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/transform_position.dart';

abstract class CelestialBody {
  String name;
  final String id;
  double depth = 0;
  Offset worldPosition = const Offset(0, 0);
  final TransformPosition transformPosition = TransformPosition();
  final double size;
  final double rotationSpeed;
  final Color color;

  CelestialBody({
    this.name = '',
    required this.size,
    required this.color,
    this.rotationSpeed = 0.5,
  }) : id = _generateId();
  static String _generateId() {
    final rand = Random();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomPart = rand.nextInt(1 << 31);
    return '$timestamp-$randomPart';
  }

  void update(double deltaTime);
}
