import 'package:flutter/material.dart';

extension Normalize on double {
  double normalize(double max, {double min = 0}) {
    if (max == min) return 0;
    final n = (this - min) / (max - min);
    return n.clamp(0, 1);
  }
}
