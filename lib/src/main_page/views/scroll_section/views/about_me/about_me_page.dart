import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/enum/skills_enum.dart';
import 'package:portfolio/core/commons/widgets/section_container.dart';
import 'package:portfolio/core/values/my_data.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/about_me/widgets/skill.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Estrela',
      subtitle: 'Sobre mim',
      padding: const EdgeInsets.fromLTRB(24, 90, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '''Sou Hisnaider Campello, desenvolvedor mobile focado em Flutter, com background em design e Figma. Formado em Sistemas de Informação e pós-graduando em Desenvolvimento Mobile, busco unir lógica, estética e experiência do usuário em interfaces rápidas e funcionais.
                    
        Valorizo código limpo, testável e componentes reutilizáveis, e gosto de trabalhar em equipe compartilhando aprendizados. Atualmente exploro Python e aprimoro minha capacidade de criar sistemas escaláveis e bem estruturados.''',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          Column(
            children: [
              Text(
                'Habilidades Técnicas',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.start,
                runSpacing: 34,
                children: List.generate(
                  MyData.mainSkills.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Skill(
                          image: MyData.mainSkills[index].image,
                          text: MyData.mainSkills[index].name.toUpperCase()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 34,
                runSpacing: 34,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  for (SkillsEnum skill in MyData.otherSkills)
                    Skill(
                      text: skill.name.toUpperCase(),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 60),
          Column(
            children: [
              Text(
                'Habilidades Comportamentais',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.visible,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 34,
                runSpacing: 34,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  for (SkillsEnum skill in MyData.softSkills)
                    Skill(
                      text: skill.name.toUpperCase(),
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 90),
        ],
      ),
    );
  }
}
