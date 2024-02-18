// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'user_update.g.dart';

@JsonSerializable()
class UserUpdate {
  const UserUpdate({
    this.bio,
    this.discord,
    this.email,
    this.github,
    this.name,
    this.pronouns,
  });
  
  factory UserUpdate.fromJson(Map<String, Object?> json) => _$UserUpdateFromJson(json);
  
  final String? bio;
  final String? discord;
  final String? email;
  final String? github;
  final String? name;
  final String? pronouns;

  Map<String, Object?> toJson() => _$UserUpdateToJson(this);
}
