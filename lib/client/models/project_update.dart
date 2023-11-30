// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:clynamic/client/models/github_project_update.dart';
import 'package:clynamic/client/models/project_type.dart';

abstract class ProjectUpdate {
  ProjectType get type;

  factory ProjectUpdate.fromJson(Map<String, Object?> json) {
    return switch (ProjectType.values.asNameMap()[json['type']!]!) {
      ProjectType.github => GithubProjectUpdate.fromJson(json),
    };
  }

  Map<String, Object?> toJson();
}
