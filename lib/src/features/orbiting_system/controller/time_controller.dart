import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TimeController {
  final ValueNotifier<double> elapsed = ValueNotifier(0);
  final ValueNotifier<double> simulationSpeed = ValueNotifier(1);
  late final Ticker _ticker;
  final double targetFps = 120;
  late final double frameTime;
  double _accumulator = 0;
  double _lastTime = 0;
  double delta = 0;

  TimeController(TickerProvider vsync) {
    frameTime = 1 / targetFps;
    _ticker = vsync.createTicker(
      (tickerElapsed) {
        final now = tickerElapsed.inMilliseconds / 1000;
        if (_lastTime == 0) {
          _lastTime = now; // inicializa no primeiro frame
          return;
        }
        delta = frameTime;
        _lastTime = now;
        _accumulator += delta;

        while (_accumulator >= frameTime) {
          elapsed.value += frameTime;
          _accumulator -= frameTime;
        }
      },
    );
  }

  void start() {
    _lastTime = 0;
    _ticker.start();
  }

  void stop() => _ticker.stop();
  void dispose() {
    _ticker.stop();
    _ticker.dispose();
  }
}
