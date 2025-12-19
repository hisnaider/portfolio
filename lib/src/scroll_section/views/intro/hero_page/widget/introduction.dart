import 'package:flutter/material.dart';
import 'dart:html' as html;

class Introduction extends StatelessWidget {
  const Introduction({
    super.key,
    required this.subtitleOffset,
    required this.subtitleOpacity,
    required this.curriculumFade,
    this.textAlign = TextAlign.start,
    this.isMobile = false,
  });
  final Offset subtitleOffset;
  final double subtitleOpacity;
  final double curriculumFade;
  final TextAlign textAlign;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectableText.rich(
            TextSpan(
                text: "Olá, sou ",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white, fontSize: isMobile ? 24 : null),
                children: const [
                  TextSpan(
                      text: 'Hisnaider R. Campello',
                      style: TextStyle(fontWeight: FontWeight.w800))
                ]),
            textAlign: textAlign,
          ),
          Text(
            'MOBILE DEVELOPER',
            textAlign: textAlign,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: isMobile ? 48 : null),
          ),
          Opacity(
            opacity: subtitleOpacity,
            child: Transform.translate(
              offset: subtitleOffset,
              child: Text(
                'Desenvolvedor mobile apaixonado por performance, UX e código limpo. Especialista em Flutter, com background em design e Figma.',
                textAlign: textAlign,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Opacity(
            opacity: curriculumFade,
            child: Row(
              mainAxisAlignment: textAlign == TextAlign.center
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    html.window.open(
                        'https://drive.google.com/drive/folders/1fgcqTv74UMwNcEI24Gq7cLJNnEhBTFVY?usp=sharing',
                        '_blank');
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.open_in_new),
                      Text(
                        ' Ver currículo e certificados',
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
