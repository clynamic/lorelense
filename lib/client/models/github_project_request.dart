// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:clynamic/client/models/project_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'project_type.dart';

part 'github_project_request.freezed.dart';
part 'github_project_request.g.dart';

@Freezed()
class GithubProjectRequest
    with _$GithubProjectRequest
    implements ProjectRequest {
  const GithubProjectRequest._();

  const factory GithubProjectRequest({
    String? name,
    String? owner,
    String? repo,
  }) = _GithubProjectRequest;

  @override
  ProjectType get type => ProjectType.github;

  factory GithubProjectRequest.fromJson(Map<String, Object?> json) =>
      _$GithubProjectRequestFromJson(json);
}
