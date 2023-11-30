// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:clynamic/client/models/github_project.dart';
import 'package:clynamic/client/models/project_type.dart';

abstract class Project {
  int get id;
  String get name;
  ProjectType get type;

  factory Project.fromJson(Map<String, Object?> json) {
    return switch (ProjectType.values.asNameMap()[json['type']!]!) {
      ProjectType.github => GithubProject.fromJson(json),
    };
  }

  Map<String, Object?> toJson();
}
