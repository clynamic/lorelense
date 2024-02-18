// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable()
class Project {
  const Project({
    required this.id,
    required this.name,
    required this.source,
    this.banner,
    this.description,
    this.language,
    this.stars,
    this.updated,
    this.website,
  });
  
  factory Project.fromJson(Map<String, Object?> json) => _$ProjectFromJson(json);
  
  final String? banner;
  final String? description;
  final int id;
  final String? language;
  final String name;
  final String source;
  final int? stars;
  final DateTime? updated;
  final String? website;

  Map<String, Object?> toJson() => _$ProjectToJson(this);
}
