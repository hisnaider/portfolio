import 'package:flutter/material.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/star_system_config.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/UI/widgets/side_menu.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/UI/widgets/simulation_speed.dart';
import 'package:portfolio/src/main_page/views/star_system/views/contact_container.dart';

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
                  bottom: 0,
                  left: 0,
                  child: SimulationSpeed(
                    currentValue: value.simulationSpeed,
                    onChanged: (value) => config.value =
                        config.value.copyWith(simulationSpeed: value),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Material(
                    clipBehavior: Clip.hardEdge,
                    color: Colors.transparent,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          constraints:
                              const BoxConstraints(maxWidth: double.infinity),
                          isScrollControlled: true,
                          builder: (context) {
                            return const ContactContainer(
                              isVertical: false,
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'VER CONTATO',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 24),
                            ),
                            // const Icon(
                            //   Icons.keyboard_arrow_up_rounded,
                            //   size: 50,
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
