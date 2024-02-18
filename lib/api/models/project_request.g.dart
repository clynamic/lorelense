// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectRequest _$ProjectRequestFromJson(Map<String, dynamic> json) =>
    ProjectRequest(
      name: json['name'] as String,
      source: json['source'] as String,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ProjectRequestToJson(ProjectRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'source': instance.source,
      'type': instance.type,
    };
