import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/src/main_page/views/star_system/views/contact_container.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _heightFactor;
  late Animation<double> _iconFlip;
  late Animation<double> _textOpacity;

  bool showContact = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _heightFactor =
        _animationController.drive(CurveTween(curve: Curves.easeInOutCirc));
    _iconFlip = _animationController.drive(Tween<double>(begin: 0, end: 1));
    _textOpacity = _animationController.drive(Tween<double>(begin: 1, end: 0));
  }

  void _toggleContact() {
    final bool newToggleValue = !showContact;
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
      });
    }
    setState(() {
      // Rebuild without widget.children.
    });
    PageStorage.maybeOf(context)?.writeState(context, newToggleValue);
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !showContact && _animationController.isDismissed;
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _ToggleContact(
                onPressed: _toggleContact,
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
            child: const ContactContainer(isVertical: false)),
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
