import 'package:flutter/material.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/star_system_config.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/UI/widgets/contact_section.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/UI/widgets/side_menu.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/UI/widgets/simulation_speed.dart';
import 'package:portfolio/src/main_page/views/star_system/views/contact_container.dart';

class UiLayer extends StatelessWidget {
  const UiLayer({super.key, required this.config});
  final ValueNotifier<StarSystemConfig> config;

  @override
  Widget build(BuildContext context) {
    print('teste');
    return ValueListenableBuilder<StarSystemConfig>(
        valueListenable: config,
        builder: (context, value, child) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: value.showUi ? 1 : 0,
            child: MediaQuery.of(context).size.width <= 800
                ? const _MobileUi()
                : Stack(
                    fit: StackFit.expand,
                    children: [
                      SideMenu(
                        config: value,
                        onButtonPressed: (newConfig) =>
                            config.value = newConfig,
                      ),
                      SimulationSpeed(
                        currentValue: value.simulationSpeed,
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

class _MobileUi extends StatefulWidget {
  const _MobileUi({super.key});

  @override
  State<_MobileUi> createState() => __MobileUiState();
}

class __MobileUiState extends State<_MobileUi> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings_rounded,
                    size: 24,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.help_outline_outlined,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadiusGeometry.vertical(top: Radius.circular(10))),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  constraints: BoxConstraints(maxWidth: double.infinity),
                  isScrollControlled: true,
                  builder: (context) {
                    return ContactContainer(
                      isVertical: true,
                    );
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Ver contato',
                      style: Theme.of(context).textTheme.titleSmall!,
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded)
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
