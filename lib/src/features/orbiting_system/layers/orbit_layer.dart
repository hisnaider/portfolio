import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/src/features/orbiting_system/entities/camera.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';

class OrbitLayer extends StatelessWidget {
  const OrbitLayer(
      {super.key,
      required this.showOrbit,
      required this.celestialBody,
      required this.camera});
  final List<CelestialBody> celestialBody;
  final bool showOrbit;
  final Camera camera;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: showOrbit ? 1 : 0,
      duration: Duration(milliseconds: 250),
      child: IgnorePointer(
        child: CustomPaint(
          size: Size.infinite,
          painter: _OrbitLayerPainter(
            celestialBody,
            camera,
          ),
        ),
      ),
    );
  }
}

class _OrbitLayerPainter extends CustomPainter {
  final List<CelestialBody> celestialBody;
  final Camera camera;
  _OrbitLayerPainter(
    this.celestialBody,
    this.camera,
  );
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(camera.offset.dx, camera.offset.dy);
    canvas.scale(camera.zoom);
    final center = Offset(size.width / 2, size.height / 2);
    for (CelestialBody body in celestialBody) {
      if (body is PlanetEntity) {
        final orbitRect = Rect.fromCenter(
          center: center,
          width: body.orbitRadius * 2,
          height: body.verticalRadius * 2,
        );
        final orbitPaint = Paint()
          ..color = Colors.white12
          ..style = PaintingStyle.stroke;
        canvas.drawOval(orbitRect, orbitPaint);
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
