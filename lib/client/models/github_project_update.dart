// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:clynamic/client/models/project_update.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'project_type.dart';

part 'github_project_update.freezed.dart';
part 'github_project_update.g.dart';

@Freezed()
class GithubProjectUpdate with _$GithubProjectUpdate implements ProjectUpdate {
  const GithubProjectUpdate._();

  const factory GithubProjectUpdate({
    String? owner,
    String? repo,
  }) = _GithubProjectUpdate;

  @override
  ProjectType get type => ProjectType.github;

  factory GithubProjectUpdate.fromJson(Map<String, Object?> json) =>
      _$GithubProjectUpdateFromJson(json);
}
