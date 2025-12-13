import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/about_info.dart';
import 'package:portfolio/core/commons/widgets/project_header.dart';
import 'package:portfolio/core/values/my_colors.dart';

class HighlightProjectCard extends StatelessWidget {
  const HighlightProjectCard({
    super.key,
    required this.aboutInfo,
    required this.childPainter,
  });
  final AboutWorkInfo aboutInfo;
  final Widget childPainter;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: MyColors.backgroudDarker,
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
                ProjectHeader(
                    companyName: '${aboutInfo.name} - ${aboutInfo.projectName}',
                    role: aboutInfo.role),
                const SizedBox(height: 24),
                Expanded(
                  child: Text(
                    aboutInfo.introduction!,
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
