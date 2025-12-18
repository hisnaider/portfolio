import 'package:flutter/material.dart';
import 'package:portfolio/core/values/my_data.dart';
import 'package:portfolio/src/scroll_section/views/about_me/widgets/skill.dart';

class HardSkills extends StatelessWidget {
  const HardSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
