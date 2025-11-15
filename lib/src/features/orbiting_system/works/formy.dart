import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/commons/widgets/text_list.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/my_colors.dart';

class Formy extends StatelessWidget {
  const Formy({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          Assets.formy,
          width: 300,
          colorFilter: const ColorFilter.mode(
            Color(0xff6DFFC5),
            BlendMode.srcIn,
          ),
        ),
        Text(
          '''

Formy é um pacote open source para Flutter que desenvolvi com o objetivo de simplificar radicalmente o gerenciamento de formulários, mantendo flexibilidade e controle total sobre o estado e validação dos campos.

Ele nasceu da necessidade de ter uma API enxuta, previsível e escalável para lidar com formulários complexos — desde inputs simples até grupos dinâmicos e dependências condicionais entre campos.

Foi projetado para funcionar bem em aplicações reais, evitando boilerplate e permitindo que desenvolvedores construam interfaces altamente reativas e fáceis de manter.''',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          '\nPrincipais características:',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const TextList(
          leadingIcon: Icon(
            Icons.circle,
            size: 6,
          ),
          children: [
            TextSpan(
              text:
                  'Controle centralizado do estado do formulário e de campos individuais',
            ),
            TextSpan(
              text:
                  'Validação síncrona e assíncrona com suporte a múltiplos validadores',
            ),
            TextSpan(
              text:
                  'Exibição automática de erros com granularidade por campo ou grupo',
            ),
            TextSpan(
              text:
                  'Escopo isolado por formulário, permitindo múltiplos coexistirem sem conflitos',
            ),
            TextSpan(
              text:
                  'Integração suave com UI customizada, mantendo reatividade e performance',
            ),
          ],
        ),
        Text(
          '''

O Formy representa meu compromisso em construir ferramentas que realmente facilitam a vida dos desenvolvedores, sem abrir mão de boas práticas como arquitetura limpa, testabilidade e código escalável.

É um projeto que não só mostra minha capacidade técnica em Flutter, mas também meu cuidado com experiência do usuário, design de API e sustentabilidade de longo prazo.''',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          '\nLink:',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const TextList(
          leadingIcon: Icon(
            Icons.circle,
            size: 6,
          ),
          children: [
            TextSpan(text: 'Github: ', children: [
              TextSpan(
                  text: 'https://github.com/hisnaider/flutter_formy',
                  style: TextStyle(
                    color: MyColors.primary,
                  )),
            ]),
            TextSpan(text: 'Pub.dev: ', children: [
              TextSpan(
                  text: 'https://pub.dev/packages/flutter_formy',
                  style: TextStyle(
                    color: MyColors.primary,
                  )),
            ]),
          ],
        ),
      ],
    );
  }
}
