import 'package:flutter/material.dart';

class OffsetFadeAnimation extends StatelessWidget {
  const OffsetFadeAnimation(
      {super.key,
      required this.condition,
      required this.initialOffset,
      required this.duration,
      required this.firstWidget,
      required this.secondWidget});
  final bool condition;
  final Offset initialOffset;
  final Duration duration;
  final Widget firstWidget;
  final Widget secondWidget;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          // Animação de deslocamento: entra da esquerda → direita
          final offsetAnimation = Tween<Offset>(
            begin: initialOffset, // -0.2 = levemente fora da tela
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ));

          // Fade simultâneo
          final fadeAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          );

          return FadeTransition(
            opacity: fadeAnimation,
            child: SlideTransition(
              position: offsetAnimation,
              child: child,
            ),
          );
        },
        child: condition ? firstWidget : secondWidget);
  }
}
