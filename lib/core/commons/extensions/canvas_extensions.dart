import 'dart:math';
import 'dart:ui';

extension CanvasExtensions on Canvas {
  /// Desenha um círculo pontilhado em volta de [center].
  ///
  /// - [center]: posição central
  /// - [radius]: raio do círculo
  /// - [dots]: quantidade de pontos
  /// - [dotRadius]: raio de cada ponto
  /// - [paint]: estilo do ponto
  void drawDashedCircle(
    Offset center,
    double radius, {
    int segments = 40,
    double gapProportion = 0.5, // 0.5 = metade arco, metade espaço
    double rotation = 0.0,
    required Paint paint,
  }) {
    final rect = Rect.fromCircle(center: center, radius: radius);
    final sweepPerSegment = (2 * pi) / segments;
    final sweepArc = sweepPerSegment * (1 - gapProportion);

    for (int i = 0; i < segments; i++) {
      final startAngle = rotation + i * sweepPerSegment;
      drawArc(
        rect,
        startAngle,
        sweepArc,
        false,
        paint,
      );
    }
  }
}
