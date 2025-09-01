import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/widgets/competence.dart';

class HighlightProjectContainer extends StatelessWidget {
  const HighlightProjectContainer({
    super.key,
    required this.body,
    required this.sideBody,
    this.direction = TextDirection.ltr,
    required this.title,
    required this.subtitle,
    required this.competences,
  });
  final String title;
  final String subtitle;
  final List<String> competences;
  final Widget body;
  final Widget sideBody;
  final TextDirection direction;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: direction,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 325,
          child: sideBody,
        ),
        const SizedBox(width: 60),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                subtitle.toUpperCase(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [for (String i in competences) Competence(text: i)],
              ),
              const SizedBox(height: 10),
              body,
              const SizedBox(height: 60),
            ],
          ),
        ),
      ],
    );
  }
}
