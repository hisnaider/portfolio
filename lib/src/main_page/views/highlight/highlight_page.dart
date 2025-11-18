import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/widgets/section_container.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/core/values/planets.dart';
import 'package:portfolio/src/features/orbiting_system/controller/time_controller.dart';
import 'package:portfolio/src/features/orbiting_system/widgets/planet_paint.dart';
import 'package:portfolio/src/main_page/views/highlight/entity/work_card_entity.dart';
import 'package:portfolio/src/main_page/views/highlight/widgets/highlight_project_card.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HighlightPage extends StatelessWidget {
  const HighlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
        title: 'Planetas',
        subtitle: 'Projetos e trabalhos',
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        child: LayoutBuilder(builder: (context, constraint) {
          return Column(mainAxisSize: MainAxisSize.min, children: [
            RepaintBoundary(
              child: _ProjectGrid(maxWidth: constraint.maxWidth),
            ),
            const SizedBox(height: 24),
            Text(
              'Esses são apenas os planetas mais próximos. Continue sua jornada até o fim do portfólio e descubra todo o meu sistema estelar — a viagem vai valer a pena!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!,
            )
          ]);
        }));
  }
}

class _ProjectGrid extends StatefulWidget {
  const _ProjectGrid({required this.maxWidth});
  final double maxWidth;

  @override
  State<_ProjectGrid> createState() => _ProjectGridState();
}

class _ProjectGridState extends State<_ProjectGrid>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  // late TimeController time;

  @override
  void initState() {
    super.initState();
    // time = TimeController(this)..start();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..repeat();
  }

  @override
  void dispose() {
    // time.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          mainAxisExtent: 300 + ((1420 - widget.maxWidth) / 5)),
      itemCount: _works.length,
      itemBuilder: (context, index) {
        return HighlightProjectCard(
            work: _works[index],
            childPainter: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                _works[index].planet.updateContinents(kTargetFps);
                _works[index].planet.updateClouds(kTargetFps);
                return CustomPaint(
                  painter: PlanetPaint(
                    position: Offset.zero,
                    planet: _works[index].planet,
                    glowFactor: 0,
                    zoomFactor: 1,
                  ),
                );
              },
            ));
      },
    );
  }
}

List<WorkCardEntity> _works = [
  WorkCardEntity(
    companyName: 'CIEX',
    planet: Planets.ciex,
    image: Assets.ciex,
    role: 'Pesquisador Front-end',
    text:
        'O projeto CIEX tem como objetivo criar um gêmeo digital da Lagoa dos Patos para integrar dados em tempo real e permitir o monitoramento e a previsão de eventos climáticos extremos no sul do Rio Grande do Sul. No projeto, sou responsável pelo desenvolvimento da interface do video wall, que exibe gráficos, vídeos, logos e informações dinâmicas de forma visual e interativa, utilizando Flutter com foco em desempenho, fluidez e design moderno.',
  ),
  WorkCardEntity(
    companyName: 'Formy',
    planet: Planets.formy,
    role: 'Projeto pessoal',
    text:
        'Biblioteca open source para Flutter desenvolvida para simplificar o gerenciamento de formulários complexos com controle total de estado e validação. Criei o pacote do zero com foco em escalabilidade, reatividade e API enxuta, aplicando princípios de arquitetura limpa e testabilidade. O Formy permite formulários dinâmicos, validação granular e integração fluida com UIs personalizadas.',
  ),
  WorkCardEntity(
    companyName: 'iTec/FURG-Embrapii - Projeto Plena',
    planet: Planets.raquel,
    image: Assets.itec,
    role: 'Pesquisador Júnior',
    text:
        'Aplicativo gratuito que apoia mulheres no climatério com informação, acolhimento e autonomia. Atuei como desenvolvedor líder no app Raquel Menopausa, responsável pela definição da Clean Architecture, gestão de estado com GetX, modularização e injeção de dependências. Desenvolvi componentes críticos e otimizei a performance do app, além de orientar a equipe em boas práticas e arquitetura limpa.',
  ),
  WorkCardEntity(
    companyName: 'iTec/FURG-Embrapii - Projeto Pinguim',
    planet: Planets.pinguim,
    image: Assets.itec,
    role: 'Pesquisador Júnior',
    text:
        'Aplicativo que começou como uma rede social de viagens e evoluiu para uma plataforma B2B voltada à gestão e conexão de experiências de viagem. Atuei como desenvolvedor experiente, responsável pela definição e implementação da Clean Architecture, padronização da base de código e criação de componentes reativos com Bloc. Também liderei decisões técnicas e mentorias sobre boas práticas, contribuindo para a maturidade e produtividade da equipe.',
  ),
];
