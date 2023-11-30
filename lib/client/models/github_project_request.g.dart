// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_project_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GithubProjectRequest _$$_GithubProjectRequestFromJson(
        Map<String, dynamic> json) =>
    _$_GithubProjectRequest(
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      repo: json['repo'] as String?,
    );

Map<String, dynamic> _$$_GithubProjectRequestToJson(
        _$_GithubProjectRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'repo': instance.repo,
    };
