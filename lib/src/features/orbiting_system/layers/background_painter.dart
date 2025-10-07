import 'dart:math';
import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  final List<Offset> starPositions;
  final List<double> starSizes;

  BackgroundPainter._(this.starPositions, this.starSizes);

  /// Fábrica para gerar as estrelas uma única vez
  factory BackgroundPainter.generate({
    int starCount = 500,
    int seed = 42,
    Size area = const Size(2000, 2000),
  }) {
    final random = Random(seed);
    final positions = List<Offset>.generate(
      starCount,
      (_) => Offset(
        random.nextDouble() * area.width,
        random.nextDouble() * area.height,
      ),
    );

    final sizes = List<double>.generate(
      starCount,
      (_) => random.nextDouble() * 2 + 0.5, // tamanhos 0.5 → 2.5 px
    );

    return BackgroundPainter._(positions, sizes);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white12;

    for (int i = 0; i < starPositions.length; i++) {
      final pos = starPositions[i];
      final radius = starSizes[i];

      canvas.drawCircle(pos, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FlatNebulaPainter extends CustomPainter {
  final List<_Blob> blobs;
  final Color baseTint;
  final double opacity;

  FlatNebulaPainter._(this.blobs,
      {this.baseTint = const Color(0xFF8E6FFF), this.opacity = 0.95});

  /// Gera uma nebulosa com blobs pré-definidos (seeded)
  factory FlatNebulaPainter.generate({
    required Size area,
    int seed = 1234,
    int layerCount = 6,
    List<Color>? palette, // se null, usa default
    double scale = 1.0,
    double opacity = 0.95,
  }) {
    final random = Random(seed);
    final colors = palette ??
        [
          const Color(0xFF8E6FFF), // violeta
          const Color(0xFF5CE1E6), // aqua
          const Color(0xFFFF9FB1), // rosa
          const Color(0xFFFFD97E), // amarelo suave
        ];

    final blobs = <_Blob>[];
    for (int i = 0; i < layerCount; i++) {
      // posição relativa à área
      final cx = random.nextDouble() * area.width;
      final cy = random.nextDouble() * area.height;
      final radius = (min(area.width, area.height) *
          (0.15 + random.nextDouble() * 0.6) *
          scale);
      final rotation = random.nextDouble() * pi * 2;
      final color = colors[random.nextInt(colors.length)];
      final blurFactor =
          0.4 + random.nextDouble() * 0.6; // só pra variar a forma
      blobs.add(_Blob(
        center: Offset(cx, cy),
        radius: radius,
        rotation: rotation,
        color: color,
        blurFactor: blurFactor,
      ));
    }

    return FlatNebulaPainter._(blobs, baseTint: colors.first, opacity: opacity);
  }

  @override
  void paint(Canvas canvas, Size size) {
    // fundo levemente translúcido (opcional)
    final bgPaint = Paint()..color = Colors.transparent;
    canvas.drawRect(Offset.zero & size, bgPaint);

    // desenha blobs em ordem (do maior/mais apagado para o topo)
    // opcional: sort por radius para camada visual
    final ordered = List<_Blob>.from(blobs)
      ..sort((a, b) => a.radius.compareTo(b.radius));

    for (int i = 0; i < ordered.length; i++) {
      final b = ordered[i];
      _paintBlob(canvas, size, b, i / ordered.length);
    }
  }

  void _paintBlob(Canvas canvas, Size canvasSize, _Blob blob, double layerT) {
    // cria path orgânica com variações usando sin/cos + blurFactor
    final path = Path();
    const samples = 10;
    for (int i = 0; i <= samples; i++) {
      final t = i / samples;
      final angle = t * pi * 2 + blob.rotation;
      // variação do raio por ponto
      final localVariance = 0.6 +
          blob.blurFactor * (0.6 * sin(angle * 3.0 + blob.rotation) + 0.4);
      final r = blob.radius * localVariance;
      final x = blob.center.dx + cos(angle) * r;
      final y = blob.center.dy + sin(angle) * r;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        // usa quadraticTo pra suavizar
        final prevAngle = (t - 1 / samples) * pi * 2 + blob.rotation;
        final prevVariance = 0.6 +
            blob.blurFactor *
                (0.6 * sin(prevAngle * 3.0 + blob.rotation) + 0.4);
        final prevR = blob.radius * prevVariance;
        final px = blob.center.dx + cos(prevAngle) * prevR;
        final py = blob.center.dy + sin(prevAngle) * prevR;
        final mx = (px + x) / 2;
        final my = (py + y) / 2;
        path.quadraticBezierTo(px, py, mx, my);
      }
    }
    path.close();

    // cor base com opacidade adaptada pelo layerT
    final baseColor =
        blob.color.withOpacity(opacity * (0.5 + 0.5 * (1 - layerT)));

    // gradiente radial para dar volume flat
    final bounds = path.getBounds().inflate(20);
    final gradient = RadialGradient(
      center: Alignment(
        (blob.center.dx / canvasSize.width) * 2 - 1,
        (blob.center.dy / canvasSize.height) * 2 - 1,
      ),
      radius: 0.6,
      colors: [
        baseColor,
        baseColor.withOpacity(0.0),
      ],
      stops: const [0.0, 1.0],
    );

    final paint = Paint()
      ..isAntiAlias = true
      ..shader = gradient.createShader(bounds);

    // desenha a forma preenchida com o gradiente
    canvas.drawPath(path, paint);

    // opção: borda suave (muito leve) pra definir o shape
    final edgePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = baseColor.withOpacity(0.08)
      ..isAntiAlias = true;
    canvas.drawPath(path, edgePaint);
  }

  @override
  bool shouldRepaint(covariant FlatNebulaPainter oldDelegate) {
    // se quiser que mude só quando blobs mudarem
    if (oldDelegate.blobs.length != blobs.length) return true;
    for (int i = 0; i < blobs.length; i++) {
      if (oldDelegate.blobs[i] != blobs[i]) return true;
    }
    return false;
  }
}

class _Blob {
  final Offset center;
  final double radius;
  final double rotation;
  final Color color;
  final double blurFactor;

  const _Blob({
    required this.center,
    required this.radius,
    required this.rotation,
    required this.color,
    required this.blurFactor,
  });

  // igualdade simples para shouldRepaint
  @override
  bool operator ==(Object other) =>
      other is _Blob &&
      other.center == center &&
      other.radius == radius &&
      other.rotation == rotation &&
      other.color == color &&
      other.blurFactor == blurFactor;

  @override
  int get hashCode => Object.hash(center, radius, rotation, color, blurFactor);
}
