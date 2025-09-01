import 'package:flutter/material.dart';
import 'package:portfolio/core/values/my_colors.dart';

class FormyBody extends StatelessWidget {
  const FormyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              const TextSpan(
                text: '''
Formy é um pacote open source para Flutter que desenvolvi com o objetivo de simplificar radicalmente o gerenciamento de formulários, mantendo flexibilidade e controle total sobre o estado e validação dos campos.
Ele nasceu da necessidade de ter uma API enxuta, previsível e escalável para lidar com formulários complexos — desde inputs simples até grupos dinâmicos e dependências condicionais entre campos.
Foi projetado para funcionar bem em aplicações reais, evitando boilerplate e permitindo que desenvolvedores construam interfaces altamente reativas e fáceis de manter.

''',
              ),
              TextSpan(
                text: 'Principais características:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const TextSpan(
                text: '''

- Controle centralizado do estado do formulário e de campos individuais
- Validação síncrona e assíncrona com suporte a múltiplos validadores
- Exibição automática de erros com granularidade por campo ou grupo
- Escopo isolado por formulário, permitindo múltiplos coexistirem sem conflitos
- Integração suave com UI customizada, mantendo reatividade e performance

O Formy representa meu compromisso em construir ferramentas que realmente facilitam a vida dos desenvolvedores, sem abrir mão de boas práticas como arquitetura limpa, testabilidade e código escalável.
É um projeto que não só mostra minha capacidade técnica em Flutter, mas também meu cuidado com experiência do usuário, design de API e sustentabilidade de longo prazo.

''',
              ),
              TextSpan(
                text: 'Links:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const TextSpan(
                text: '\n- Github: ',
              ),
              const TextSpan(
                  text: 'https://github.com/hisnaider/flutter_formy',
                  style: TextStyle(color: MyColors.primary)),
              const TextSpan(
                text: '\n- Pub.dev: ',
              ),
              const TextSpan(
                  text: 'https://pub.dev/packages/flutter_formy',
                  style: TextStyle(color: MyColors.primary)),
            ],
          ),
        ),
//         Text(
//           '''
// Formy é um pacote open source para Flutter que desenvolvi com o objetivo de simplificar radicalmente o gerenciamento de formulários, mantendo flexibilidade e controle total sobre o estado e validação dos campos.
// Ele nasceu da necessidade de ter uma API enxuta, previsível e escalável para lidar com formulários complexos — desde inputs simples até grupos dinâmicos e dependências condicionais entre campos.
// Foi projetado para funcionar bem em aplicações reais, evitando boilerplate e permitindo que desenvolvedores construam interfaces altamente reativas e fáceis de manter.''',
//           style: Theme.of(context).textTheme.bodyMedium,
//         ),
      ],
    );
  }
}
