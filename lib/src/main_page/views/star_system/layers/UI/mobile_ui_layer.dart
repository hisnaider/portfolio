import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/main_page/controller/analytics.dart';
import 'package:portfolio/src/main_page/views/star_system/entities/star_system_config.dart';
import 'package:portfolio/src/main_page/views/star_system/layers/UI/widgets/simulation_speed.dart';
import 'package:portfolio/src/main_page/views/star_system/views/contact_container.dart';

class MobileUiLayer extends StatefulWidget {
  const MobileUiLayer({super.key, required this.config});
  final ValueNotifier<StarSystemConfig> config;

  @override
  State<MobileUiLayer> createState() => _MobileUiLayerState();
}

class _MobileUiLayerState extends State<MobileUiLayer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _heightFactor;

  bool showMenu = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _heightFactor =
        _animationController.drive(CurveTween(curve: Curves.easeInOutCirc));
  }

  void _toggleMenu() {
    final bool newMenuValue = !showMenu;
    if (newMenuValue) {
      showMenu = newMenuValue;

      _animationController.forward().then(
            (value) {},
          );
    } else {
      showMenu = newMenuValue;
      _animationController.reverse().then<void>((void value) {
        if (!mounted) {
          return;
        }
      });
    }

    setState(() {
      // Rebuild without widget.children.
    });
    PageStorage.maybeOf(context)?.writeState(context, newMenuValue);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<StarSystemConfig>(
        valueListenable: widget.config,
        builder: (context, value, child) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: value.showUi ? 1 : 0,
            child: IgnorePointer(
              ignoring: !value.showUi,
              child: Stack(
                children: [
                  AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        final bool closed =
                            !showMenu && _animationController.isDismissed;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (!closed)
                              _MenuContainer(
                                  config: widget.config,
                                  closed: closed,
                                  heightFactor: _heightFactor),
                            TextButton(
                                onPressed: _toggleMenu,
                                style: const ButtonStyle(
                                    foregroundColor:
                                        WidgetStatePropertyAll(Colors.white)),
                                child: showMenu
                                    ? _menuToggle(
                                        'Fechar',
                                        Icons.keyboard_arrow_up_rounded,
                                      )
                                    : _menuToggle(
                                        'Menu',
                                        Icons.keyboard_arrow_down_rounded,
                                      )),
                          ],
                        );
                      }),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Material(
                      color: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.vertical(
                              top: Radius.circular(10))),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            constraints:
                                const BoxConstraints(maxWidth: double.infinity),
                            isScrollControlled: true,
                            builder: (context) {
                              return const ContactContainer(
                                isVertical: true,
                              );
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Text(
                            'Ver contato',
                            style: Theme.of(context).textTheme.titleSmall!,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _menuToggle(String text, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 24,
        ),
        const SizedBox(width: 10),
        Text(text),
      ],
    );
  }
}

class _MenuContainer extends StatelessWidget {
  const _MenuContainer({
    required this.config,
    required this.closed,
    required Animation<double> heightFactor,
  }) : _heightFactor = heightFactor;
  final ValueNotifier<StarSystemConfig> config;
  final bool closed;
  final Animation<double> _heightFactor;

  void changeConfig({
    bool? showOrbitLine,
    bool? showPlanetNames,
    bool? showSelectionIndicator,
    double? simulationSpeed,
  }) {
    config.value = config.value.copyWith(
      showOrbitLine: showOrbitLine,
      showPlanetNames: showPlanetNames,
      showSelectionIndicator: showSelectionIndicator,
      simulationSpeed: simulationSpeed,
    );
  }

  void _toogleOrbit(bool value) {
    changeConfig(showOrbitLine: value);
    Analytics.instance
        .getTogglesEvent(action: value ? 'orbit_shown' : 'orbit_hidden');
  }

  void _tooglePlanetName(bool value) {
    changeConfig(showPlanetNames: value);
    Analytics.instance.getTogglesEvent(
        action: value ? 'planet_name_shown' : 'planet_name_hidden');
  }

  void _toogleSelectionIndicator(bool value) {
    changeConfig(showOrbitLine: value);
    Analytics.instance.getTogglesEvent(
        action: value ? 'indicator_shown' : 'indicator_hidden');
  }

  void _changeSimulationSpeed(double value) {
    changeConfig(simulationSpeed: value);
    Analytics.instance.getSimulationChangeEvent(speed: value);
  }

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Align(
          alignment: Alignment.bottomCenter,
          heightFactor: _heightFactor.value,
          child: ValueListenableBuilder<StarSystemConfig>(
              valueListenable: config,
              builder: (context, value, child) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  color: MyColors.backgroud,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _itemMenuButton(
                        onPressed: _toogleOrbit,
                        hide: value.showOrbitLine,
                        text: 'orbitas',
                        iconAssetOff: Assets.orbitOff,
                        iconAssetOn: Assets.orbitOn,
                      ),
                      const SizedBox(height: 10),
                      _itemMenuButton(
                        onPressed: _tooglePlanetName,
                        hide: value.showPlanetNames,
                        text: 'nome dos planetas',
                        iconAssetOff: Assets.nameOff,
                        iconAssetOn: Assets.nameOn,
                      ),
                      const SizedBox(height: 10),
                      _itemMenuButton(
                        onPressed: _toogleSelectionIndicator,
                        hide: value.showSelectionIndicator,
                        text: 'indicador',
                        iconAssetOff: Assets.selectOff,
                        iconAssetOn: Assets.selectOn,
                      ),
                      const SizedBox(height: 10),
                      SimulationSpeed(
                        currentValue: value.simulationSpeed,
                        onChanged: _changeSimulationSpeed,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget _itemMenuButton({
    required Function(bool value) onPressed,
    required bool hide,
    required String text,
    required String iconAssetOn,
    required String iconAssetOff,
  }) {
    return TextButton(
        onPressed: () => onPressed(!hide),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              hide ? iconAssetOn : iconAssetOff,
              height: 42,
            ),
            const SizedBox(width: 10),
            Text(
              '${hide ? 'Esconder' : 'Mostrar'} $text',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ],
        ));
  }
}
