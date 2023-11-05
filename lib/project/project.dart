import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

enum ProjectType {
  github,
}

sealed class Project {
  const Project();

  factory Project.fromJson(dynamic json) {
    switch (ProjectType.values.asNameMap()[json['type']]) {
      case ProjectType.github:
        return GithubProject.fromJson(json);
      default:
        throw ArgumentError.value(
          json['type'],
          'json',
          'Invalid project type',
        );
    }
  }

  String get name;
  ProjectType get type;
}

@freezed
class GithubProject with _$GithubProject implements Project {
  const factory GithubProject({
    required int id,
    required String name,
    required String owner,
    required String repo,
    required String? description,
    required int stars,
    required DateTime lastCommit,
    required String? homepage,
    required String? language,
    required String? banner,
  }) = _GithubProject;
  const GithubProject._();

  factory GithubProject.fromJson(Map<String, dynamic> json) =>
      _$GithubProjectFromJson(json);

  @override
  @JsonKey(includeToJson: true)
  ProjectType get type => ProjectType.github;
}
