// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class AboutInfo {
  final String name;
  final String? photo;
  final String? banner;
  final String role;
  final Color? color;
  final String desc;
  const AboutInfo({
    required this.name,
    this.photo,
    this.banner,
    required this.role,
    this.color,
    required this.desc,
  });
}

class AboutWorkInfo extends AboutInfo {
  final String projectName;
  final List<String> competences;
  final List<String> mainResponsibilities;
  final List<String> offers;
  final String myPerformance;
  final List<String> images;
  final List<LinkText> links;
  const AboutWorkInfo({
    required super.name,
    super.photo,
    required this.projectName,
    super.banner,
    required super.role,
    super.color,
    required this.competences,
    required super.desc,
    required this.mainResponsibilities,
    required this.offers,
    required this.myPerformance,
    required this.images,
    required this.links,
  });
}

class AboutMeInfo extends AboutInfo {
  final List<String> hobbies;
  final String personalPurpose;
  final List<String> myValues;
  final String whyASolarSystem;
  const AboutMeInfo({
    required super.name,
    super.photo,
    super.banner,
    required super.role,
    super.color,
    required super.desc,
    required this.hobbies,
    required this.personalPurpose,
    required this.myValues,
    required this.whyASolarSystem,
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
