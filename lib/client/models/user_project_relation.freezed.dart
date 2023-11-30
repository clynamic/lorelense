// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_project_relation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProjectRelation _$UserProjectRelationFromJson(Map<String, dynamic> json) {
  return _UserProjectRelation.fromJson(json);
}

/// @nodoc
mixin _$UserProjectRelation {
  int? get projectId => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProjectRelationCopyWith<UserProjectRelation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProjectRelationCopyWith<$Res> {
  factory $UserProjectRelationCopyWith(
          UserProjectRelation value, $Res Function(UserProjectRelation) then) =
      _$UserProjectRelationCopyWithImpl<$Res, UserProjectRelation>;
  @useResult
  $Res call({int? projectId, int? userId});
}

/// @nodoc
class _$UserProjectRelationCopyWithImpl<$Res, $Val extends UserProjectRelation>
    implements $UserProjectRelationCopyWith<$Res> {
  _$UserProjectRelationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserProjectRelationCopyWith<$Res>
    implements $UserProjectRelationCopyWith<$Res> {
  factory _$$_UserProjectRelationCopyWith(_$_UserProjectRelation value,
          $Res Function(_$_UserProjectRelation) then) =
      __$$_UserProjectRelationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? projectId, int? userId});
}

/// @nodoc
class __$$_UserProjectRelationCopyWithImpl<$Res>
    extends _$UserProjectRelationCopyWithImpl<$Res, _$_UserProjectRelation>
    implements _$$_UserProjectRelationCopyWith<$Res> {
  __$$_UserProjectRelationCopyWithImpl(_$_UserProjectRelation _value,
      $Res Function(_$_UserProjectRelation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_UserProjectRelation(
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProjectRelation implements _UserProjectRelation {
  const _$_UserProjectRelation({this.projectId, this.userId});

  factory _$_UserProjectRelation.fromJson(Map<String, dynamic> json) =>
      _$$_UserProjectRelationFromJson(json);

  @override
  final int? projectId;
  @override
  final int? userId;

  @override
  String toString() {
    return 'UserProjectRelation(projectId: $projectId, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProjectRelation &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, projectId, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProjectRelationCopyWith<_$_UserProjectRelation> get copyWith =>
      __$$_UserProjectRelationCopyWithImpl<_$_UserProjectRelation>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProjectRelationToJson(
      this,
    );
  }
}

abstract class _UserProjectRelation implements UserProjectRelation {
  const factory _UserProjectRelation(
      {final int? projectId, final int? userId}) = _$_UserProjectRelation;

  factory _UserProjectRelation.fromJson(Map<String, dynamic> json) =
      _$_UserProjectRelation.fromJson;

  @override
  int? get projectId;
  @override
  int? get userId;
  @override
  @JsonKey(ignore: true)
  _$$_UserProjectRelationCopyWith<_$_UserProjectRelation> get copyWith =>
      throw _privateConstructorUsedError;
}
