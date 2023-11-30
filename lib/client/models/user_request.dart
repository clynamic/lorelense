// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_request.freezed.dart';
part 'user_request.g.dart';

@Freezed()
class UserRequest with _$UserRequest {
  const factory UserRequest({
    String? bio,
    String? discord,
    String? email,
    String? github,
    String? name,
    String? pronouns,
  }) = _UserRequest;
  
  factory UserRequest.fromJson(Map<String, Object?> json) => _$UserRequestFromJson(json);
}
