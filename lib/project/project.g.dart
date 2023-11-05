// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubProject _$$_GithubProjectFromJson(Map<String, dynamic> json) =>
    _$_GithubProject(
      id: json['id'] as int,
      name: json['name'] as String,
      owner: json['owner'] as String,
      repo: json['repo'] as String,
      description: json['description'] as String?,
      stars: json['stars'] as int,
      lastCommit: DateTime.parse(json['lastCommit'] as String),
      homepage: json['homepage'] as String?,
      language: json['language'] as String?,
      banner: json['banner'] as String?,
    );

Map<String, dynamic> _$$_GithubProjectToJson(_$_GithubProject instance) =>
    <String, dynamic>{
      'type': _$ProjectTypeEnumMap[instance.type]!,
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'repo': instance.repo,
      'description': instance.description,
      'stars': instance.stars,
      'lastCommit': instance.lastCommit.toIso8601String(),
      'homepage': instance.homepage,
      'language': instance.language,
      'banner': instance.banner,
    };

const _$ProjectTypeEnumMap = {
  ProjectType.github: 'github',
};
