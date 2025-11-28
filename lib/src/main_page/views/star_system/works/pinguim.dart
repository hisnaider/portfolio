import 'package:flutter/material.dart';
import 'package:portfolio/core/commons/widgets/text_list.dart';
import 'package:portfolio/core/values/assets.dart';

class Pinguim extends StatelessWidget {
  const Pinguim({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 400, child: Image.asset(Assets.pinguim)),
        Text(
          '''

Durante minha atuação no projeto — que inicialmente começou como uma rede social de viagens e posteriormente passou a ter foco B2B, com ênfase na página de administração — desempenhei um papel fundamental como membro experiente da equipe de desenvolvimento, colaborando em decisões técnicas, definição de arquitetura e na resolução de problemas complexos.''',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          '\nMinhas responsabilidades',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          '''

Fui responsável pela implementação da Clean Architecture, o que trouxe ao projeto maior escalabilidade, organização e facilidade de manutenção. Essa abordagem permitiu uma separação clara de responsabilidades entre camadas, reduzindo a dependência entre módulos e facilitando a evolução do código ao longo do tempo.

Além do desenvolvimento técnico, contribuí ativamente para o crescimento e a maturidade da equipe, promovendo mentorias sobre padrões arquiteturais, boas práticas de programação e o uso eficiente de ferramentas como o Bloc, voltado ao gerenciamento reativo de estados.''',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          '\nPrincipais contribuições',
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
                  'Desenvolvimento de componentes altamente reativos e otimizados, garantindo que cada widget respondesse de forma precisa e performática a mudanças de estado ou valores específicos;',
            ),
            TextSpan(
              text:
                  'Padronização do código e estrutura de projeto, melhorando a legibilidade e a manutenção a longo prazo;',
            ),
            TextSpan(
              text:
                  'Aumento da produtividade da equipe, graças à adoção de convenções técnicas e integração de boas práticas no fluxo de desenvolvimento.',
            ),
          ],
        ),
        Text(
          '''

Essas ações resultaram em um código mais consistente, sustentável e de alta qualidade, refletindo diretamente na eficiência da equipe e na estabilidade do produto final.''',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
