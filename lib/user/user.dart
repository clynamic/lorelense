import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    required String? pronouns,
    required String? bio,
    required String? discord,
    required String? github,
  }) = _User;

  factory User.fromJson(dynamic json) => _$UserFromJson(json);
}
