// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserUpdate _$UserUpdateFromJson(Map<String, dynamic> json) {
  return _UserUpdate.fromJson(json);
}

/// @nodoc
mixin _$UserUpdate {
  String? get bio => throw _privateConstructorUsedError;
  String? get discord => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get github => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get pronouns => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserUpdateCopyWith<UserUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserUpdateCopyWith<$Res> {
  factory $UserUpdateCopyWith(
          UserUpdate value, $Res Function(UserUpdate) then) =
      _$UserUpdateCopyWithImpl<$Res, UserUpdate>;
  @useResult
  $Res call(
      {String? bio,
      String? discord,
      String? email,
      String? github,
      String? name,
      String? pronouns});
}

/// @nodoc
class _$UserUpdateCopyWithImpl<$Res, $Val extends UserUpdate>
    implements $UserUpdateCopyWith<$Res> {
  _$UserUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bio = freezed,
    Object? discord = freezed,
    Object? email = freezed,
    Object? github = freezed,
    Object? name = freezed,
    Object? pronouns = freezed,
  }) {
    return _then(_value.copyWith(
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      discord: freezed == discord
          ? _value.discord
          : discord // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      github: freezed == github
          ? _value.github
          : github // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pronouns: freezed == pronouns
          ? _value.pronouns
          : pronouns // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserUpdateCopyWith<$Res>
    implements $UserUpdateCopyWith<$Res> {
  factory _$$_UserUpdateCopyWith(
          _$_UserUpdate value, $Res Function(_$_UserUpdate) then) =
      __$$_UserUpdateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? bio,
      String? discord,
      String? email,
      String? github,
      String? name,
      String? pronouns});
}

/// @nodoc
class __$$_UserUpdateCopyWithImpl<$Res>
    extends _$UserUpdateCopyWithImpl<$Res, _$_UserUpdate>
    implements _$$_UserUpdateCopyWith<$Res> {
  __$$_UserUpdateCopyWithImpl(
      _$_UserUpdate _value, $Res Function(_$_UserUpdate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bio = freezed,
    Object? discord = freezed,
    Object? email = freezed,
    Object? github = freezed,
    Object? name = freezed,
    Object? pronouns = freezed,
  }) {
    return _then(_$_UserUpdate(
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      discord: freezed == discord
          ? _value.discord
          : discord // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      github: freezed == github
          ? _value.github
          : github // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pronouns: freezed == pronouns
          ? _value.pronouns
          : pronouns // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserUpdate implements _UserUpdate {
  const _$_UserUpdate(
      {this.bio,
      this.discord,
      this.email,
      this.github,
      this.name,
      this.pronouns});

  factory _$_UserUpdate.fromJson(Map<String, dynamic> json) =>
      _$$_UserUpdateFromJson(json);

  @override
  final String? bio;
  @override
  final String? discord;
  @override
  final String? email;
  @override
  final String? github;
  @override
  final String? name;
  @override
  final String? pronouns;

  @override
  String toString() {
    return 'UserUpdate(bio: $bio, discord: $discord, email: $email, github: $github, name: $name, pronouns: $pronouns)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserUpdate &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.discord, discord) || other.discord == discord) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.github, github) || other.github == github) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pronouns, pronouns) ||
                other.pronouns == pronouns));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, bio, discord, email, github, name, pronouns);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserUpdateCopyWith<_$_UserUpdate> get copyWith =>
      __$$_UserUpdateCopyWithImpl<_$_UserUpdate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserUpdateToJson(
      this,
    );
  }
}

abstract class _UserUpdate implements UserUpdate {
  const factory _UserUpdate(
      {final String? bio,
      final String? discord,
      final String? email,
      final String? github,
      final String? name,
      final String? pronouns}) = _$_UserUpdate;

  factory _UserUpdate.fromJson(Map<String, dynamic> json) =
      _$_UserUpdate.fromJson;

  @override
  String? get bio;
  @override
  String? get discord;
  @override
  String? get email;
  @override
  String? get github;
  @override
  String? get name;
  @override
  String? get pronouns;
  @override
  @JsonKey(ignore: true)
  _$$_UserUpdateCopyWith<_$_UserUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}