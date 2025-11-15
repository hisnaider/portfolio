import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  const Introduction(
      {super.key,
      required this.fadeSlideSubtitle,
      required this.curriculumFade});
  final double fadeSlideSubtitle;
  final double curriculumFade;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
            text: TextSpan(
                text: "I'm ",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white),
                children: const [
              TextSpan(
                  text: 'Hisnaider R. Campello',
                  style: TextStyle(fontWeight: FontWeight.w800))
            ])),
        Text(
          'MOBILE DEVELOPER',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Opacity(
          opacity: fadeSlideSubtitle,
          child: Transform.translate(
            offset: Offset(0, 50 - 50 * fadeSlideSubtitle),
            child: Text(
              'Desenvolvedor mobile apaixonado por performance, UX e código limpo. Especialista em Flutter, com background em design e Figma.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Opacity(
          opacity: curriculumFade,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(Icons.file_download_outlined),
                    Text(
                      'Ver currículo',
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
