import 'package:flutter/material.dart';
import 'package:portfolio/core/values/my_data.dart';
import 'package:portfolio/src/scroll_section/views/about_me/widgets/skill.dart';

class SoftSkills extends StatelessWidget {
  const SoftSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
