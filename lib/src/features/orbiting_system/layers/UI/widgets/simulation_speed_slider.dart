// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:portfolio/core/theme/my_text_theme.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/core/values/my_colors.dart';

class SimulationSpeedSlider extends StatefulWidget {
  const SimulationSpeedSlider(
      {super.key,
      required this.values,
      required this.currentValue,
      required this.onChanged});
  final List<double> values;
  final double currentValue;
  final Function(double value) onChanged;

  @override
  State<SimulationSpeedSlider> createState() => _SimulationSpeedSliderState();
}

class _SimulationSpeedSliderState extends State<SimulationSpeedSlider>
    with SingleTickerProviderStateMixin {
  late final SliderController controller;

  @override
  void initState() {
    super.initState();
    controller = SliderController(
        values: widget.values,
        currentValue: widget.currentValue,
        vsync: this,
        textStyle: MyTextTheme.dark.bodyMedium!.copyWith(fontSize: 12))
      ..setBiggestTextWidth();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return SizedBox(
        height: 35,
        child: Listener(
          onPointerDown: (event) =>
              controller.getMouseEvent(event, constraint.maxWidth),
          onPointerUp: (event) {
            controller.getMouseEvent(event, constraint.maxWidth);
            widget.onChanged(controller.getCurrentItem);
          },
          onPointerMove: (event) =>
              controller.getMouseEvent(event, constraint.maxWidth),
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return CustomPaint(
                  size: Size.infinite,
                  painter: SimulationSpeedSliderPainter(controller: controller),
                );
              }),
        ),
      );
    });
  }
}

class SimulationSpeedSliderPainter extends CustomPainter {
  final SliderController controller;
  SimulationSpeedSliderPainter({required this.controller});
  @override
  void paint(Canvas canvas, Size size) {
    // canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height),
    //     Paint()..color = Colors.red);
    final double textWidth = controller.biggestTextWidth;
    final double pos = controller.currentPos;
    final List<double> values = controller.values;
    final int length = controller.values.length;
    final TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );
    const double horizontalLineHeight = 8;
    const double horizontalLineCenter = horizontalLineHeight / 2;

    final paint = Paint()
      ..color = MyColors.altBackgroud
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // 👈 Aqui é o segredo!

    ///Text
    final totalTextSpacing = size.width - (length * textWidth);
    final textSpacing = totalTextSpacing / (length - 1);

    ///Indicator
    const double squareSize = 2;
    final totalSpacing = size.width - (length * squareSize) - textWidth + 2;
    final spacing = totalSpacing / (length - 1);

    final start = Offset(textWidth / 2, horizontalLineCenter);
    final end = Offset(size.width - textWidth / 2, horizontalLineCenter);
    canvas.drawLine(start, end, paint);
    canvas.drawLine(
        start,
        Offset((textWidth / 2 + (size.width - textWidth) * pos), end.dy),
        Paint()
          ..color = MyColors.primary
          ..strokeWidth = 8
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round);
    for (int i = 0; i < length; i++) {
      textPainter.text = TextSpan(
          style: controller.textStyle.copyWith(color: Colors.white54),
          text: values[i].toString(),
          children: const [
            TextSpan(style: TextStyle(fontSize: 10), text: 'x')
          ]);
      textPainter.layout(minWidth: textWidth);

      textPainter.paint(
        canvas,
        Offset(
          i * (textWidth + textSpacing),
          size.height - textPainter.height,
        ),
      );
      final dx = i * (squareSize + spacing) + (textWidth / 2);
      canvas.drawCircle(
          Offset(dx, horizontalLineCenter), 3, Paint()..color = Colors.white);
      // canvas.drawRect(
      //     rect,
      //     Paint()
      //       ..color = Colors.white
      //       ..strokeCap = StrokeCap.round);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class SliderController extends ChangeNotifier {
  final List<double> values;
  int currentIndex;
  double currentPos = 0;
  double targetPos = 0;
  double biggestTextWidth = 0;
  final TextStyle textStyle;

  late final Ticker _ticker;
  SliderController({
    required this.values,
    required double currentValue,
    required this.textStyle,
    required TickerProvider vsync,
  }) : currentIndex = values.indexOf(currentValue) {
    _ticker = vsync.createTicker(_onTick);
    currentPos = currentIndex / (values.length - 1);
    targetPos = currentIndex / (values.length - 1);
  }

  double get getCurrentItem => values[currentIndex];

  void _onTick(Duration tickerElapsed) {
    update(kTargetFps);
  }

  void setBiggestTextWidth() {
    for (double i in values) {
      final textPainter = TextPainter(
        text: TextSpan(style: textStyle, text: i.toString(), children: const [
          TextSpan(style: TextStyle(fontSize: 10), text: 'x')
        ]),
        textDirection: TextDirection.ltr,
      )..layout(); // mede o texto
      biggestTextWidth = max(biggestTextWidth, textPainter.width);
    }
  }

  void getMouseEvent(PointerEvent event, double maxWidth) {
    final double dx = event.localPosition.dx - biggestTextWidth / 2;
    final double maxDx = maxWidth - biggestTextWidth;

    if (!_ticker.isActive) {
      _ticker.start();
    }
    if (event is PointerMoveEvent) {
      setTargetPos(dx, maxDx);
    } else if (event is PointerUpEvent) {
      final proportion = maxDx / (values.length - 1);
      final index = (dx / proportion).round();
      currentIndex = index;
      setTargetPos(index * proportion, maxDx);
    }
  }

  void setTargetPos(double dx, double maxDx) {
    final target = dx / maxDx;
    targetPos = target.clamp(0, 1);
  }

  void update(double delta) {
    currentPos = lerpDouble(currentPos, targetPos, 0.1)!;
    if ((targetPos - currentPos).abs() < 0.0001) {
      currentPos = targetPos;
      _ticker.stop();
    }
    notifyListeners();
  }
}
