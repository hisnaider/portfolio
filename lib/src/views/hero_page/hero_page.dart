import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/core/commons/widgets/primary_button.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/star_entity.dart';
import 'package:portfolio/src/features/orbiting_system/orbiting_system_widget.dart';
import 'package:portfolio/src/views/hero_page/widget/introduction.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1920, maxHeight: 875),
      padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 120),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          // Expanded(
          //   child: OrbitingSystemWidget(
          //     celestialBody: [
          //       StarEntity(
          //         size: 150,
          //         color: Color(0xffFFC082),
          //         glowStyle: GlowStyle(),
          //         image: Assets.photo,
          //         imageStyle: ImageStyle(scale: 2.1),
          //       ),
          //       PlanetEntity(
          //         horizontalRadius: 275,
          //         initialAngle: 0,
          //         size: 75,
          //         color: const Color(0xff3E3E49),
          //         image: Assets.figma,
          //         imageStyle: const ImageStyle(
          //           color: ColorFilter.mode(Color(0xff2EBD7A), BlendMode.srcIn),
          //         ),
          //       ),
          //       PlanetEntity(
          //         horizontalRadius: 275,
          //         initialAngle: 90,
          //         size: 75,
          //         color: const Color(0xff3E3E49),
          //         image: Assets.flutter,
          //         imageStyle: const ImageStyle(
          //           color: ColorFilter.mode(Color(0xff2EBD7A), BlendMode.srcIn),
          //         ),
          //       ),
          //       PlanetEntity(
          //         horizontalRadius: 275,
          //         initialAngle: 180,
          //         size: 75,
          //         color: const Color(0xff3E3E49),
          //         image: Assets.dart,
          //         imageStyle: const ImageStyle(
          //           color: ColorFilter.mode(Color(0xff2EBD7A), BlendMode.srcIn),
          //         ),
          //       ),
          //       PlanetEntity(
          //         horizontalRadius: 275,
          //         initialAngle: 270,
          //         size: 75,
          //         color: const Color(0xff3E3E49),
          //         image: Assets.cleanArchitecture,
          //         imageStyle: const ImageStyle(
          //           color: ColorFilter.mode(Color(0xff2EBD7A), BlendMode.srcIn),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(width: 780, child: Introduction()),
        ],
      ),
    );
  }
}
