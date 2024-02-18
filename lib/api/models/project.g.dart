// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: json['id'] as int,
      name: json['name'] as String,
      source: json['source'] as String,
      banner: json['banner'] as String?,
      description: json['description'] as String?,
      language: json['language'] as String?,
      stars: json['stars'] as int?,
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      website: json['website'] as String?,
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'banner': instance.banner,
      'description': instance.description,
      'id': instance.id,
      'language': instance.language,
      'name': instance.name,
      'source': instance.source,
      'stars': instance.stars,
      'updated': instance.updated?.toIso8601String(),
      'website': instance.website,
    };
