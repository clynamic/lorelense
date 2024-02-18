// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_project_relation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProjectRelation _$UserProjectRelationFromJson(Map<String, dynamic> json) =>
    UserProjectRelation(
      projectId: json['projectId'] as int,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$UserProjectRelationToJson(
        UserProjectRelation instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'userId': instance.userId,
    };
