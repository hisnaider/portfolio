import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body_glow_config.dart';
import 'package:portfolio/core/values/assets.dart';
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
      child: Stack(
        children: [
          Center(
            child: OrbitingSystemWidget(
              star: StarEntity(
                name: 'Hisnaider',
                size: 25,
                color: Color(0xffFCD703),
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
                  initialAngle: 0,
                  size: 1.8,
                  color: Color(0xff595C65),
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
                PlanetEntity(
                  name: 'Pinguim',
                  orbitRadius: 420,
                  initialAngle: 0,
                  size: 2.4,
                  color: Color(0xffDD1681),
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
                      color: Color(0xffB70551),
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
                      color: Color(0xffB70551),
                      rawPoints: [
                        const Offset(1.7, 0.2),
                        const Offset(2.0, 0.25),
                        const Offset(2.05, 0.4),
                        const Offset(1.8, 0.45),
                      ],
                    ),
                    ContinentEntity(
                      radius: 0.28,
                      color: Color(0xffB70551),
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
                      color: Color(0xffF1A2CD),
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
                      color: Color(0xffF1A2CD),
                      rawPoints: [
                        const Offset(0.8, 0.9),
                        const Offset(1.1, 0.95),
                        const Offset(1.2, 1.0),
                        const Offset(0.7, 1.0),
                      ],
                    ),
                    ContinentEntity(
                      radius: 0.25,
                      color: Color(0xffB70551),
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
                      final dy =
                          0.8 + (i.isEven ? 0.05 : -0.03); // dy entre 0 e 1
                      return ContinentEntity(
                        radius: 0.15,
                        color: Color(0xffB70551),
                        rawPoints: [
                          Offset(dx, dy),
                          Offset(dx + 0.1, dy + 0.02),
                          Offset(dx + 0.08, dy + 0.12 > 1 ? 1 : dy + 0.12),
                          Offset(dx - 0.02, dy + 0.08 > 1 ? 1 : dy + 0.08),
                        ],
                      );
                    }),
                  ],
                ),
                PlanetEntity(
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
                PlanetEntity(
                  name: 'Eclipsera Prime',
                  orbitRadius: 510,
                  initialAngle: 0,
                  size: 2.1,
                  color: Colors.indigoAccent,
                  rotationSpeed: 1.1,
                  atmosphere: const Atmosphere(
                    height: 1.9,
                    density: 1,
                    color: Colors.lightBlueAccent,
                  ),
                  numberOfClouds: 9,
                  continents: [
                    // Continente central em formato de espiral
                    ContinentEntity(
                      radius: 0.42,
                      color: const Color.fromARGB(255, 170, 255, 255),
                      rawPoints: [
                        const Offset(0.5, 0.35),
                        const Offset(0.8, 0.3),
                        const Offset(1.1, 0.4),
                        const Offset(1.3, 0.55),
                        const Offset(1.15, 0.7),
                        const Offset(0.85, 0.75),
                        const Offset(0.55, 0.6),
                        const Offset(0.45, 0.45),
                      ],
                    ),
                    // Arquipélago leste
                    ContinentEntity(
                      radius: 0.35,
                      color: const Color.fromARGB(255, 140, 255, 230),
                      rawPoints: [
                        const Offset(1.5, 0.4),
                        const Offset(1.8, 0.45),
                        const Offset(1.9, 0.6),
                        const Offset(1.7, 0.7),
                        const Offset(1.45, 0.65),
                      ],
                    ),
                    ContinentEntity(
                      radius: 0.25,
                      color: const Color.fromARGB(255, 120, 255, 200),
                      rawPoints: [
                        const Offset(1.65, 0.2),
                        const Offset(1.9, 0.25),
                        const Offset(1.85, 0.35),
                        const Offset(1.6, 0.3),
                      ],
                    ),
                    // Cinturão equatorial de micro-ilhas
                    ...List.generate(8, (i) {
                      final dx = 0.25 + i * 0.2;
                      final dy = 0.85 + (i.isEven ? 0.03 : -0.02);
                      return ContinentEntity(
                        radius: 0.15,
                        color: const Color.fromARGB(255, 0, 255, 190),
                        rawPoints: [
                          Offset(dx, dy),
                          Offset(dx + 0.08, dy + 0.02),
                          Offset(dx + 0.05, dy + 0.08 > 1 ? 1 : dy + 0.08),
                          Offset(dx - 0.02, dy + 0.06 > 1 ? 1 : dy + 0.06),
                        ],
                      );
                    }),
                    // Massa polar norte
                    ContinentEntity(
                      radius: 0.3,
                      color: const Color.fromARGB(255, 190, 255, 255),
                      rawPoints: [
                        const Offset(0.9, 0.05),
                        const Offset(1.2, 0.08),
                        const Offset(1.1, 0.15),
                        const Offset(0.85, 0.12),
                      ],
                    ),
                    // Massa polar sul
                    ContinentEntity(
                      radius: 0.3,
                      color: const Color.fromARGB(255, 190, 255, 255),
                      rawPoints: [
                        const Offset(0.8, 0.95),
                        const Offset(1.15, 0.97),
                        const Offset(1.1, 1.0),
                        const Offset(0.85, 1.0),
                      ],
                    ),
                  ],
                ),
                // PlanetEntity(
                //   name: 'Formy',
                //   orbitRadius: 480,
                //   initialAngle: 0,
                //   size: 1.5,
                //   color: Colors.deepPurpleAccent,
                //   rotationSpeed: 0.8,
                //   atmosphere: const Atmosphere(
                //     height: 1.8,
                //     density: 1,
                //     color: Colors.purpleAccent,
                //   ),
                //   numberOfClouds: 6,
                //   continents: [
                //     ContinentEntity(
                //       radius: 0.45,
                //       color: const Color.fromARGB(255, 170, 255, 0),
                //       rawPoints: [
                //         const Offset(0.2, 0.15),
                //         const Offset(0.55, 0.1),
                //         const Offset(0.65, 0.35),
                //         const Offset(0.6, 0.55),
                //         const Offset(0.4, 0.7),
                //         const Offset(0.2, 0.75),
                //         const Offset(0.18, 0.45),
                //       ],
                //     ),
                //     ContinentEntity(
                //       radius: 0.42,
                //       color: const Color.fromARGB(255, 170, 255, 0),
                //       rawPoints: [
                //         const Offset(0.75, 0.25),
                //         const Offset(1.1, 0.22),
                //         const Offset(1.15, 0.55),
                //         const Offset(0.95, 0.82),
                //         const Offset(0.7, 0.7),
                //         const Offset(0.68, 0.45),
                //       ],
                //     ),
                //     ContinentEntity(
                //       radius: 0.38,
                //       color: const Color.fromARGB(255, 170, 255, 0),
                //       rawPoints: [
                //         const Offset(0.3, 0.75),
                //         const Offset(0.5, 0.8),
                //         const Offset(0.7, 0.75),
                //         const Offset(0.8, 0.89),
                //         const Offset(0.6, 1),
                //         const Offset(0.35, 0.95),
                //       ],
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
