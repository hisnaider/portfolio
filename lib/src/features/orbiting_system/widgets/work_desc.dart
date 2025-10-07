import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/entities/celestial_body.dart';
import 'package:portfolio/core/commons/widgets/competence.dart';
import 'package:portfolio/core/values/constants.dart';

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
    return Stack(
      key: ValueKey(celestialBody.id),
      children: [
        Positioned(
          bottom: 0,
          top: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(kWorkDescMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  celestialBody.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 24),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Competence(text: '123'),
                    Competence(text: '123'),
                    Competence(text: '123'),
                    Competence(text: '123'),
                    Competence(text: '123'),
                    Competence(text: '123'),
                    Competence(text: '123'),
                    Competence(text: '123'),
                  ],
                ),
                SizedBox(height: 24),
                Expanded(
                  child: Container(
                    width: kWorkDescContainer,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 0.5, color: Colors.white12),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: child,
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
