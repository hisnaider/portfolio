import 'package:portfolio/core/values/assets.dart';

enum SkillsEnum {
  cleanArchitecture(
    name: 'Clean Arch',
    image: Assets.cleanArchitecture,
  ),
  flutter(
    name: 'Flutter',
    image: Assets.flutter,
  ),
  webDevelopment(
    name: 'Web Development (Flutter)',
  ),
  dart(name: 'Dart', image: Assets.dart),
  figma(name: 'Figma', image: Assets.figma),
  apiRest(
    name: 'API REST',
  ),
  powerAutomate(
    name: 'Power Automate',
  ),
  sharePoint(
    name: 'SharePoint',
  ),
  leadership(
    name: 'Liderança',
  ),
  proactivity(
    name: 'Proatividade',
  ),
  continuousLearning(
    name: 'Aprendizado contínuo',
  ),
  technicalEmpathy(
    name: 'Empatia técnica',
  );

  const SkillsEnum({required this.name, this.image});
  final String name;
  final String? image;
}
