import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/extensions/normalize.dart';
import 'package:portfolio/core/commons/widgets/section_container.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/core/values/planets.dart';
import 'package:portfolio/src/main_page/views/star_system/widgets/planet_paint.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/highlight/entity/work_card_entity.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/highlight/widgets/highlight_project_card.dart';
import 'package:portfolio/src/main_page/widgets/offset_fade_animation.dart';

const double _pageMaxWidth = 1500;
const double _pageHorizontalPadding = 40;
const double _cardSpacing = 12;

class HighlightPage extends StatefulWidget {
  const HighlightPage({super.key});

  @override
  State<HighlightPage> createState() => _HighlightPageState();
}

class _HighlightPageState extends State<HighlightPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  Size _lastSize = Size.zero;
  double _lastPageWidth = 0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void calculateCardDimension({
    required double maxWidth,
  }) {
    double higherText = 0;
    for (WorkCardEntity work in _works) {
      final TextPainter painter = TextPainter(
        text: TextSpan(
            text: work.text, style: Theme.of(context).textTheme.bodyMedium),
        textDirection: TextDirection.ltr,
      );

      painter.layout(maxWidth: maxWidth - 48);
      higherText = max(higherText, painter.height);
    }

    _lastSize = Size(maxWidth, higherText + 80 + 24 + 48);
  }

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(builder: (context, sliverConstraints) {
      final int columns;
      final double offsetToAnimate;
      if (sliverConstraints.crossAxisExtent <= 1000) {
        columns = 1;
        offsetToAnimate =
            100 + (-300 * _lastPageWidth.normalize(400, min: 1000));
      } else {
        columns = 2;
        offsetToAnimate = 100;
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
              itemCount: _works.length,
              itemBuilder: (context, index) {
                final int row = ((index) / columns).floor();
                final Offset offset = columns == 1
                    ? const Offset(0, 1)
                    : Offset(index % columns == 0 ? -1 : 1, 0);
                final double cardPos =
                    _lastSize.height + ((_lastSize.height + spacing) * row);

                return OffsetFadeAnimation(
                    condition: offsetToAnimate + cardPos <
                        sliverConstraints.remainingPaintExtent +
                            sliverConstraints.scrollOffset,
                    initialOffset: offset,
                    duration: const Duration(milliseconds: 500),
                    firstWidget: HighlightProjectCard(
                        key: ValueKey('Row $row'),
                        work: _works[index],
                        childPainter: AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) {
                            _works[index].planet.updateContinents(kTargetFps);
                            _works[index].planet.updateClouds(kTargetFps);
                            return RepaintBoundary(
                              child: CustomPaint(
                                painter: PlanetPaint(
                                  position: Offset.zero,
                                  planet: _works[index].planet,
                                  glowFactor: 0,
                                  zoomFactor: 1,
                                ),
                              ),
                            );
                          },
                        )),
                    secondWidget: const SizedBox());
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

List<WorkCardEntity> _works = [
  WorkCardEntity(
    companyName: 'CIEX',
    planet: CelestialBodies.ciex,
    image: Assets.ciex,
    role: 'Pesquisador Front-end',
    text:
        'O projeto CIEX tem como objetivo criar um gêmeo digital da Lagoa dos Patos para integrar dados em tempo real e permitir o monitoramento e a previsão de eventos climáticos extremos no sul do Rio Grande do Sul. No projeto, sou responsável pelo desenvolvimento da interface do video wall, que exibe gráficos, vídeos, logos e informações dinâmicas de forma visual e interativa, utilizando Flutter com foco em desempenho, fluidez e design moderno.',
  ),
  WorkCardEntity(
    companyName: 'Formy',
    planet: CelestialBodies.formy,
    role: 'Projeto pessoal',
    text:
        'Biblioteca open source para Flutter desenvolvida para simplificar o gerenciamento de formulários complexos com controle total de estado e validação. Criei o pacote do zero com foco em escalabilidade, reatividade e API enxuta, aplicando princípios de arquitetura limpa e testabilidade. O Formy permite formulários dinâmicos, validação granular e integração fluida com UIs personalizadas.',
  ),
  WorkCardEntity(
    companyName: 'iTec/FURG-Embrapii - Projeto Plena',
    planet: CelestialBodies.raquel,
    image: Assets.itec,
    role: 'Pesquisador Júnior',
    text:
        'Aplicativo gratuito que apoia mulheres no climatério com informação, acolhimento e autonomia. Atuei como desenvolvedor líder no app Raquel Menopausa, responsável pela definição da Clean Architecture, gestão de estado com GetX, modularização e injeção de dependências. Desenvolvi componentes críticos e otimizei a performance do app, além de orientar a equipe em boas práticas e arquitetura limpa.',
  ),
  WorkCardEntity(
    companyName: 'iTec/FURG-Embrapii - Projeto Pinguim',
    planet: CelestialBodies.pinguim,
    image: Assets.itec,
    role: 'Pesquisador Júnior',
    text:
        'Aplicativo que começou como uma rede social de viagens e evoluiu para uma plataforma B2B voltada à gestão e conexão de experiências de viagem. Atuei como desenvolvedor experiente, responsável pela definição e implementação da Clean Architecture, padronização da base de código e criação de componentes reativos com Bloc. Também liderei decisões técnicas e mentorias sobre boas práticas, contribuindo para a maturidade e produtividade da equipe.',
  ),
];
