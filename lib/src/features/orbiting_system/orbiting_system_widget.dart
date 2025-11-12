import 'package:flutter/material.dart';
import 'package:portfolio/src/features/orbiting_system/controller/star_system_controller.dart';
import 'package:portfolio/src/features/orbiting_system/controller/time_controller.dart';
import 'package:portfolio/src/features/orbiting_system/entities/camera.dart';
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/star_entity.dart';
import 'package:portfolio/src/features/orbiting_system/entities/star_system_config.dart';
import 'package:portfolio/src/features/orbiting_system/layers/UI/ui_layer.dart';
import 'package:portfolio/src/features/orbiting_system/layers/orbit_layer.dart';
import 'package:portfolio/src/features/orbiting_system/layers/orbit_texts_painter.dart';
import 'package:portfolio/src/features/orbiting_system/layers/selection_indicator_painter.dart';
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
  late bool _hideOrbit;
  late bool _hidePlanetName;
  late bool _hideSelectionIndicator;

  @override
  void initState() {
    super.initState();
    time = TimeController(this)..start();
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
                  AnimatedOpacity(
                    opacity:
                        !controller.config.value.showSelectionIndicator ? 0 : 1,
                    duration: Duration(milliseconds: 250),
                    child: IgnorePointer(
                      child: CustomPaint(
                        size: Size.infinite,
                        painter: SelectionIndicatorPainter(
                          controller.celestialBodies,
                          value,
                          camera,
                          controller.config.value.hoveredBody,
                        ),
                      ),
                    ),
                  ),
                  OrbitLayer(
                    showOrbit: controller.config.value.showOrbitLine,
                    celestialBody: controller.celestialBodies,
                    camera: camera,
                  ),
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
                        controller.config.value.hoveredBody?.id,
                      ),

                      ///child: Container(),
                    ),
                  ),
                  OrbitTextsPainter(
                    celestialBody: controller.celestialBodies,
                    elapsed: value,
                    deltaTime: time.delta,
                    camera: controller.camera,
                    showPlanetName:
                        controller.config.value.selectedBody != null ||
                            controller.config.value.showPlanetNames,
                  ),
                ],
              );
            }),
        UiLayer(config: controller.config),
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
