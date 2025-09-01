import 'package:portfolio/src/features/orbiting_system/entities/celestial_body.dart';

class StarEntity extends CelestialBody {
  StarEntity({
    required super.size,
    super.center,
    required super.color,
    super.image,
    super.imageStyle,
    required super.glowStyle,
  });
}
