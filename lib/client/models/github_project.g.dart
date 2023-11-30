// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubProject _$$_GithubProjectFromJson(Map<String, dynamic> json) =>
    _$_GithubProject(
      banner: json['banner'] as String?,
      description: json['description'] as String?,
      homepage: json['homepage'] as String?,
      id: json['id'] as int,
      language: json['language'] as String?,
      lastCommit: json['lastCommit'] == null
          ? null
          : DateTime.parse(json['lastCommit'] as String),
      name: json['name'] as String,
      owner: json['owner'] as String?,
      repo: json['repo'] as String?,
      stars: json['stars'] as int,
    );

Map<String, dynamic> _$$_GithubProjectToJson(_$_GithubProject instance) =>
    <String, dynamic>{
      'banner': instance.banner,
      'description': instance.description,
      'homepage': instance.homepage,
      'id': instance.id,
      'language': instance.language,
      'lastCommit': instance.lastCommit?.toIso8601String(),
      'name': instance.name,
      'owner': instance.owner,
      'repo': instance.repo,
      'stars': instance.stars,
    };
