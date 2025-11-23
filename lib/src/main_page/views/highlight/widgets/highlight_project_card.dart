import 'package:flutter/material.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/fonts.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/features/orbiting_system/widgets/planet_paint.dart';
import 'package:portfolio/src/main_page/views/highlight/entity/work_card_entity.dart';

class HighlightProjectCard extends StatelessWidget {
  const HighlightProjectCard({
    super.key,
    required this.work,
    required this.childPainter,
  });
  final WorkCardEntity work;
  final Widget childPainter;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: Color(0XFF111113),
      elevation: 5,
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
                  child: RepaintBoundary(child: childPainter),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: MyColors.backgroud,
                      foregroundImage: AssetImage(work.image ?? Assets.myLogo),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            work.companyName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            work.role,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                  fontFamily: Fonts.poppins,
                                ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
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
