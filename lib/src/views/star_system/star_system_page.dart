import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body_glow_config.dart';
import 'package:portfolio/core/values/planets.dart';
import 'package:portfolio/src/features/orbiting_system/entities/continent_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/star_entity.dart';
import 'package:portfolio/src/features/orbiting_system/orbiting_system_widget.dart';

class StarSystemPage extends StatefulWidget {
  const StarSystemPage({super.key});

  @override
  State<StarSystemPage> createState() => _StarSystemPageState();
}

class _StarSystemPageState extends State<StarSystemPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      //color: Colors.black,
      child: Transform.scale(
        scale: 1,
        child: Stack(
          children: [
            Center(
              child: OrbitingSystemWidget(
                star: StarEntity(
                  name: 'Hisnaider',
                  size: 25,
                  color: const Color(0xffFCD703),
                  glow: const StarGlow(
                    radius: 50,
                    intensity: 0.5,
                  ),
                ),
                planets: [
                  Planets.raquel,
                  Planets.formy,
                  PlanetEntity(
                    name: 'perroni sanvicente & ...',
                    orbitRadius: 280,
                    initialAngle: 93,
                    size: 1.8,
                    color: const Color(0xff595C65),
                    rotationSpeed: 1.3,
                    atmosphere: const Atmosphere(
                      height: 1.3,
                      density: 0.9,
                      color: Colors.white,
                    ),
                    numberOfClouds: 4,
                    continents: [
                      ContinentEntity(
                        radius: 0.38,
                        color: Colors.white,
                        rawPoints: [
                          const Offset(0.25, 0.2),
                          const Offset(0.55, 0.18),
                          const Offset(0.6, 0.42),
                          const Offset(0.48, 0.65),
                          const Offset(0.3, 0.6),
                          const Offset(0.18, 0.4),
                        ],
                      ),
                      ContinentEntity(
                        radius: 0.36,
                        color: Colors.white,
                        rawPoints: [
                          const Offset(0.72, 0.35),
                          const Offset(1.0, 0.3),
                          const Offset(1.05, 0.55),
                          const Offset(0.85, 0.72),
                          const Offset(0.68, 0.6),
                        ],
                      ),
                    ],
                  ),
                  Planets.pinguim,
                  PlanetEntity(
                      orbitRadius: 350,
                      initialAngle: 119,
                      size: 2,
                      color: Colors.blue,
                      rotationSpeed: 1,
                      atmosphere: const Atmosphere(
                          height: 1.5, density: 1, color: Colors.blue),
                      numberOfClouds: 5,
                      continents: [
                        ContinentEntity(
                          color: const Color.fromARGB(255, 0, 255, 8),
                          rawPoints: [
                            const Offset(0.24, 0.13),
                            const Offset(0.6, 0.13),
                            const Offset(0.55, 0.42),
                            const Offset(0.53, 0.61),
                            const Offset(0.43, 0.75),
                            const Offset(0.24, 0.84),
                            const Offset(0.27, 0.61),
                            const Offset(0.16, 0.38),
                          ],
                        ),
                        ContinentEntity(
                          color: const Color.fromARGB(255, 0, 255, 8),
                          rawPoints: [
                            const Offset(0.75, 0.32),
                            const Offset(1.09, 0.17),
                            const Offset(1.09, 0.88),
                            const Offset(0.78, 0.88),
                            const Offset(0.64, 0.59),
                            const Offset(0.8, 0.49),
                          ],
                        ),
                      ]),
                  Planets.ciex,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
