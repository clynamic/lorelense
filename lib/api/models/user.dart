// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.email,
    required this.id,
    required this.name,
    this.bio,
    this.discord,
    this.github,
    this.pronouns,
  });
  
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
  
  final String? bio;
  final String? discord;
  final String email;
  final String? github;
  final int id;
  final String name;
  final String? pronouns;

  Map<String, Object?> toJson() => _$UserToJson(this);
}
