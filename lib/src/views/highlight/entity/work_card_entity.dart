// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:portfolio/src/features/orbiting_system/entities/planet_entity.dart';

class WorkCardEntity {
  final String companyName;
  final String text;
  final String role;
  final String? image;
  final PlanetEntity planet;
  WorkCardEntity({
    required this.companyName,
    required this.text,
    required this.role,
    this.image,
    required this.planet,
  });
}
