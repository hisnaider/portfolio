import 'package:flutter/material.dart';
import 'package:portfolio/src/features/orbiting_system/entities/celestial_body.dart';
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
      child: Stack(
        children: [
          Center(
            child: OrbitingSystemWidget(celestialBody: [
              StarEntity(
                size: 50,
                color: Color(0xffFFC082),
                glowStyle: GlowStyle(sigma: 25, glowOpacity: 1),
              ),
              PlanetEntity(
                  horizontalRadius: 350,
                  initialAngle: 0,
                  size: 2,
                  color: Colors.blue,
                  glowStyle: GlowStyle(sigma: 5, glowOpacity: 0.25)),
              PlanetEntity(
                  horizontalRadius: 200,
                  initialAngle: 0,
                  size: 2,
                  color: Colors.purple,
                  glowStyle: GlowStyle(sigma: 5, glowOpacity: 0.25)),
            ]),
          ),
        ],
      ),
    );
  }
}
