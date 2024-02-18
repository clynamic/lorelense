// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';

@JsonSerializable()
class UserRequest {
  const UserRequest({
    required this.email,
    required this.name,
    this.bio,
    this.discord,
    this.github,
    this.pronouns,
  });
  
  factory UserRequest.fromJson(Map<String, Object?> json) => _$UserRequestFromJson(json);
  
  final String? bio;
  final String? discord;
  final String email;
  final String? github;
  final String name;
  final String? pronouns;

  Map<String, Object?> toJson() => _$UserRequestToJson(this);
}
