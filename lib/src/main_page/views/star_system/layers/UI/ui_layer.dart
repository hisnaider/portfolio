import 'package:flutter/material.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/star_system_config.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/UI/widgets/contact_section.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/UI/widgets/side_menu.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/UI/widgets/simulation_speed.dart';

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
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: SimulationSpeed(
                    currentValue: value.simulationSpeed,
                    onChanged: (value) => config.value =
                        config.value.copyWith(simulationSpeed: value),
                  ),
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
