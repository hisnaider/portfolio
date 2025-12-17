import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/about_info.dart';
import 'package:portfolio/src/main_page/views/scroll_section/feature/reveal_widget_feat/widgets/animated_reveal_item.dart';
import 'package:portfolio/src/main_page/views/scroll_section/widgets/section_container.dart';
import 'package:portfolio/core/values/planets.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/planet_entity.dart';
import 'package:portfolio/src/main_page/views/star_system/widgets/planet_paint.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/highlight/widgets/highlight_project_card.dart';

const double _pageMaxWidth = 1500;
const double _pageHorizontalPadding = 40;
const double _cardSpacing = 12;

class HighlightPage extends StatefulWidget {
  const HighlightPage({super.key});

  @override
  State<HighlightPage> createState() => _HighlightPageState();
}

class _HighlightPageState extends State<HighlightPage> {
  final List<PlanetEntity> mainPlanets = [
    CelestialBodies.ciex,
    CelestialBodies.formy,
    CelestialBodies.raquel,
    CelestialBodies.pinguim
  ];
  Size _lastSize = Size.zero;
  double _lastPageWidth = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void calculateCardDimension({
    required double maxWidth,
  }) {
    double higherText = 0;
    for (PlanetEntity work in mainPlanets) {
      final TextPainter painter = TextPainter(
        text: TextSpan(
            text: (work.aboutInfo as AboutWorkInfo).introduction,
            style: Theme.of(context).textTheme.bodyMedium),
        textDirection: TextDirection.ltr,
      );

      painter.layout(maxWidth: maxWidth - 48);
      higherText = max(higherText, painter.height);
    }

    _lastSize = Size(maxWidth, higherText + 60 + 24 + 48);
  }

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(builder: (context, sliverConstraints) {
      final int columns;
      if (sliverConstraints.crossAxisExtent <= 1000) {
        columns = 1;
      } else {
        columns = 2;
      }

      if (_lastPageWidth !=
          min((_pageMaxWidth), sliverConstraints.crossAxisExtent)) {
        _lastPageWidth =
            min((_pageMaxWidth), sliverConstraints.crossAxisExtent);
        final double pageWidth = (_lastPageWidth - _pageHorizontalPadding * 2);
        final double currentCardWidth =
            pageWidth / columns - (_cardSpacing * (columns - 1));
        calculateCardDimension(maxWidth: currentCardWidth);
      }
      const double spacing = _cardSpacing * 2;
      return SectionContainer(
          key: const ValueKey('Projects'),
          title: 'Planetas',
          subtitle: 'Projetos e trabalhos',
          maxWidth: _pageMaxWidth,
          padding: const EdgeInsets.symmetric(
              horizontal: _pageHorizontalPadding, vertical: 60),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                childAspectRatio: 1,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                mainAxisExtent: _lastSize.height,
              ),
              itemCount: mainPlanets.length,
              itemBuilder: (context, index) {
                final int row = ((index) / columns).floor();
                return AnimatedRevealItem(
                  triggerOffsetPx: 200,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 500),
                  animationBuilder: (context, animation, child) {
                    final Offset initialOffset = columns == 1
                        ? const Offset(0, 0.25)
                        : Offset(index % 2 == 0 ? -0.75 : 0.75, 0);
                    final offset =
                        Tween<Offset>(begin: initialOffset, end: Offset.zero)
                            .animate(animation);
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: offset,
                        child: child,
                      ),
                    );
                  },
                  child: HighlightProjectCard(
                      key: ValueKey('Row $row'),
                      aboutInfo: mainPlanets[index].aboutInfo as AboutWorkInfo,
                      childPainter: CustomPaint(
                        painter: PlanetPaint(
                          position: Offset.zero,
                          planet: mainPlanets[index],
                          glowFactor: 0,
                          zoomFactor: 1,
                        ),
                      )),
                );
              },
            ),
            const SizedBox(height: 24),
            Text(
              'Esses são apenas os planetas mais próximos. Continue sua jornada até o fim do portfólio e descubra todo o meu sistema estelar — a viagem vai valer a pena!',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontStyle: FontStyle.italic),
            )
          ]));
    });
  }
}
