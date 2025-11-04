import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/widgets/section_container.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/fonts.dart';
import 'package:portfolio/core/values/planets.dart';
import 'package:portfolio/src/features/orbiting_system/widgets/planet_paint.dart';
import 'package:portfolio/src/views/highlight/entity/work_card_entity.dart';
import 'package:portfolio/src/views/highlight/widgets/highlight_project_card.dart';

class HighlightPage extends StatelessWidget {
  const HighlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
        title: 'Projetos destaques',
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: LayoutBuilder(builder: (context, constraint) {
          print(1420 - constraint.maxWidth);
          return Column(mainAxisSize: MainAxisSize.min, children: [
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    mainAxisExtent: 300 + ((1420 - constraint.maxWidth) / 5)),
                itemCount: _works.length,
                itemBuilder: (context, index) => HighlightProjectCard(
                      work: _works[index],
                    )),
          ]);
        }));
  }
}

List<WorkCardEntity> _works = [
  WorkCardEntity(
    companyName: 'iTec/FURG-Embrapii',
    planet: Planets.raquel,
    role: 'Pesquisador Júnior',
    text:
        'Aplicativo gratuito que apoia mulheres no climatério com informação, acolhimento e autonomia. Atuei como desenvolvedor líder no app Raquel Menopausa, responsável pela definição da Clean Architecture, gestão de estado com GetX, modularização e injeção de dependências. Desenvolvi componentes críticos e otimizei a performance do app, além de orientar a equipe em boas práticas e arquitetura limpa.',
  ),
  WorkCardEntity(
    companyName: 'CIEX',
    planet: Planets.ciex,
    image: Assets.ciex,
    role: 'Pesquisador Front-end',
    text:
        'O projeto CIEX tem como objetivo criar um gêmeo digital da Lagoa dos Patos para integrar dados em tempo real e permitir o monitoramento e a previsão de eventos climáticos extremos no sul do Rio Grande do Sul. No projeto, sou responsável pelo desenvolvimento da interface do video wall, que exibe gráficos, vídeos, logos e informações dinâmicas de forma visual e interativa, utilizando Flutter com foco em desempenho, fluidez e design moderno.',
  ),
];
