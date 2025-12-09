// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AboutInfo {
  final String companyName;
  final String companyImage;
  final String projectName;
  final String role;
  final Color color;
  final List<String> competences;
  final String desc;
  final List<String> mainResponsibilities;
  final List<String> offers;
  final String myPerformance;
  final List<String> images;
  final List<LinkText> links;
  const AboutInfo({
    required this.companyName,
    required this.companyImage,
    required this.projectName,
    required this.role,
    required this.color,
    required this.competences,
    required this.desc,
    required this.mainResponsibilities,
    required this.offers,
    required this.myPerformance,
    required this.images,
    required this.links,
  });
}

class LinkText {
  final String label;
  final String link;
  final String text;
  const LinkText({
    required this.label,
    required this.link,
    String? text,
  }) : text = text ?? link;
}
