// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:portfolio/core/theme/my_text_theme.dart';
import 'package:portfolio/core/values/constants.dart';
import 'package:portfolio/core/values/my_colors.dart';

const List<double> _simulationSpeed = [
  0,
  0.25,
  0.5,
  0.75,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
];

class SimulationSpeed extends StatelessWidget {
  const SimulationSpeed(
      {super.key, required this.currentValue, required this.onChanged});
  final double currentValue;
  final Function(double value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 12,
      bottom: 12,
      child: Container(
          decoration: BoxDecoration(
              color: MyColors.backgroud.withOpacity(0.75),
              borderRadius: BorderRadius.circular(20)),
          child: MediaQuery.of(context).size.width >= 1200
              ? _Slider(
                  currentValue: currentValue,
                  onChanged: onChanged,
                )
              : _Buttons(
                  currentValue: currentValue,
                  onChanged: onChanged,
                )),
    );
  }
}

class _Buttons extends StatefulWidget {
  const _Buttons({required this.currentValue, required this.onChanged});
  final double currentValue;
  final Function(double value) onChanged;

  @override
  State<_Buttons> createState() => __ButtonsState();
}

class __ButtonsState extends State<_Buttons> {
  late final PageController pageController;
  late int index;

  @override
  void initState() {
    super.initState();
    index = _simulationSpeed.indexOf(widget.currentValue);
    pageController = PageController(viewportFraction: 0.5, initialPage: index);
  }

  void _buttonPressed(int value) {
    index = (index + value).clamp(0, _simulationSpeed.length - 1);
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOutExpo);
    widget.onChanged(_simulationSpeed[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () => _buttonPressed(-1),
              icon: const Icon(Icons.fast_rewind_rounded)),
          Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                  color: MyColors.backgroud,
                  borderRadius: BorderRadius.circular(10)),
              child: PageView.builder(
                controller: pageController,
                itemCount: _simulationSpeed.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final double value = _simulationSpeed[index];
                  return Opacity(
                    opacity: value == widget.currentValue ? 1 : 0.25,
                    child: Center(
                        child: Text(
                      '${value}x',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                  );
                },
              )),
          IconButton(
              onPressed: () => _buttonPressed(1),
              icon: const Icon(Icons.fast_forward_rounded)),
        ],
      ),
    );
  }
}

class _Slider extends StatefulWidget {
  const _Slider({required this.currentValue, required this.onChanged});
  final double currentValue;
  final Function(double value) onChanged;

  @override
  State<_Slider> createState() => __SliderState();
}

class __SliderState extends State<_Slider> with SingleTickerProviderStateMixin {
  late final _SliderController controller;

  @override
  void initState() {
    super.initState();

    controller = _SliderController(
        values: _simulationSpeed,
        currentValue: widget.currentValue,
        vsync: this,
        textStyle: MyTextTheme.dark.bodyMedium!.copyWith(fontSize: 12))
      ..setBiggestTextWidth();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
      width: min(750, MediaQuery.of(context).size.width / 2 - 110),
      child: LayoutBuilder(builder: (context, constraint) {
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
                    painter:
                        _SimulationSpeedSliderPainter(controller: controller),
                  );
                }),
          ),
        );
      }),
    );
  }
}

class _SimulationSpeedSliderPainter extends CustomPainter {
  final _SliderController controller;
  _SimulationSpeedSliderPainter({required this.controller});
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
    final current =
        Offset((textWidth / 2 + (size.width - textWidth) * pos), end.dy);
    canvas.drawLine(start, end, paint);
    canvas.drawLine(
        start,
        current,
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
      canvas.drawCircle(Offset(dx, horizontalLineCenter), 3,
          Paint()..color = current.dx < dx ? Colors.white24 : Colors.white);
    }
    canvas.drawLine(
        Offset(current.dx, 0),
        Offset(current.dx, 8),
        Paint()
          ..color = MyColors.primary
          ..strokeWidth = 8
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _SliderController extends ChangeNotifier {
  final List<double> values;
  int currentIndex;
  double currentPos = 0;
  double targetPos = 0;
  double biggestTextWidth = 0;
  final TextStyle textStyle;

  late final Ticker _ticker;
  _SliderController({
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
    final double dx =
        clampDouble(event.localPosition.dx, 0, maxWidth) - biggestTextWidth / 2;
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
