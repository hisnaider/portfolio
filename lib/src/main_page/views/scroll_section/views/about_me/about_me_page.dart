import 'package:flutter/material.dart';
import 'package:portfolio/src/main_page/views/scroll_section/feature/reveal_widget_feat/widgets/animated_reveal_item.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/about_me/widgets/hard_skills.dart';
import 'package:portfolio/src/main_page/views/scroll_section/views/about_me/widgets/soft_skills.dart';
import 'package:portfolio/src/main_page/views/scroll_section/widgets/section_container.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: const ValueKey('About me'),
      title: 'Estrela',
      subtitle: 'Sobre mim',
      padding: const EdgeInsets.fromLTRB(24, 90, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '''Sou Hisnaider Campello, desenvolvedor mobile focado em Flutter, com background em design e Figma. Formado em Sistemas de Informação e pós-graduando em Desenvolvimento Mobile, busco unir lógica, estética e experiência do usuário em interfaces rápidas e funcionais.

        Valorizo código limpo, testável e componentes reutilizáveis, e gosto de trabalhar em equipe compartilhando aprendizados. Atualmente exploro Python e aprimoro minha capacidade de criar sistemas escaláveis e bem estruturados.''',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          _animatedWidget(
            const HardSkills(),
          ),
          const SizedBox(height: 60),
          _animatedWidget(
            const SoftSkills(),
          ),
          const SizedBox(height: 90),
        ],
      ),
    );
  }

  AnimatedRevealItem _animatedWidget(Widget child) {
    return AnimatedRevealItem(
      triggerOffsetPx: 150,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOutCubic,
      animationBuilder:
          (BuildContext context, Animation<double> animation, Widget child) {
        final offset =
            Tween<Offset>(begin: const Offset(0, 0.5), end: const Offset(0, 0))
                .animate(animation);
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: offset,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
