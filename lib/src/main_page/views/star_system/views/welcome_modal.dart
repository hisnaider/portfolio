import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/widgets/primary_button.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/main_page/controller/analytics.dart';

const Color backgroundColor = MyColors.backgroud;

class WelcomeModal extends StatefulWidget {
  const WelcomeModal({super.key});

  @override
  State<WelcomeModal> createState() => _WelcomeModalState();
}

class _WelcomeModalState extends State<WelcomeModal> {
  final ScrollController controller = ScrollController();
  bool _showIcon = false;
  double max = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      setState(() {
        _showIcon = controller.offset < max - 25;
      });
    });
  }

  void _toggleIcon() {
    final bool showIcon = controller.offset < max - 25;
    if (_showIcon != showIcon) {
      WidgetsBinding.instance.addPostFrameCallback((duration) {
        setState(() {
          _showIcon = showIcon;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      max = controller.position.maxScrollExtent;
    });
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 750, maxWidth: 1200),
        margin: const EdgeInsets.all(24),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: backgroundColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          controller: controller,
          child: SelectionArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Bem vindo ao sistema estelar Hisnaider',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 24),
                Text(
                  '''Fico feliz que chegou até aqui. A partir desse ponto a jornada deixa de ser apenas rolar a pagina e se torna exploração.

Você está entrando no meu sistema solar. Ele é o mapa do que sou como profissional, a estrela ao centro sou eu e, orbitando ao redor, estão os planetas que carregam meus projetos e trabalhos.

Que sua exploração seja leve, curiosa e inspiradora.
E que você volte quando novos mundos surgirem ou quando chegar a hora de criarmos juntos o planeta da sua empresa.''',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),
                Text(
                  'Primeiro registro',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    Assets.firstRecord,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: PrimaryButton(
                    onPressed: () {
                      Analytics.instance.getCloseIntroductionModalEvent();
                      Navigator.pop(context);
                    },
                    text: 'Visualizar sistema estelar',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
