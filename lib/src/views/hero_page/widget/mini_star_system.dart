import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/src/features/orbiting_system/controller/time_controller.dart';
import 'package:portfolio/src/views/hero_page/entities/hero_page_objects.dart';

class MiniStarSystem extends StatefulWidget {
  const MiniStarSystem(
      {super.key, required this.skillScale, required this.skillScaleDown});
  final double skillScale;
  final double skillScaleDown;

  @override
  State<MiniStarSystem> createState() => _MiniStarSystemState();
}

class _MiniStarSystemState extends State<MiniStarSystem>
    with SingleTickerProviderStateMixin {
  late TimeController time;
  final List<HeroPageObjects> objects = [
    MeStar(),
    MySkills(image: Assets.flutter, initialAngle: 0),
    MySkills(image: Assets.figma, initialAngle: 90),
    MySkills(image: Assets.dart, initialAngle: 180),
    MySkills(image: Assets.cleanArchitecture, initialAngle: 270),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    time = TimeController(this)..start();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    time.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: time.elapsed,
      builder: (context, value, child) {
        for (HeroPageObjects i in objects) {
          if (i is MySkills) {
            i.update(time.delta);
          }
        }
        objects.sort((a, b) => a.depth.compareTo(b.depth));
        return CustomPaint(
          size: Size.infinite,
          painter: _MiniStarSystemPainter(
              objects: objects,
              skillScale: widget.skillScale - widget.skillScaleDown),

          ///child: Container(),
        );
      },
    );
  }
}

class _MiniStarSystemPainter extends CustomPainter {
  final List<HeroPageObjects> objects;
  final double skillScale;
  const _MiniStarSystemPainter(
      {required this.objects, required this.skillScale});
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    for (HeroPageObjects i in objects) {
      final Offset position = i.position + center;
      final dotPaint = Paint()..color = i.color;
      final double size;
      if (i is MeStar) {
        size = i.size;

        ///planet.update(deltaTime);
        final glowPaint = Paint()
          ..color = i.color.withOpacity(0.6)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 15);

        // Primeiro desenha o brilho (círculo maior e borrado)
        canvas.drawCircle(position, size + 10, glowPaint);
      } else {
        size = i.size * skillScale;
      }

      canvas.drawCircle(position, size, dotPaint);
      if (i.image != null) {
        final imageScale = i is MeStar ? 2.1 : 1;
        final imageColorFilter = i is MeStar
            ? null
            : ColorFilter.mode(Color(0xff2EBD7A), BlendMode.srcIn);
        canvas.save();
        final clip = Path()
          ..addOval(Rect.fromCircle(center: position, radius: size));
        canvas.clipPath(clip);

        final imageRect = Rect.fromCenter(
          center: position,
          width: size * imageScale,
          height: size * imageScale,
        );

        final imageSrcRect = Rect.fromLTWH(
            0, 0, i.image!.width.toDouble(), i.image!.height.toDouble());

        canvas.drawImageRect(i.image!, imageSrcRect, imageRect,
            dotPaint..colorFilter = imageColorFilter);

        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => skillScale > 0;
}
