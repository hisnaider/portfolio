// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:portfolio/core/commons/entities/works.dart';
import 'package:portfolio/core/commons/enum/skills_enum.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/my_colors.dart';
import 'package:portfolio/src/main_page/views/star_system/works/ciex.dart';
import 'package:portfolio/src/main_page/views/star_system/works/formy.dart';
import 'package:portfolio/src/main_page/views/star_system/works/pinguim.dart';
import 'package:portfolio/src/main_page/views/star_system/works/raquel.dart';

class MyData {
  const MyData._();

  static const mainSkills = [
    SkillsEnum.flutter,
    SkillsEnum.dart,
    SkillsEnum.figma,
    SkillsEnum.cleanArchitecture,
  ];
  static const otherSkills = [
    SkillsEnum.webDevelopment,
    SkillsEnum.apiRest,
    SkillsEnum.powerAutomate,
    SkillsEnum.sharePoint,
  ];
  static const softSkills = [
    SkillsEnum.leadership,
    SkillsEnum.proactivity,
    SkillsEnum.continuousLearning,
    SkillsEnum.technicalEmpathy,
  ];

  static AboutInfo mySelf = const AboutInfo(
    companyName: 'Hisnaider Ribeiro Campello',
    companyImage: Assets.photo,
    projectName: 'HC.Dev',
    role: 'Desenvolvedor mobile',
    color: MyColors.backgroudDarker,
    competences: [
      'Flutter',
      'Dart',
      'Clean Arch',
      'Bloc',
      'GetX',
      'Consumo de API',
      'Liderança',
      'Proatividade',
      'Aprendizado contínuo',
      'Empatia técnica'
    ],
    desc: '',
    mainResponsibilities: [],
    offers: [],
    myPerformance: '',
    images: [],
    links: [],
  );

  static AboutInfo raquelMenopausa = const AboutInfo(
    companyName: 'iTec/FURG-Embrapii',
    companyImage: Assets.itec,
    projectName: 'Raquel Menopausa',
    role: 'Pesquisador Júnior',
    competences: [
      'Flutter',
      'Dart',
      'Clean Arch',
      'GetX',
      'Consumo de API',
      'Liderança',
      'Proatividade',
      'Aprendizado contínuo',
      'Empatia técnica'
    ],
    color: Colors.red,
    desc:
        'Raquel Menopausa é um aplicativo gratuito que ajuda mulheres a navegar pelo climatério com mais informação, acolhimento e autonomia. Mais do que um app, é um projeto que coloca tecnologia a serviço da saúde e do bem-estar feminino, promovendo uma jornada de autoconhecimento e conexão.',
    offers: [
      'Identificação do estágio do climatério, com base em respostas e sintomas, oferecendo um retrato claro do seu estado hormonal e físico',
      'Comunidade exclusiva, para trocar experiências, receber apoio e sentir-se compreendida por quem está passando pelo mesmo momento',
      'Conteúdos científicos e informativos sobre saúde, bem-estar e estilo de vida durante o climatério',
      'Diário de sintomas e hábitos, que ajuda a monitorar padrões individuais e facilita o acompanhamento médico',
    ],
    myPerformance:
        'Atuei como pesquisador júnior, liderando tecnicamente o desenvolvimento mobile do projeto. Fui o mais experiente do grupo, o que me permitiu não só tomar decisões críticas de arquitetura e tecnologia, mas também orientar e ajudar os colegas sempre que necessário, garantindo que todo o time evoluísse junto.',
    mainResponsibilities: [
      'Definição e implementação da Clean Architecture, garantindo um código desacoplado, testável e sustentável, adaptado às demandas esperados de um app da área da saúde',
      'Gestão avançada de estado com GetX, trabalhando com modularização, injeção de dependências e navegação robusta para fluxos complexos',
      'Desenvolvimento de funcionalidades críticas e componentes performáticos, assegurando uma UX fluida e uma lógica de negócios confiável',
      'Atuação ativa na evolução técnica da equipe, promovendo discussões sobre padrões, boas práticas e ajudando colegas na adoção da arquitetura limpa e no uso das ferramentas do projeto',
    ],
    images: [
      Assets.raquelPrint1,
      Assets.raquelPrint2,
      Assets.raquelPrint3,
    ],
    links: [
      LinkText(
          label: 'Google Play',
          link:
              'https://play.google.com/store/apps/details?id=com.raquelmenopausa.raquelapp&hl=pt_BR'),
    ],
  );

  static AboutInfo pinguim = const AboutInfo(
    companyName: 'iTec/FURG-Embrapii',
    companyImage: Assets.itec,
    projectName: 'Pinguim',
    role: 'Pesquisador Júnior',
    color: Colors.red,
    competences: [
      'Flutter',
      'Dart',
      'Clean Arch”',
      'Bloc',
      'Consumo de API',
      'Liderança',
      'Proatividade',
      'Aprendizado contínuo',
      'Empatia técnica'
    ],
    desc:
        'Durante minha atuação no projeto — que inicialmente começou como uma rede social de viagens e posteriormente passou a ter foco B2B, com ênfase na página de administração — desempenhei um papel fundamental como membro experiente da equipe de desenvolvimento, colaborando em decisões técnicas, definição de arquitetura e na resolução de problemas complexos',
    offers: [],
    mainResponsibilities: [
      'Desenvolvimento de componentes altamente reativos e otimizados, garantindo que cada widget respondesse de forma precisa e performática a mudanças de estado ou valores específicos',
      'Padronização do código e estrutura de projeto, melhorando a legibilidade e a manutenção a longo prazo',
      'Aumento da produtividade da equipe, graças à adoção de convenções técnicas e integração de boas práticas no fluxo de desenvolvimento',
    ],
    myPerformance:
        '''Fui responsável pela implementação da Clean Architecture, o que trouxe ao projeto maior escalabilidade, organização e facilidade de manutenção. Essa abordagem permitiu uma separação clara de responsabilidades entre camadas, reduzindo a dependência entre módulos e facilitando a evolução do código ao longo do tempo.

Além do desenvolvimento técnico, contribuí ativamente para o crescimento e a maturidade da equipe, promovendo mentorias sobre padrões arquiteturais, boas práticas de programação e o uso eficiente de ferramentas como o Bloc, voltado ao gerenciamento reativo de estados.''',
    images: [],
    links: [],
  );
  static AboutInfo formy = const AboutInfo(
    companyName: 'Projeto pessoal',
    companyImage: '',
    projectName: 'Formy',
    role: 'Desenvolvedor Flutter Open Source',
    color: Colors.red,
    competences: ['Flutter', 'Dart', 'Proatividade', 'Aprendizado contínuo'],
    desc: '''
Formy é um pacote open source para Flutter que desenvolvi com o objetivo de simplificar radicalmente o gerenciamento de formulários, mantendo flexibilidade e controle total sobre o estado e validação dos campos.

Ele nasceu da necessidade de ter uma API enxuta, previsível e escalável para lidar com formulários complexos — desde inputs simples até grupos dinâmicos e dependências condicionais entre campos.

Foi projetado para funcionar bem em aplicações reais, evitando boilerplate e permitindo que desenvolvedores construam interfaces altamente reativas e fáceis de manter.''',
    mainResponsibilities: [],
    offers: [
      'Controle centralizado do estado do formulário e de campos individuais',
      'Validação síncrona e assíncrona com suporte a múltiplos validadores',
      'Exibição automática de erros com granularidade por campo ou grupo',
      'Escopo isolado por formulário, permitindo múltiplos coexistirem sem conflitos',
      'Integração suave com UI customizada, mantendo reatividade e performance',
    ],
    myPerformance: '''
O Formy representa meu compromisso em construir ferramentas que realmente facilitam a vida dos desenvolvedores, sem abrir mão de boas práticas como arquitetura limpa, testabilidade e código escalável.

É um projeto que não só mostra minha capacidade técnica em Flutter, mas também meu cuidado com experiência do usuário, design de API e sustentabilidade de longo prazo.''',
    images: [],
    links: [
      LinkText(
          label: 'Github', link: 'https://github.com/hisnaider/flutter_formy'),
      LinkText(
          label: 'Pub.dev', link: 'https://pub.dev/packages/flutter_formy'),
    ],
  );

  static AboutInfo ciex = const AboutInfo(
    companyName: 'CIEX',
    companyImage: Assets.ciex,
    projectName: 'CIEX',
    role: 'Pesquisador Front-end',
    color: Colors.red,
    competences: [
      'Flutter',
      'Dart',
      'Clean Arch”',
      'GetX',
      'Consumo de API',
      'Proatividade',
      'Aprendizado contínuo',
    ],
    desc:
        '''O Centro Interinstitucional de Observação e Previsão de Eventos Extremos (CIEX – FURG) lidera a criação do Digital Twin Lagoa dos Patos (DT-LAGOA), uma plataforma digital de alta fidelidade para simular, monitorar e prever, em tempo real, fenômenos meteocenográficos, hidrológicos, hidrodinâmicos e eventos de inundação no sul do Rio Grande do Sul.

O projeto integra instituições, sensores ambientais, redes de monitoramento, supercomputação e sistemas de visualização, oferecendo dados qualificados para órgãos de segurança, prefeituras, defesas civis, pesquisadores e tomadores de decisão.''',
    mainResponsibilities: [
      'Transformar os requisitos operacionais e visuais do Video Wall em uma solução funcional e robusta',
      'Definir e implementar o layout completo da aplicação em Flutter',
      'Integrar conteúdos institucionais como logos, vídeos e imagens',
      'Desenvolver e manter o fluxo de exibição contínuo para operação 24/7',
      'Realizar testes, otimizações de performance e ajustes visuais',
      'Assegurar a confiabilidade da interface e a precisão das informações exibidas',
      'Estruturar a aplicação para permitir expansão e inclusão de novos conteúdos no futuro',
    ],
    offers: [
      'Rede integrada de monitoramento com estações meteocenográficas, hidrológicas e geodésicas distribuídas estrategicamente na Lagoa dos Patos',
      'Sistema computacional de alto desempenho para processar modelos hidrodinâmicos, meteorológicos, de inundação e séries históricas em tempo real',
      'Ambiente virtual integrador que centraliza dados observacionais, modelos numéricos, painéis interativos e comunicação com órgãos públicos',
      'Video Wall institucional para exibição contínua de informações operacionais, gráficos, vídeos, alertas, previsões e indicadores',
      'Integração interinstitucional por meio de capacitações, alinhamentos operacionais e formação técnica para equipes de segurança, gestores e universidades.'
    ],
    myPerformance:
        ''''Desenvolvi toda a interface do Video Wall do CIEX - DT LAGOA em Flutter, incluindo gráficos, indicadores e vídeos institucionais, integrada às APIs oficiais para atualização em tempo real. Implementei também o salvamento e exibição de páginas web, além de um gerenciador de mídias que permite adicionar e reproduzir vídeos e imagens no aplicativo. Todos os dados são persistidos localmente com Isar, garantindo operação estável mesmo sem internet. A interface foi projetada para ser modular, escalável e otimizada para telas de grande formato.''',
    images: [],
    links: [
      LinkText(
          label: 'GZH',
          text:
              'Com foco no acompanhamento do nível da Lagoa dos Patos, centro de monitoramento de eventos extremos é inaugurado em Rio Grande',
          link:
              'https://gauchazh.clicrbs.com.br/zona-sul/ciencia/noticia/2025/11/com-foco-no-acompanhamento-do-nivel-da-lagoa-dos-patos-centro-de-monitoramento-de-eventos-extremos-e-inaugurado-em-rio-grande-cmhl3smz000x80154tm6vs0pi.html')
    ],
  );
}
