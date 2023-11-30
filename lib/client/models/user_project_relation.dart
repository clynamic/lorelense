// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_project_relation.freezed.dart';
part 'user_project_relation.g.dart';

@Freezed()
class UserProjectRelation with _$UserProjectRelation {
  const factory UserProjectRelation({
    int? projectId,
    int? userId,
  }) = _UserProjectRelation;
  
  factory UserProjectRelation.fromJson(Map<String, Object?> json) => _$UserProjectRelationFromJson(json);
}
