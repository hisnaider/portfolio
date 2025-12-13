// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:portfolio/core/commons/entities/about_info.dart';
import 'package:portfolio/core/commons/enum/skills_enum.dart';
import 'package:portfolio/core/values/assets.dart';

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

  static AboutMeInfo mySelf = const AboutMeInfo(
    name: 'Hisnaider Ribeiro Campello',
    photo: Assets.photo,
    banner: Assets.myLogoSvg,
    role: 'Desenvolvedor mobile',
    color: Color(0xff1E1E1E),
    desc:
        '''Sou um desenvolvedor mobile de 27 anos, nascido na cidade de Rio Grande, no Rio Grande do Sul (sim, mesma vibe no nome, mas é cidade e estado diferentes). Sempre gostei de tecnologia. Quando criança, meu sonho era criar jogos; desmontava coisas, imaginava mundos e vivia inventando histórias. Mas foi no curso de Sistemas de Informação — no qual me formei bacharel — que descobri minha verdadeira vocação: o desenvolvimento front-end.

Comecei com React Native em 2022, mas no ano seguinte migrei para Flutter e nunca mais larguei. Programação deixou de ser apenas profissão: virou hobby, válvula de escape e parte da minha identidade. Trabalhar com algo que eu realmente gosto é um privilégio que valorizo muito.''',
    hobbies: [
      'Jogos eletrônicos (Steam e Nintendo Switch)',
      'Programar — principalmente em Flutter',
      'Música (bem eclético, mas costumo ouvir mais eletrônica e pop)',
      'Futebol (Gremista desde piá)',
      'Academia (vou pra ficar gostoso; a saúde é só um bônus kkkkk)',
    ],
    personalPurpose:
        'Trabalho e estudo todos os dias para deixar meus pais orgulhosos e para ter a oportunidade de ajudar outras pessoas. Seja desenvolvendo aplicações bem feitas, compartilhando conhecimento sobre programação ou — no futuro, quando eu estiver rico — apoiando quem mais precisa através de doações e projetos sociais.',
    myValues: [
      'Valores Pessoais: Família, Amigos, Independência, Humildade.',
      'Valores de Crescimento: Aprendizado Contínuo, Honestidade, Responsabilidade',
    ],
    whyASolarSystem:
        '''Meu interesse por astronomia começou na adolescência. Eu passava horas lendo sobre planetas, assistindo vídeos sobre o Sistema Solar e imaginando como poderiam ser os mundos além dele. Com o tempo, deixei esse hobby de lado para focar em outras coisas, mas a curiosidade sempre ficou ali, quieta, esperando.

Quando comecei o design do meu portfólio, eu sentia que faltava algo — algo que tivesse a minha identidade. Depois de muito quebrar a cabeça, me veio o estalo:
“E se o meu portfólio fosse um sistema solar, onde eu sou a estrela e os planetas representam meus projetos e trabalhos?”

A partir dessa ideia, tudo se encaixou. O design fluiu naturalmente. Eu não fazia ideia de como construir um sistema solar interativo nem como representar os planetas, mas mergulhei no estudo e fui aprendendo até conseguir transformar a ideia em realidade.''',
  );

  static AboutWorkInfo raquelMenopausa = const AboutWorkInfo(
    name: 'iTec/FURG-Embrapii',
    projectName: 'Raquel Menopausa',
    introduction:
        'Aplicativo gratuito que apoia mulheres no climatério com informação, acolhimento e autonomia. Atuei como desenvolvedor líder no app Raquel Menopausa, responsável pela definição da Clean Architecture, gestão de estado com GetX, modularização e injeção de dependências. Desenvolvi componentes críticos e otimizei a performance do app, além de orientar a equipe em boas práticas e arquitetura limpa.',
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

  static AboutWorkInfo pinguim = const AboutWorkInfo(
    name: 'iTec/FURG-Embrapii',
    projectName: 'Pinguim',
    role: 'Pesquisador Júnior',
    introduction:
        'Aplicativo que começou como uma rede social de viagens e evoluiu para uma plataforma B2B voltada à gestão e conexão de experiências de viagem. Atuei como desenvolvedor experiente, responsável pela definição e implementação da Clean Architecture, padronização da base de código e criação de componentes reativos com Bloc. Também liderei decisões técnicas e mentorias sobre boas práticas, contribuindo para a maturidade e produtividade da equipe.',
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

  static AboutWorkInfo formy = const AboutWorkInfo(
    name: 'Projeto pessoal',
    projectName: 'Formy',
    photo: Assets.myLogo,
    banner: Assets.formy,
    role: 'Desenvolvedor Flutter Open Source',
    introduction:
        'Biblioteca open source para Flutter desenvolvida para simplificar o gerenciamento de formulários complexos com controle total de estado e validação. Criei o pacote do zero com foco em escalabilidade, reatividade e API enxuta, aplicando princípios de arquitetura limpa e testabilidade. O Formy permite formulários dinâmicos, validação granular e integração fluida com UIs personalizadas.',
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

  static AboutWorkInfo ciex = const AboutWorkInfo(
    name: 'FURG',
    projectName: 'CIEX',
    role: 'Pesquisador Front-end',
    introduction:
        'O projeto CIEX tem como objetivo criar um gêmeo digital da Lagoa dos Patos para integrar dados em tempo real e permitir o monitoramento e a previsão de eventos climáticos extremos no sul do Rio Grande do Sul. No projeto, sou responsável pelo desenvolvimento da interface do video wall, que exibe gráficos, vídeos, logos e informações dinâmicas de forma visual e interativa, utilizando Flutter com foco em desempenho, fluidez e design moderno.',
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

  static AboutWorkInfo pss = const AboutWorkInfo(
    name: 'perroni sanvicente & schirmer advogados',
    projectName: 'PSS',
    role: 'Freelancer',
    competences: [
      'Power Automate',
      'SharePoint',
      'Proatividade',
      'Aprendizado contínuo'
    ],
    desc:
        'A empresa possuía diversas listas no SharePoint relacionadas a demandas jurídicas e informações de clientes. Fui contratado para automatizar processos usando Power Automate, incluindo criação, edição, conclusão e cancelamento de demandas, além de comunicação por e-mail e geração de relatórios. Também desenvolvi fluxos auxiliares para manter listas atualizadas e padronizadas.',
    mainResponsibilities: [
      'Criar fluxos no Power Automate para todo o ciclo de vida das demandas.',
      'Automatizar envio de e-mails e relatórios.',
      'Construir fluxos auxiliares para atualizar e popular listas.',
      'Padronizar campos, datas e categorias no SharePoint.',
      'Integrar dados entre diferentes listas.',
      'Testar e monitorar fluxos para garantir funcionamento estável.',
      'Documentar processos e regras de negócio.',
    ],
    offers: [],
    myPerformance:
        'Os fluxos entregues funcionaram de forma consistente e sem erros. O envio de e-mails mostrou alta velocidade e precisão. As automações reduziram retrabalho, garantiram padronização dos dados e tornaram o processo mais ágil e confiável para o time jurídico.',
    images: [],
    links: [],
  );
}
