import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body_glow_config.dart';
import 'package:portfolio/src/features/orbiting_system/entities/continent_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';

class Planets {
  const Planets._();

  static PlanetEntity raquel = PlanetEntity(
      name: 'Raquel Menopausa',
      orbitRadius: 200,
      initialAngle: 0,
      size: 2,
      color: Color(0xff3B574B),
      atmosphere: Atmosphere(height: 1.5, density: 1, color: Color(0xffDDE6CD)),
      rotationSpeed: 2,
      numberOfClouds: 5,
      continents: [
        ContinentEntity(
          color: Color(0xffBD5A0A),
          rawPoints: [
            const Offset(0, 0.29),
            const Offset(0.33, 0.13),
            const Offset(0.6, 0.42),
            const Offset(0.71, 0.75),
            const Offset(0.33, 0.84),
            const Offset(0.16, 0.75),
            const Offset(0, 0.61),
            const Offset(0.07, 0.42),
          ],
        ),
        ContinentEntity(
          color: Color(0xffBD5A0A),
          rawPoints: [
            const Offset(0.8, 0.45),
            const Offset(0.95, 0.55),
            const Offset(0.7, 0.5),
          ],
        ),
        ContinentEntity(
          color: Color(0xffBD5A0A),
          rawPoints: [
            const Offset(1.1, 0.5),
            const Offset(1.3, 0.5),
            const Offset(1.44, 0.32),
            const Offset(1.5, 0.21),
            const Offset(1.84, 0.5),
            const Offset(1.48, 0.88),
          ],
        ),
      ]);

  static PlanetEntity formy = PlanetEntity(
    name: 'Formy',
    orbitRadius: 480,
    initialAngle: 0,
    size: 1.5,
    color: Color(0xff6DFFC5),
    rotationSpeed: 0.8,
    atmosphere: const Atmosphere(
      height: 1.8,
      density: 1,
      color: Color(0xff6DFFC5),
    ),
    numberOfClouds: 6,
  );

  static PlanetEntity ciex = PlanetEntity(
    name: 'Hemera da Aurora',
    orbitRadius: 230,
    initialAngle: 0.4,
    size: 2.2,
    color: Color(0xffD5D9CA),
    atmosphere: Atmosphere(
      height: 1.6,
      density: 1.1,
      color: Color(0xffE3E7DA),
    ),
    rotationSpeed: 2.3,
    numberOfClouds: 6,
    continents: [
      ContinentEntity(
        color: Color(0xff283E49),
        rawPoints: [
          const Offset(0, 0.3),
          const Offset(0.28, 0.12),
          const Offset(0.55, 0.4),
          const Offset(0.7, 0.7),
          const Offset(0.35, 0.82),
          const Offset(0.18, 0.72),
          const Offset(0, 0.6),
          const Offset(0.1, 0.4),
        ],
      ),
      ContinentEntity(
        color: Color(0xff283E49),
        rawPoints: [
          const Offset(0.85, 0.45),
          const Offset(0.97, 0.56),
          const Offset(0.72, 0.52),
        ],
      ),
      ContinentEntity(
        color: Color(0xff283E49),
        rawPoints: [
          const Offset(1.1, 0.48),
          const Offset(1.32, 0.5),
          const Offset(1.44, 0.34),
          const Offset(1.52, 0.22),
          const Offset(1.82, 0.48),
          const Offset(1.46, 0.86),
        ],
      ),
    ],
  );
}
