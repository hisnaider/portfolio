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
    final Work? work = MyData.allWorks[celestialBody.name];
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
                    work?.page ?? const Text('Sem informações no momento'),
                    Text(
                      '\nCompetências:',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: (work?.competences ?? [])
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



/*

class WorkDesc extends StatelessWidget {
  const WorkDesc(
      {super.key,
      required this.celestialBody,
      required this.backButton,
      required this.child});
  final CelestialBody celestialBody;
  final VoidCallback backButton;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Work? work = MyData.allWorks[celestialBody.name];
    return Stack(
      key: ValueKey(celestialBody.id),
      children: [
        Positioned(
          bottom: 0,
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(kWorkDescMargin),
            width: kWorkDescContainer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  celestialBody.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 24),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 0.5, color: Colors.white12),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            work?.page ?? Text('Sem informações no momento'),
                            Text(
                              '\nCompetências:',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            SizedBox(height: 10),
                            Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: (work?.competences ?? [])
                                    .map((e) => Competence(text: e))
                                    .toList()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
                    Icon(Icons.arrow_back_ios_new_rounded),
                    SizedBox(width: 12),
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



*/