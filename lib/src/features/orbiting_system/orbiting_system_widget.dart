import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/features/orbiting_system/entities/celestial_body.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/star_entity.dart';
import 'package:portfolio/src/features/orbiting_system/widgets/planet_paint.dart';
import 'package:portfolio/src/features/orbiting_system/widgets/start_paint.dart';

class OrbitingSystemWidget extends StatefulWidget {
  const OrbitingSystemWidget({required this.celestialBody, super.key});
  final List<CelestialBody> celestialBody;

  @override
  State<OrbitingSystemWidget> createState() => _OrbitingSystemWidgetState();
}

class _OrbitingSystemWidgetState extends State<OrbitingSystemWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  double _lastTime = 0;
  double _deltaTime = 0;

  /// Zoom animation
  late AnimationController zoomController;
  late Animation<double> zoomAnimation;
  double _scale = 1;
  double _targetscale = 1;

  /// Move animation
  Offset _offset = Offset.zero;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(_update)
          ..repeat();

    ///
    /// Zoom init
    zoomController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    zoomAnimation = Tween<double>(begin: 1.0, end: 1.0)
        .animate(CurvedAnimation(parent: zoomController, curve: Curves.easeOut))
      ..addListener(() => setState(() => _scale = zoomAnimation.value));
  }

  void _update() {
    final now = _controller.lastElapsedDuration?.inMilliseconds ?? 0;
    final seconds = now / 1000.0;
    _deltaTime = seconds - _lastTime;
    _lastTime = seconds;
    setState(() {});
  }

  void updateZoom(double delta) {
    _targetscale = (_scale + delta).clamp(0.5, 10);
    zoomAnimation = Tween<double>(begin: _scale, end: _targetscale).animate(
        CurvedAnimation(parent: zoomController, curve: Curves.easeOut));
    zoomController.forward(from: 0);
  }

  void updateMove(PointerMoveEvent details) {
    setState(() {
      _offset += details.delta; // movimenta instantaneamente
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Listener(
        onPointerSignal: (event) {
          if (event is PointerScrollEvent) {
            updateZoom((event.scrollDelta.dy * 0.25) * -0.01);
            debugPrint("Scroll detectado: ${event.scrollDelta.dy}");
          }
        },
        onPointerMove: (event) {
          print(_offset);
          updateMove(event);
        },
        child: CustomPaint(
          painter: _CelestialBodyPaint(
              widget.celestialBody, _controller, _deltaTime, _scale, _offset),

          ///child: Container(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _CelestialBodyPaint extends CustomPainter {
  final Animation<double> animation;
  final List<CelestialBody> celestialBody;
  final double deltaTime;
  final double scale;
  final Offset offSet;

  _CelestialBodyPaint(this.celestialBody, this.animation, this.deltaTime,
      this.scale, this.offSet)
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(scale);
    canvas.translate(offSet.dx, offSet.dy);

    final center = Offset(size.width / 2, size.height / 2);

    celestialBody.sort((a, b) => a.depth.compareTo(b.depth));

    for (CelestialBody body in celestialBody) {
      final localPosition = Offset(
        center.dx + (body.position.dx - body.center.dx),
        center.dy + (body.position.dy - body.center.dy),
      );
      if (body is StarEntity) {
        StartPaint(
                deltaTime: deltaTime, localPosition: localPosition, star: body)
            .paint(canvas, size);
      } else if (body is PlanetEntity) {
        final orbitRect = Rect.fromCenter(
          center: center,
          width: body.horizontalRadius * 2,
          height: body.verticalRadius * 2,
        );

        final orbitPaint = Paint()
          ..color = Colors.white12
          ..style = PaintingStyle.stroke;
        canvas.drawOval(orbitRect, orbitPaint);
        PlanetPaint(
                deltaTime: deltaTime,
                localPosition: localPosition,
                planet: body)
            .paint(canvas, size);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
