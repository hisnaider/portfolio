import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TimeController {
  final ValueNotifier<double> elapsed = ValueNotifier(0);
  final ValueNotifier<double> simulationSpeed = ValueNotifier(1);
  late final Ticker _ticker;
  double _lastTime = 0;
  double delta = 0;

  TimeController(TickerProvider vsync) {
    _ticker = vsync.createTicker(
      (tickerElapsed) {
        final now = tickerElapsed.inMilliseconds / 1000;
        if (_lastTime == 0) {
          _lastTime = now; // inicializa no primeiro frame
          return;
        }
        delta = (now - _lastTime).clamp(0, 0.003);

        elapsed.value += delta * simulationSpeed.value;
        _lastTime = now;
      },
    );
  }

  void start() {
    _lastTime = 0;
    _ticker.start();
  }

  void stop() => _ticker.stop();
  void dispose() => _ticker.dispose();
}
