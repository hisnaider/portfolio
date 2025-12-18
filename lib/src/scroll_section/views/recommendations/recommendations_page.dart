import 'package:flutter/material.dart';
import 'package:portfolio/src/scroll_section/widgets/section_container.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/scroll_section/views/recommendations/entity/recommendation_entity.dart';
import 'package:portfolio/src/scroll_section/views/recommendations/widgets/infinite_carousel.dart';
import 'package:portfolio/src/scroll_section/views/recommendations/widgets/recommendation_carousel.dart';

class RecommendationsPage extends StatelessWidget {
  const RecommendationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SectionContainer(
        key: const ValueKey('Recommendations'),
        titlePadding: const EdgeInsets.symmetric(horizontal: 24),
        title: 'Estrelas proximas',
        subtitle: 'Recomendações',
        maxWidth: screenWidth,
        child: Column(
          verticalDirection: VerticalDirection.up,
          children: [
            if (screenWidth < 1200) ...[
              Text(
                'Arraste pro lado para ver outras recomendações',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 24),
            ],
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: MyColors.altBackgroud,
              child: LayoutBuilder(builder: (context, constraints) {
                if (screenWidth > 1200) {
                  return RepaintBoundary(
                      child: InfiniteCarousel(
                    recommendations: _recommendations,
                  ));
                }
                return RecommendationCarousel(
                  recommendations: _recommendations,
                  maxWidth: screenWidth,
                );
              }),
            ),
          ],
        ));
  }
}

final List<RecommendationEntity> _recommendations = [
  RecommendationEntity(
    name: 'Lisandro Tavares da Silva',
    role: 'Gerente da área de front-end',
    text: '''
    Atuei como gerente da área de frontend com o Hisnaider como desenvolvedor da minha equipe. Destaco seu grande empenho e contribuição ao projeto. Demonstrou forte compromisso em estruturar um ambiente de trabalho focado na entrega eficiente das demandas do cliente, sempre prezando por um código limpo, simples e manutenível, seguindo boas práticas e padrões de desenvolvimento.
    Ele se mostrou altamente propositivo, com iniciativa e postura construtiva. Atuou como líder técnico, apoiando e ensinando colegas menos experientes com muito dedicação.
    É um excelente desenvolvedor, sensível às necessidades da equipe, do cliente e da gestão.''',
    date: DateTime(2025, 7, 9),
  ),
  RecommendationEntity(
    name: 'Carlos Alberto Madsen',
    role: 'Gerente da área de front-end',
    text: '''
    Trabalhei com o Hisnaider no projeto Plena, desenvolvido pelo iTEC FURG/Unidade Embrapii, ao longo de 15 meses. Durante esse período, colaboramos no desenvolvimento do aplicativo Raquel Menopausa, utilizando a linguagem Dart e o framework Flutter para a construção do front-end.
    Além de demonstrar sólido conhecimento técnico, Hisnaider se destacou pelo empenho, responsabilidade, capacidade de resolver problemas e excelente relacionamento interpessoal com toda a equipe.
    O time era composto por cinco bolsistas de iniciação científica, que no início tinham pouco ou nenhum conhecimento em Flutter. Hisnaider sempre se mostrou disponível para orientar, compartilhar conhecimento e esclarecer dúvidas. Graças à sua dedicação, todos nós evoluímos profissionalmente ao longo do projeto.
    Na minha visão, um dos principais diferenciais da sua atuação foi a definição da arquitetura do aplicativo. A qualidade com que estruturou o projeto foi fundamental para que o restante da equipe pudesse desenvolver suas tarefas com eficiência, além de garantir um código limpo e de fácil manutenção.''',
    date: DateTime(2025, 7, 7),
  ),
  RecommendationEntity(
    name: 'Diogo Paludo de Oliveira',
    role: 'Gerente da área de back-end',
    text: '''
    Tive a oportunidade de trabalhar com Hisnaider no desenvolvimento de um projeto voltado à saúde feminina, que contou com uma equipe multidisciplinar e diversas frentes técnicas. Atuando como desenvolvedor front-end, ele foi responsável por liderar a execução das ações da equipe de Flutter, composta por cinco integrantes, sempre com um olhar atento à qualidade do código e à experiência do usuário.
    Sua condução técnica foi excelente, seja pelas boas práticas ou pela aplicação consistente de princípios de clean code, organização de repositório e atenção à reusabilidade de interfaces da aplicação. Seu comprometimento e competência foram fundamentais para entregar um produto robusto e bem estruturado. Recomendo fortemente seu trabalho!''',
    date: DateTime(2025, 7, 8),
  ),
  RecommendationEntity(
    name: 'Gabriel Provin Flores Endres',
    role: 'Pesquisador Junior da área de front-end',
    text: '''
    Recomendo fortemente o Hisnaider pelo excelente trabalho no projeto Raquelmenopausa. Ele estruturou toda a arquitetura da aplicação com muita competência e criou bibliotecas, seguindo boas práticas de desenvolvimento e organização. Além disso, foi fundamental no apoio ao time, compartilhando conhecimento e promovendo o uso eficiente do GitHub ao longo de todo o projeto.''',
    date: DateTime(2025, 7, 7),
  ),
  RecommendationEntity(
    name: 'Pablo Guaicurus',
    role: 'Pesquisador Junior da área de front-end',
    text: '''
    Hisnaider foi um cara que me ensinou muito. Ele não era o líder técnico, tampouco o que tinha o cargo de maior senioridade, mas fez essas funções de forma incrível! 
    Recomendo-o por seu comprometimento com o serviço e sua capacidade de ajudar os colegas quando eles mais precisam. É um cara que faz bem pra qualquer time. É competente no desenvolvimento e capaz de tocar grandes projetos de forma independente.''',
    date: DateTime(2025, 7, 7),
  ),
  RecommendationEntity(
    name: 'Mikael Farias',
    role: 'Pesquisador Junior da área de visão computacional',
    text: '''
    Hisnaider é um excelente profissional, com sólidos conhecimentos em Flutter e desenvolvimento mobile. Tem ótima comunicação e trabalha muito bem em equipe. Sem dúvida, tê-lo na equipe será um grande diferencial técnico.''',
    date: DateTime(2025, 7, 9),
  ),
];
