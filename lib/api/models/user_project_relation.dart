// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'user_project_relation.g.dart';

@JsonSerializable()
class UserProjectRelation {
  const UserProjectRelation({
    required this.projectId,
    required this.userId,
  });
  
  factory UserProjectRelation.fromJson(Map<String, Object?> json) => _$UserProjectRelationFromJson(json);
  
  final int projectId;
  final int userId;

  Map<String, Object?> toJson() => _$UserProjectRelationToJson(this);
}
