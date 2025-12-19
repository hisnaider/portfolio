import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/extensions/normalize.dart';

class Welcome extends StatelessWidget {
  const Welcome(
      {super.key,
      required this.isDesktop,
      required this.scrollValue,
      required this.start,
      required this.end});
  final bool isDesktop;
  final double scrollValue;
  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    final value = scrollValue.normalize(end, min: start);
    final dy = Curves.easeInCubic.transform(value.normalize(1, min: 0.3));
    final fade = value.normalize(1, min: 0.25);
    return Transform.translate(
      offset: Offset(0, -250 * dy),
      child: Opacity(
        opacity: 1 - fade,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem vindo ao meu portfólio!',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white),
              ),
              Text(
                '${isDesktop ? 'Role' : 'Arraste'} a página para explorar meu sistema estelar.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
