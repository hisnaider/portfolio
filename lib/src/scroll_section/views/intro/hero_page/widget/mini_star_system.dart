import 'package:flutter/material.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/src/star_system/controller/time_controller.dart';
import 'package:portfolio/src/scroll_section/views/intro/hero_page/entities/hero_page_objects.dart';

class MiniStarSystem extends StatefulWidget {
  const MiniStarSystem({super.key, required this.skillScale});
  final double skillScale;

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
    super.initState();
    time = TimeController(this)..stop();
  }

  @override
  void didUpdateWidget(covariant MiniStarSystem oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print(widget.skillScale != oldWidget.skillScale);
    if (widget.skillScale > 0 && !time.isActive) {
      time.start();
    } else if (widget.skillScale == 1 && !time.isActive) {
      time.start();
    } else if (widget.skillScale == 0 && time.isActive) {
      time.stop();
    }
  }

  @override
  void dispose() {
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
              objects: objects, skillScale: widget.skillScale),

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
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15);

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
            : const ColorFilter.mode(Color(0xff2EBD7A), BlendMode.srcIn);
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
