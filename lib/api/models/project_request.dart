// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'project_type.dart';

part 'project_request.g.dart';

@JsonSerializable()
class ProjectRequest {
  const ProjectRequest({
    required this.name,
    required this.source,
    required this.type,
  });
  
  factory ProjectRequest.fromJson(Map<String, Object?> json) => _$ProjectRequestFromJson(json);
  
  final String name;
  final String source;
  final ProjectType type;

  Map<String, Object?> toJson() => _$ProjectRequestToJson(this);
}
