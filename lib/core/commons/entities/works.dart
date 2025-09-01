import 'package:portfolio/core/commons/widgets/competence.dart';

class Work {
  final String name;
  final String image;
  final String role;
  final List<String> competences;
  final String shortDesc;
  final String desc;

  const Work({
    required this.name,
    required this.image,
    required this.role,
    required this.competences,
    required this.shortDesc,
    required this.desc,
  });
}
