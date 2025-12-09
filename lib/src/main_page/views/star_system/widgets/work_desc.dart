import 'dart:html' as html;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/core/commons/entities/works.dart';
import 'package:portfolio/core/commons/widgets/competence.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/core/values/my_data.dart';

class WorkDesc extends StatelessWidget {
  const WorkDesc({
    super.key,
    required this.celestialBody,
    required this.backButton,
  });
  final CelestialBody celestialBody;
  final VoidCallback backButton;

  @override
  Widget build(BuildContext context) {
    final bool isHorizontal = MediaQuery.of(context).size.aspectRatio > 1.3;
    final AboutInfo aboutInfo = celestialBody.aboutInfo;
    return Stack(
      key: ValueKey(celestialBody.id),
      children: [
        Align(
          alignment: isHorizontal
              ? AlignmentGeometry.centerRight
              : AlignmentGeometry.bottomCenter,
          child: Container(
            width: isHorizontal
                ? kWorkDescContainer + kWorkDescMargin
                : double.infinity,
            height: isHorizontal
                ? double.infinity
                : MediaQuery.of(context).size.height - 325 - kWorkDescMargin,
            color: MyColors.backgroud,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(aboutInfo.desc,
                        style: Theme.of(context).textTheme.bodyMedium),
                    _BulletList(
                        textList: aboutInfo.offers,
                        title: 'O que o/a ${aboutInfo.projectName} oferece:'),
                    _SimpleText(
                        title: 'Minha atuação no projeto',
                        text: aboutInfo.myPerformance),
                    _BulletList(
                        textList: aboutInfo.mainResponsibilities,
                        title: 'Principais responsabilidades e entregas:'),
                    _LinkList(linkList: aboutInfo.links),
                    Text(
                      '\nCompetências:',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: (aboutInfo.competences)
                            .map((e) => Competence(text: e))
                            .toList()),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: kWorkDescMargin,
            left: kWorkDescMargin,
            child: InkWell(
              borderRadius: BorderRadius.circular(90),
              onTap: backButton,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.arrow_back_ios_new_rounded),
                    const SizedBox(width: 12),
                    Text(
                      'Voltar',
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}

class _SimpleText extends StatelessWidget {
  const _SimpleText({required this.title, required this.text});
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '\n$title',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _BulletList extends StatelessWidget {
  const _BulletList({required this.textList, required this.title});
  final List<String> textList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '\n$title',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        ...[
          for (int i = 0; i < textList.length; i++)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                  width: 20,
                  child: Icon(
                    Icons.circle,
                    size: 6,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    '${textList[i]}${i < textList.length - 1 ? ';' : '.'} ',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
        ]
      ],
    );
  }
}

class _LinkList extends StatelessWidget {
  const _LinkList({required this.linkList});
  final List<LinkText> linkList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '\nLinks:',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        ...[
          for (LinkText linkText in linkList)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                  width: 20,
                  child: Icon(
                    Icons.circle,
                    size: 6,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(text: '${linkText.label}: ', children: [
                            TextSpan(
                                text: linkText.text,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    html.window.open(linkText.link, '_blank');
                                  },
                                style: const TextStyle(
                                  color: MyColors.primary,
                                )),
                          ]),
                        ]),
                  ),
                ),
              ],
            ),
        ]
      ],
    );
  }
}
