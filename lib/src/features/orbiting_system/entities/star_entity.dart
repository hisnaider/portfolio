// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/core/commons/entities/celestial_body_glow_config.dart';
import 'package:portfolio/core/values/constants.dart';

class StarEntity extends CelestialBody {
  final StarGlow glow;
  final List<StarLayer> layers = [];
  final double energyConcentration;
  late final SolarCorona solarCorona;
  StarEntity({
    this.energyConcentration = 0.75,
    required this.glow,
    required super.name,
    required super.size,
    required super.color,
  }) {
    _init();
  }

  @override
  void update(double deltaTime) {
    solarCorona._update(deltaTime);
  }

  void _init() {
    solarCorona = SolarCorona().._init(size);
    for (int i = 0; i < 4; i++) {
      final double hue;
      final double layerSize;
      if (i == 0) {
        layerSize = size;
        hue = HSLColor.fromColor(color).hue - 18;
      } else if (i == 3) {
        layerSize = size * energyConcentration;
        hue = HSLColor.fromColor(color).hue;
      } else {
        layerSize = size - (((size - (size * energyConcentration)) / 3)) * (i);
        hue = HSLColor.fromColor(color).hue - (15 * ((4 - i) / 4));
      }
      final layerColor = HSLColor.fromColor(color).withHue(hue.abs()).toColor();
      layers.add(StarLayer(color: layerColor, size: layerSize));
    }
  }
}

class StarLayer {
  final Color color;
  final double size;
  StarLayer({
    required this.color,
    required this.size,
  });
}

class SolarCorona {
  final double intensity;
  final double strength;
  final double radiusBase;
  final int numPoints;
  List<CoronaSpike> spikes = [];
  SolarCorona({
    this.intensity = 0.25,
    this.strength = 0.5,
    this.radiusBase = 1.02,
    this.numPoints = 60,
  });

  void _init(double size) {
    spikes = List.generate(
      numPoints,
      (index) => CoronaSpike(radius: size),
    );
  }

  void _update(double deltaTime) {
    final double step = (pi * 2) / numPoints;

    for (int i = 0; i < numPoints; i++) {
      final double angle = i * step;
      final double radiusSpike =
          (20 * strength) * (0.25 + Random().nextDouble());
      final bool isSpike = Random().nextDouble() < _spikeProbability(intensity);

      final a = Random().nextDouble() * 3;
      spikes[i]._update(
          deltaTime * simulationSpeed, angle, isSpike ? radiusSpike : a);
    }
  }

  double _spikeProbability(double intensity) {
    const double maxProb = 0.25;
    const double minProb = 0.00001;
    double t = intensity.clamp(0.0, 1.0);
    const double exponent = 6;
    double prob = minProb + (maxProb - minProb) * pow(t, exponent);
    return prob;
  }
}

class CoronaSpike {
  double _radius;
  final double _minRadius;
  double _targetRadius;
  bool active = false;
  Offset point = Offset.zero;
  CoronaSpike({required double radius})
      : _radius = radius,
        _targetRadius = radius,
        _minRadius = radius;

  void _update(double deltaTime, double angle, double? radius) {
    if (radius != null && !active) {
      active = true;
      _targetRadius = _minRadius + radius;
    } else if ((_targetRadius - _radius).abs() < 1) {
      active = false;
      _targetRadius = _minRadius;
    }
    _radius += (_targetRadius - _radius) * deltaTime;
    point = Offset(_radius * cos(angle), _radius * sin(angle));
  }
}
