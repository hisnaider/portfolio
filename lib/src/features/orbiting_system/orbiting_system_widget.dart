import 'package:flutter/material.dart';
import 'package:portfolio/src/features/orbiting_system/controller/star_system_controller.dart';
import 'package:portfolio/src/features/orbiting_system/controller/time_controller.dart';
import 'package:portfolio/src/features/orbiting_system/entities/camera.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/star_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/star_system_config.dart';
import 'package:portfolio/src/features/orbiting_system/layers/star_system_painter.dart';
import 'package:portfolio/src/features/orbiting_system/widgets/work_desc.dart';

class OrbitingSystemWidget extends StatefulWidget {
  const OrbitingSystemWidget({
    required this.star,
    required this.planets,
    super.key,
  });
  final StarEntity star;
  final List<PlanetEntity> planets;

  @override
  State<OrbitingSystemWidget> createState() => _OrbitingSystemWidgetState();
}

class _OrbitingSystemWidgetState extends State<OrbitingSystemWidget>
    with SingleTickerProviderStateMixin {
  final Camera camera = Camera();
  late TimeController time;
  late final StarSystemController controller;

  @override
  void initState() {
    super.initState();
    time = TimeController(this);
    controller = StarSystemController(
      camera: camera,
      star: widget.star,
      planets: widget.planets,
    );
  }

  @override
  void dispose() {
    time.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        ValueListenableBuilder<double>(
            valueListenable: time.elapsed,
            builder: (context, value, child) {
              controller.update(time.delta, screenSize);
              return Stack(
                children: [
                  Listener(
                    onPointerHover: controller.getEvent,
                    onPointerSignal: controller.getEvent,
                    onPointerMove: controller.getEvent,
                    onPointerDown: controller.getEvent,
                    onPointerUp: controller.getEvent,
                    child: CustomPaint(
                      size: Size.infinite,
                      painter: StarSystemPainter(
                          controller.celestialBodies,
                          value,
                          time.delta,
                          controller.camera,
                          controller.config.value.hoveredBody?.id),

                      ///child: Container(),
                    ),
                  ),
                  // AnimatedOpacity(
                  //   opacity:
                  //       controller.config.value.selectedBody != null ? 0 : 1,
                  //   duration: Duration(milliseconds: 500),
                  //   child: IgnorePointer(
                  //     child: CustomPaint(
                  //       size: Size.infinite,
                  //       painter: OrbitTextsPainter(
                  //         controller.celestialBodies,
                  //         value,
                  //         time.delta,
                  //         controller.camera,
                  //       ),

                  //       ///child: Container(),
                  //     ),
                  //   ),
                  // ),
                ],
              );
            }),
        ValueListenableBuilder<StarSystemConfig>(
            valueListenable: controller.config,
            builder: (context, value, child) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeIn,
                switchOutCurve: Curves.easeOut,
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: value.selectedBody != null
                    ? WorkDesc(
                        celestialBody: value.selectedBody!,
                        backButton: controller.unselectCelestialBody,
                      )
                    : const SizedBox.shrink(),
              );
            }),
      ],
    );
  }
}
