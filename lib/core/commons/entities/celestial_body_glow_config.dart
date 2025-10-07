import 'dart:ui';

class Atmosphere {
  final double height; // altura em km (relativa ao planeta)
  final double density; // 0.0 a 1.0
  final Color color; // cor dominante do glow

  const Atmosphere({
    required this.height,
    required this.density,
    required this.color,
  });
}

class StarGlow {
  final double radius; // tamanho do glow além da estrela
  final Color color; // cor do glow (tipo temperatura da estrela)
  final double intensity; // opacidade/brilho

  const StarGlow({
    required this.radius,
    required this.color,
    required this.intensity,
  });
}
