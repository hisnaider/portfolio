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
      color: const Color(0xff3B574B),
      atmosphere:
          const Atmosphere(height: 1.5, density: 1, color: Color(0xffDDE6CD)),
      rotationSpeed: 2,
      numberOfClouds: 5,
      continents: [
        ContinentEntity(
          color: const Color(0xffBD5A0A),
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
          color: const Color(0xffBD5A0A),
          rawPoints: [
            const Offset(0.8, 0.45),
            const Offset(0.95, 0.55),
            const Offset(0.7, 0.5),
          ],
        ),
        ContinentEntity(
          color: const Color(0xffBD5A0A),
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

  static PlanetEntity pinguim = PlanetEntity(
    name: 'Pinguim',
    orbitRadius: 420,
    initialAngle: 25,
    size: 2.4,
    color: const Color(0xffDD1681),
    rotationSpeed: 0.9,
    atmosphere: const Atmosphere(
      height: 2.1,
      density: 1,
      color: Color(0xffDD1681),
    ),
    numberOfClouds: 8,
    continents: [
      // Continente principal — formato irregular
      ContinentEntity(
        radius: 0.45,
        color: const Color(0xffB70551),
        rawPoints: [
          const Offset(0.4, 0.2),
          const Offset(1.0, 0.1),
          const Offset(1.5, 0.25),
          const Offset(1.4, 0.55),
          const Offset(1.0, 0.65),
          const Offset(0.5, 0.55),
          const Offset(0.2, 0.35),
        ],
      ),
      // Arquipélago de ilhas longas
      ContinentEntity(
        radius: 0.3,
        color: const Color(0xffB70551),
        rawPoints: [
          const Offset(1.7, 0.2),
          const Offset(2.0, 0.25),
          const Offset(2.05, 0.4),
          const Offset(1.8, 0.45),
        ],
      ),
      ContinentEntity(
        radius: 0.28,
        color: const Color(0xffB70551),
        rawPoints: [
          const Offset(1.9, 0.55),
          const Offset(2.0, 0.6),
          const Offset(2.0, 0.8),
          const Offset(1.7, 0.75),
        ],
      ),
      // Pequena massa polar norte
      ContinentEntity(
        radius: 0.25,
        color: const Color(0xffF1A2CD),
        rawPoints: [
          const Offset(1.0, 0.0),
          const Offset(1.4, 0.05),
          const Offset(1.3, 0.1),
          const Offset(0.9, 0.08),
        ],
      ),
      // Massa polar sul fragmentada
      ContinentEntity(
        radius: 0.25,
        color: const Color(0xffF1A2CD),
        rawPoints: [
          const Offset(0.8, 0.9),
          const Offset(1.1, 0.95),
          const Offset(1.2, 1.0),
          const Offset(0.7, 1.0),
        ],
      ),
      ContinentEntity(
        radius: 0.25,
        color: const Color(0xffB70551),
        rawPoints: [
          const Offset(1.4, 0.9),
          const Offset(1.7, 0.95),
          const Offset(1.8, 1.0),
          const Offset(1.5, 1.0),
        ],
      ),
      // Cinturão de microilhas equatoriais
      ...List.generate(6, (i) {
        final dx = 0.2 + i * 0.3; // dx entre 0 e 2
        final dy = 0.8 + (i.isEven ? 0.05 : -0.03); // dy entre 0 e 1
        return ContinentEntity(
          radius: 0.15,
          color: const Color(0xffB70551),
          rawPoints: [
            Offset(dx, dy),
            Offset(dx + 0.1, dy + 0.02),
            Offset(dx + 0.08, dy + 0.12 > 1 ? 1 : dy + 0.12),
            Offset(dx - 0.02, dy + 0.08 > 1 ? 1 : dy + 0.08),
          ],
        );
      }),
    ],
  );

  static PlanetEntity formy = PlanetEntity(
    name: 'Formy',
    orbitRadius: 480,
    initialAngle: 57,
    size: 1.5,
    color: const Color(0xff6DFFC5),
    rotationSpeed: 0.8,
    atmosphere: const Atmosphere(
      height: 1.8,
      density: 1,
      color: Color(0xff6DFFC5),
    ),
    numberOfClouds: 6,
  );

  static PlanetEntity ciex = PlanetEntity(
      name: 'CIEX',
      orbitRadius: 510,
      initialAngle: 350,
      size: 2.2,
      color: const Color(0xffD5D9CA),
      atmosphere: const Atmosphere(
        height: 1.6,
        density: 1,
        color: Color(0xffE3E7DA),
      ),
      rotationSpeed: 2.3,
      numberOfClouds: 6,
      continents: [
        // Continente Oeste
        ContinentEntity(
          color: const Color(0xff283E49),
          rawPoints: [
            const Offset(0.1, 0.25),
            const Offset(0.45, 0.1),
            const Offset(0.6, 0.35),
            const Offset(0.55, 0.55),
            const Offset(0.3, 0.7),
            const Offset(0.12, 0.55),
          ],
        ),

        // Continente Central
        ContinentEntity(
          color: const Color(0xff283E49),
          rawPoints: [
            const Offset(0.8, 0.3),
            const Offset(1.0, 0.15),
            const Offset(1.3, 0.25),
            const Offset(1.4, 0.55),
            const Offset(1.1, 0.7),
            const Offset(0.85, 0.55),
          ],
        ),

        // Continente Leste
        ContinentEntity(
          color: const Color(0xff283E49),
          rawPoints: [
            const Offset(1.6, 0.2),
            const Offset(2.0, 0.25),
            const Offset(2.0, 0.6),
            const Offset(1.7, 0.75),
            const Offset(1.55, 0.55),
          ],
        ),

        // Ilha ao norte
        ContinentEntity(
          color: const Color(0xff283E49),
          rawPoints: [
            const Offset(0.4, 0.05),
            const Offset(0.45, 0.08),
            const Offset(0.42, 0.12),
          ],
        ),

        // Ilha ao sul
        ContinentEntity(
          color: const Color(0xff283E49),
          rawPoints: [
            const Offset(1.2, 0.9),
            const Offset(1.3, 0.95),
            const Offset(1.25, 1.05),
            const Offset(1.1, 1.02),
          ],
        ),

        // Península sudeste
        ContinentEntity(
          color: const Color(0xff283E49),
          rawPoints: [
            const Offset(1.8, 0.8),
            const Offset(2.0, 0.85),
            const Offset(2.1, 1.0),
            const Offset(1.9, 1.1),
            const Offset(1.7, 1.0),
          ],
        ),
      ]);
}
