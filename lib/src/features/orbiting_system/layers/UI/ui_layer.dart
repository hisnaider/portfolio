import 'package:flutter/material.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/features/orbiting_system/entities/star_system_config.dart';
import 'package:portfolio/src/features/orbiting_system/layers/UI/widgets/contact_section.dart';
import 'package:portfolio/src/features/orbiting_system/layers/UI/widgets/side_menu.dart';
import 'package:portfolio/src/features/orbiting_system/layers/UI/widgets/simulation_speed_slider.dart';

class UiLayer extends StatelessWidget {
  const UiLayer({super.key, required this.config});
  final ValueNotifier<StarSystemConfig> config;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<StarSystemConfig>(
        valueListenable: config,
        builder: (context, value, child) {
          final bool hideUi = value.showContact || value.selectedBody != null;
          return Stack(
            fit: StackFit.expand,
            children: [
              IgnorePointer(
                ignoring: hideUi,
                child: AnimatedOpacity(
                  opacity: hideUi ? 0 : 1,
                  duration: const Duration(milliseconds: 250),
                  child: SideMenu(
                    config: value,
                    onButtonPressed: (newConfig) => config.value = newConfig,
                  ),
                ),
              ),
              Positioned(
                left: 12,
                bottom: 12,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: hideUi ? 0 : 1,
                  child: Material(
                    color: MyColors.backgroud.withOpacity(0.75),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      width: 750,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Velocidade da simulação',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 5),
                          SimulationSpeedSlider(
                            currentValue: 1,
                            values: const [
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
                            ],
                            onChanged: (value) => config.value =
                                config.value.copyWith(simulationSpeed: value),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: value.selectedBody != null ? 0 : 1,
                child: ContactSection(
                  showContact: value.showContact,
                  toggleContact: (showContact) => config.value =
                      config.value.copyWith(showContact: showContact),
                ),
              ),
            ],
          );
        });
  }
}
