import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/my_colors.dart';

class ContactSection extends StatefulWidget {
  const ContactSection(
      {super.key, required this.showContact, required this.toggleContact});
  final bool showContact;
  final Function(bool showContact) toggleContact;

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _heightFactor;
  late Animation<double> _iconFlip;
  late Animation<double> _textOpacity;

  late bool showContact;

  @override
  void initState() {
    super.initState();
    showContact = widget.showContact;
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _heightFactor =
        _animationController.drive(CurveTween(curve: Curves.easeInOutCirc));
    _iconFlip = _animationController.drive(Tween<double>(begin: 0, end: 1));
    _textOpacity = _animationController.drive(Tween<double>(begin: 1, end: 0));
  }

  @override
  void didUpdateWidget(covariant ContactSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (showContact != widget.showContact) {
      final bool newToggleValue = widget.showContact;
      if (newToggleValue) {
        showContact = newToggleValue;
        _animationController.forward().then(
              (value) {},
            );
      } else {
        _animationController.reverse().then<void>((void value) {
          showContact = newToggleValue;
          if (!mounted) {
            return;
          }
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.maybeOf(context)?.writeState(context, newToggleValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !showContact && _animationController.isDismissed;
    return AnimatedBuilder(
        animation: _animationController.view,
        builder: (context, child) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _ToggleContact(
                onPressed: () => widget.toggleContact(!widget.showContact),
                flipValue: _iconFlip.value,
                opacityValue: _textOpacity.value,
              ),
              if (showContact)
                _ContactContainer(closed: closed, heightFactor: _heightFactor),
            ],
          );
        });
  }
}

class _ContactContainer extends StatelessWidget {
  const _ContactContainer({
    required this.closed,
    required Animation<double> heightFactor,
  }) : _heightFactor = heightFactor;

  final bool closed;
  final Animation<double> _heightFactor;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Align(
          alignment: Alignment.topCenter,
          heightFactor: _heightFactor.value,
          child: Container(
            padding: const EdgeInsets.all(64),
            color: const Color(0xff0C0C0E),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('CONTATO', style: Theme.of(context).textTheme.titleLarge),
                Text(
                  'Seu proximo grande projeto começa aqui. Entre em contato',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        '''Gostou do meu trabalho ou quer saber mais sobre mim?
                  Vamos bater um papo! Me chama por onde preferir''',
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                      child: VerticalDivider(
                        width: 83,
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ContactLink(
                            asset: Assets.email,
                            text: 'hisnaider.dev@gmail.com',
                            onPressed: () {},
                          ),
                          _ContactLink(
                            asset: Assets.github,
                            text: 'github.com/hisnaider',
                            onPressed: () {},
                          ),
                          _ContactLink(
                            asset: Assets.linkedin,
                            text:
                                'linkedin.com/in/hisnaider-r-campello-3a420698',
                            onPressed: () {},
                          ),
                          _ContactLink(
                            asset: Assets.phone,
                            text: '+55 53 99128-0480',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 48),
                SvgPicture.asset(Assets.myLogoSvg, height: 25)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ToggleContact extends StatelessWidget {
  const _ToggleContact({
    required this.onPressed,
    required this.flipValue,
    required this.opacityValue,
  });
  final VoidCallback onPressed;
  final double flipValue;
  final double opacityValue;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Opacity(
                opacity: opacityValue,
                child: Text(
                  'CONTATO',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 24),
                ),
              ),
              Transform(
                transform: Matrix4.rotationX((flipValue * pi)),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.keyboard_arrow_up_rounded,
                  size: 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactLink extends StatelessWidget {
  const _ContactLink(
      {required this.asset, required this.text, required this.onPressed});
  final String asset;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Row(
        children: [
          SvgPicture.asset(asset),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            onPressed: () {},
            style: const ButtonStyle(
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5))),
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 20, color: MyColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
