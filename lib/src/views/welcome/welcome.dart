import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/extensions/normalize.dart';

class Welcome extends StatelessWidget {
  const Welcome(
      {super.key,
      required this.scrollValue,
      required this.start,
      required this.end});
  final ValueNotifier<double> scrollValue;
  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scrollValue,
      builder: (context, child) {
        final value = scrollValue.value.normalize(end, min: start);
        final dy = Curves.easeInCubic.transform(value.normalize(1, min: 0.3));
        final fade = value.normalize(1, min: 0.25);
        return Transform.translate(
          offset: Offset(0, -250 * dy),
          child: Opacity(
            opacity: 1 - fade,
            child: Center(
                child: Text(
              'Bem vindo ao meu sistema estrelar!',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
            )),
          ),
        );
      },
    );
  }
}
