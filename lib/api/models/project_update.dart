// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'project_type.dart';

part 'project_update.g.dart';

@JsonSerializable()
class ProjectUpdate {
  const ProjectUpdate({
    this.name,
    this.source,
    this.type,
  });
  
  factory ProjectUpdate.fromJson(Map<String, Object?> json) => _$ProjectUpdateFromJson(json);
  
  final String? name;
  final String? source;
  final ProjectType? type;

  Map<String, Object?> toJson() => _$ProjectUpdateToJson(this);
}
