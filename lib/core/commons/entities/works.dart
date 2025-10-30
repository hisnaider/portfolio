import 'package:flutter/material.dart';

class Work {
  final String companyName;
  final String image;
  final String role;
  final List<String> competences;
  final Widget page;

  const Work({
    this.companyName = '',
    required this.image,
    required this.role,
    required this.competences,
    required this.page,
  });
}
