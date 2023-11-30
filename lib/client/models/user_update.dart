// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_update.freezed.dart';
part 'user_update.g.dart';

@Freezed()
class UserUpdate with _$UserUpdate {
  const factory UserUpdate({
    String? bio,
    String? discord,
    String? email,
    String? github,
    String? name,
    String? pronouns,
  }) = _UserUpdate;
  
  factory UserUpdate.fromJson(Map<String, Object?> json) => _$UserUpdateFromJson(json);
}
