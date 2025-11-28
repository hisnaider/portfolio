import 'package:flutter/material.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/star_system_config.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/UI/widgets/contact_section.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/UI/widgets/side_menu.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/UI/widgets/simulation_speed.dart';

const List<double> simulationSpeed = [
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

class UiLayer extends StatelessWidget {
  const UiLayer({super.key, required this.config});
  final ValueNotifier<StarSystemConfig> config;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<StarSystemConfig>(
        valueListenable: config,
        builder: (context, value, child) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: value.showUi ? 1 : 0,
            child: Stack(
              fit: StackFit.expand,
              children: [
                SideMenu(
                  config: value,
                  onButtonPressed: (newConfig) => config.value = newConfig,
                ),
                SimulationSpeed(
                  currentValue: value.simulationSpeed,
                  values: simulationSpeed,
                  onChanged: (value) => config.value =
                      config.value.copyWith(simulationSpeed: value),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: value.showContact ? 1 : 0,
                  child: const ContactSection(),
                ),
              ],
            ),
          );
        });
  }
}
