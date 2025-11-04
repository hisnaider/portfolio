import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/enum/skills_enum.dart';
import 'package:portfolio/core/commons/extensions/normalize.dart';
import 'package:portfolio/core/commons/widgets/competence.dart';
import 'package:portfolio/core/commons/widgets/section_container.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/core/values/my_data.dart';
import 'package:portfolio/core/values/my_values.dart';
import 'package:portfolio/src/views/about_me/widgets/skill.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage(
      {super.key,
      required this.scrollValue,
      required this.start,
      required this.end});
  final ValueNotifier<double> scrollValue;
  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: scrollValue,
        builder: (context, child) {
          final value = scrollValue.value.normalize(end, min: start);
          final slideUpHardSkills = value.normalize(0.85, min: 0.70);
          final slideUpSoftSkills = value.normalize(1, min: 0.85);
          return SectionContainer(
            title: 'Sobre mim',
            padding: const EdgeInsets.fromLTRB(100, 60, 100, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '''Sou Hisnaider Campello, desenvolvedor mobile focado em Flutter, com background em design e Figma. Formado em Sistemas de Informação e pós-graduando em Desenvolvimento Mobile, busco unir lógica, estética e experiência do usuário em interfaces rápidas e funcionais.
                
                Valorizo código limpo, testável e componentes reutilizáveis, e gosto de trabalhar em equipe compartilhando aprendizados. Atualmente exploro Python e aprimoro minha capacidade de criar sistemas escaláveis e bem estruturados.''',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                Opacity(
                  opacity: slideUpHardSkills,
                  child: Transform.translate(
                    offset: Offset(0, 50 - 50 * slideUpHardSkills),
                    child: Column(
                      children: [
                        Text(
                          'Habilidades Técnicas',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 24),
                        Wrap(
                          alignment: WrapAlignment.center,
                          runSpacing: 34,
                          children: List.generate(
                            MyData.mainSkills.length,
                            (index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 60),
                                child: Skill(
                                    image: MyData.mainSkills[index].image,
                                    text: MyData.mainSkills[index].name
                                        .toUpperCase()),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 24),
                        Wrap(
                          spacing: 34,
                          runSpacing: 34,
                          children: [
                            for (SkillsEnum skill in MyData.otherSkills)
                              Skill(
                                text: skill.name.toUpperCase(),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Opacity(
                  opacity: slideUpSoftSkills,
                  child: Transform.translate(
                    offset: Offset(0, 50 - 50 * slideUpSoftSkills),
                    child: Column(
                      children: [
                        Text(
                          'Soft Skills',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 24),
                        Wrap(
                          spacing: 34,
                          runSpacing: 34,
                          children: [
                            for (SkillsEnum skill in MyData.softSkills)
                              Skill(
                                text: skill.name.toUpperCase(),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 90),
              ],
            ),
          );
        });
  }
}
