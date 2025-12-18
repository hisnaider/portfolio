import 'package:flutter/material.dart';
import 'package:portfolio/core/values/assets.dart';

class AppScafoold extends StatelessWidget {
  const AppScafoold({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.universe),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(color: const Color.fromARGB(150, 3, 95, 95)),
            Container(
              color: const Color(0xaa030F0F),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
