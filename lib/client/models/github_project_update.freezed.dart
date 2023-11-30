// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_project_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GithubProjectUpdate _$GithubProjectUpdateFromJson(Map<String, dynamic> json) {
  return _GithubProjectUpdate.fromJson(json);
}

/// @nodoc
mixin _$GithubProjectUpdate {
  String? get owner => throw _privateConstructorUsedError;
  String? get repo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubProjectUpdateCopyWith<GithubProjectUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubProjectUpdateCopyWith<$Res> {
  factory $GithubProjectUpdateCopyWith(
          GithubProjectUpdate value, $Res Function(GithubProjectUpdate) then) =
      _$GithubProjectUpdateCopyWithImpl<$Res, GithubProjectUpdate>;
  @useResult
  $Res call({String? owner, String? repo});
}

/// @nodoc
class _$GithubProjectUpdateCopyWithImpl<$Res, $Val extends GithubProjectUpdate>
    implements $GithubProjectUpdateCopyWith<$Res> {
  _$GithubProjectUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = freezed,
    Object? repo = freezed,
  }) {
    return _then(_value.copyWith(
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      repo: freezed == repo
          ? _value.repo
          : repo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GithubProjectUpdateCopyWith<$Res>
    implements $GithubProjectUpdateCopyWith<$Res> {
  factory _$$_GithubProjectUpdateCopyWith(_$_GithubProjectUpdate value,
          $Res Function(_$_GithubProjectUpdate) then) =
      __$$_GithubProjectUpdateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? owner, String? repo});
}

/// @nodoc
class __$$_GithubProjectUpdateCopyWithImpl<$Res>
    extends _$GithubProjectUpdateCopyWithImpl<$Res, _$_GithubProjectUpdate>
    implements _$$_GithubProjectUpdateCopyWith<$Res> {
  __$$_GithubProjectUpdateCopyWithImpl(_$_GithubProjectUpdate _value,
      $Res Function(_$_GithubProjectUpdate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = freezed,
    Object? repo = freezed,
  }) {
    return _then(_$_GithubProjectUpdate(
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      repo: freezed == repo
          ? _value.repo
          : repo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GithubProjectUpdate extends _GithubProjectUpdate {
  const _$_GithubProjectUpdate({this.owner, this.repo}) : super._();

  factory _$_GithubProjectUpdate.fromJson(Map<String, dynamic> json) =>
      _$$_GithubProjectUpdateFromJson(json);

  @override
  final String? owner;
  @override
  final String? repo;

  @override
  String toString() {
    return 'GithubProjectUpdate(owner: $owner, repo: $repo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GithubProjectUpdate &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.repo, repo) || other.repo == repo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, owner, repo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GithubProjectUpdateCopyWith<_$_GithubProjectUpdate> get copyWith =>
      __$$_GithubProjectUpdateCopyWithImpl<_$_GithubProjectUpdate>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GithubProjectUpdateToJson(
      this,
    );
  }
}

abstract class _GithubProjectUpdate extends GithubProjectUpdate {
  const factory _GithubProjectUpdate(
      {final String? owner, final String? repo}) = _$_GithubProjectUpdate;
  const _GithubProjectUpdate._() : super._();

  factory _GithubProjectUpdate.fromJson(Map<String, dynamic> json) =
      _$_GithubProjectUpdate.fromJson;

  @override
  String? get owner;
  @override
  String? get repo;
  @override
  @JsonKey(ignore: true)
  _$$_GithubProjectUpdateCopyWith<_$_GithubProjectUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}
