// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:portfolio/core/values/constants.dart';

class CloudEntity {
  double dx = Random().nextDouble();
  double dy = Random().nextDouble();
  double speed = 0.5 + Random().nextDouble() * 1;
  double width = 0.25 + Random().nextDouble() * 0.7;
  CloudEntity();

  void update(double deltaTime) {
    if (dx < -width) {
      dx = 1;
      dy = Random().nextDouble();
      width = 0.25 + Random().nextDouble() * 0.7;
      speed = 0.5 + Random().nextDouble() * 1;
    }
    dx -= deltaTime * speed * simulationSpeed;
  }

  @override
  String toString() => 'CloudEntity(speed: $speed, dx: $dx)';
}
