// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectUpdate _$ProjectUpdateFromJson(Map<String, dynamic> json) =>
    ProjectUpdate(
      name: json['name'] as String?,
      source: json['source'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ProjectUpdateToJson(ProjectUpdate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'source': instance.source,
      'type': instance.type,
    };
