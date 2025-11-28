import 'package:flutter/material.dart';
import 'package:portfolio/core/values/planets.dart';
import 'package:portfolio/src/main_page/views/star_system/controller/star_system_controller.dart';
import 'package:portfolio/src/main_page/views/star_system/controller/time_controller.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/camera.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/star_system_config.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/UI/ui_layer.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/orbit_layer.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/orbit_texts_painter.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/selection_indicator_painter.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/star_system_painter.dart';
import 'package:portfolio/src/main_page/views/star_system/views/welcome_modal.dart';
import 'package:portfolio/src/main_page/views/star_system/widgets/work_desc.dart';

class StarSystemPage extends StatefulWidget {
  const StarSystemPage({super.key});

  @override
  State<StarSystemPage> createState() => _StarSystemPageState();
}

class _StarSystemPageState extends State<StarSystemPage>
    with SingleTickerProviderStateMixin {
  final Camera camera = Camera();
  late TimeController time;
  late final StarSystemController controller;

  @override
  void initState() {
    super.initState();
    time = TimeController(this)..stop();
    controller = StarSystemController(
      camera: camera,
      star: CelestialBodies.hisnaider,
      planets: [
        CelestialBodies.raquel,
        CelestialBodies.formy,
        CelestialBodies.perroni,
        CelestialBodies.pinguim,
        CelestialBodies.ciex,
      ],
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showGeneralDialog(
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) =>
            const WelcomeModal(),
      ).then((value) {
        time.start();
        controller.config.value = controller.config.value.start();
      });
    });
  }

  @override
  void dispose() {
    time.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa desgraça');
    final bool isDesktop = [
      TargetPlatform.windows,
      TargetPlatform.linux,
      TargetPlatform.macOS
    ].contains(Theme.of(context).platform);
    final Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        ValueListenableBuilder<double>(
            valueListenable: time.elapsed,
            builder: (context, value, child) {
              controller.update(time.delta, screenSize);
              return Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: const Color(0xaa030F0F),
                  ),
                  Container(
                    color: const Color(0xaa030F0F),
                  ),
                  AnimatedOpacity(
                    opacity:
                        !controller.config.value.showSelectionIndicator ? 0 : 1,
                    duration: const Duration(milliseconds: 250),
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
                  IgnorePointer(
                    ignoring: !controller.config.value.showUi,
                    child: Listener(
                      onPointerHover: (event) {
                        if (!isDesktop) return;
                        controller.getEvent(event);
                      },
                      onPointerSignal: (event) {
                        if (!isDesktop) return;
                        controller.getEvent(event);
                      },
                      onPointerMove: controller.getEvent,
                      onPointerDown: controller.getEvent,
                      onPointerUp: controller.getEvent,
                      child: GestureDetector(
                        onScaleStart: controller.handleScaleStart,
                        onScaleUpdate: controller.handleScaleUpdate,
                        onScaleEnd: controller.handleScaleEnd,
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

// class StarSystemPage extends StatefulWidget {
//   const StarSystemPage({super.key});

//   @override
//   State<StarSystemPage> createState() => _StarSystemPageState();
// }

// class _StarSystemPageState extends State<StarSystemPage> {
//   @override
//   Widget build(BuildContext context) {
//     print('asdasd');
//     return Center(
//       child: OrbitingSystemWidget(
//         star: CelestialBodies.hisnaider,
//         planets: [
//           CelestialBodies.raquel,
//           CelestialBodies.formy,
//           CelestialBodies.perroni,
//           CelestialBodies.pinguim,
//           CelestialBodies.ciex,
//         ],
//       ),
//     );
//   }
// }
