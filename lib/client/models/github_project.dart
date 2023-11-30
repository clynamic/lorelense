// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:clynamic/client/models/project.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'project_type.dart';

part 'github_project.freezed.dart';
part 'github_project.g.dart';

@Freezed()
class GithubProject with _$GithubProject implements Project {
  const GithubProject._();

  const factory GithubProject({
    String? banner,
    String? description,
    String? homepage,
    required int id,
    String? language,
    DateTime? lastCommit,
    required String name,
    String? owner,
    String? repo,
    required int stars,
  }) = _GithubProject;

  @override
  ProjectType get type => ProjectType.github;

  factory GithubProject.fromJson(Map<String, Object?> json) =>
      _$GithubProjectFromJson(json);
}
