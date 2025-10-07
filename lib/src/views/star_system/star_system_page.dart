import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body_glow_config.dart';
import 'package:portfolio/core/values/assets.dart';
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
      color: Colors.black87,
      //color: Colors.black,
      child: Stack(
        children: [
          Center(
            child: OrbitingSystemWidget(
              star: StarConfig(
                name: 'Hisnaider',
                size: 25,
                color: const Color(0xffFFC082),
                glow: const StarGlow(
                  radius: 50,
                  color: Color(0xffFFC082),
                  intensity: 0.5,
                ),
              ),
              planets: [
                PlanetConfig(
                    name: 'Raquel Menopausa',
                    orbitRadius: 350,
                    initialAngle: 0,
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
                PlanetConfig(
                    name: 'Pinguim',
                    orbitRadius: 200,
                    initialAngle: 0,
                    size: 2,
                    color: Color(0xffBB2EBD),
                    atmosphere: Atmosphere(
                        height: 1.5, density: 1, color: Colors.purple),
                    rotationSpeed: 5,
                    numberOfClouds: 5,
                    continents: [
                      ContinentEntity(
                        color: Color(0xff6DFFC5),
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
                        color: Color(0xff6DFFC5),
                        rawPoints: [
                          const Offset(0.8, 0.45),
                          const Offset(0.95, 0.55),
                          const Offset(0.7, 0.5),
                        ],
                      ),
                      ContinentEntity(
                        color: Color(0xff6DFFC5),
                        rawPoints: [
                          const Offset(1.1, 0.5),
                          const Offset(1.3, 0.5),
                          const Offset(1.44, 0.32),
                          const Offset(1.5, 0.21),
                          const Offset(1.84, 0.5),
                          const Offset(1.48, 0.88),
                        ],
                      ),
                    ]),
                PlanetConfig(
                  orbitRadius: 480,
                  initialAngle: 1.2,
                  size: 1.5,
                  color: Colors.deepPurpleAccent,
                  rotationSpeed: 0.8,
                  atmosphere: const Atmosphere(
                    height: 1.8,
                    density: 1,
                    color: Colors.purpleAccent,
                  ),
                  numberOfClouds: 6,
                  continents: [
                    ContinentEntity(
                      radius: 0.45,
                      color: const Color.fromARGB(255, 170, 255, 0),
                      rawPoints: [
                        const Offset(0.2, 0.15),
                        const Offset(0.55, 0.1),
                        const Offset(0.65, 0.35),
                        const Offset(0.6, 0.55),
                        const Offset(0.4, 0.7),
                        const Offset(0.2, 0.75),
                        const Offset(0.18, 0.45),
                      ],
                    ),
                    ContinentEntity(
                      radius: 0.42,
                      color: const Color.fromARGB(255, 170, 255, 0),
                      rawPoints: [
                        const Offset(0.75, 0.25),
                        const Offset(1.1, 0.22),
                        const Offset(1.15, 0.55),
                        const Offset(0.95, 0.82),
                        const Offset(0.7, 0.7),
                        const Offset(0.68, 0.45),
                      ],
                    ),
                    ContinentEntity(
                      radius: 0.38,
                      color: const Color.fromARGB(255, 170, 255, 0),
                      rawPoints: [
                        const Offset(0.3, 0.75),
                        const Offset(0.5, 0.8),
                        const Offset(0.7, 0.75),
                        const Offset(0.8, 0.89),
                        const Offset(0.6, 1),
                        const Offset(0.35, 0.95),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
