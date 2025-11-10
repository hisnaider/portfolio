import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/widgets/competence.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/fonts.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';
import 'package:portfolio/src/features/orbiting_system/widgets/planet_paint.dart';
import 'package:portfolio/src/views/highlight/entity/work_card_entity.dart';

class HighlightProjectCard extends StatelessWidget {
  const HighlightProjectCard({
    super.key,
    required this.work,
    required this.deltaTime,
    required this.elapsedTime,
  });
  final WorkCardEntity work;
  final double deltaTime;
  final double elapsedTime;

  @override
  Widget build(BuildContext context) {
    work.planet.updateContinents(deltaTime);
    work.planet.updateClouds(deltaTime);
    return Material(
      clipBehavior: Clip.antiAlias,
      color: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              bottom: 50,
              right: 50,
              child: Opacity(
                opacity: 0.35,
                child: Transform.scale(
                  scale: 75,
                  child: CustomPaint(
                    painter: PlanetPaint(
                        position: Offset.zero,
                        planet: work.planet,
                        elapsedTime: elapsedTime,
                        hoveredPlanet: false,
                        glowFactor: 0,
                        zoomFactor: 1,
                        zoom: 1),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: MyColors.backgroud,
                      foregroundImage: AssetImage(work.image ?? Assets.myLogo),
                    ),
                    SizedBox(width: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          work.companyName,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          work.role,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color,
                                    fontFamily: Fonts.poppins,
                                  ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 24),
                Expanded(
                  child: Text(
                    work.text,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      ///constraints: BoxConstraints(minHeight: 300),
    );
  }
}
