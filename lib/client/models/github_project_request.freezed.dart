// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'github_project_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GithubProjectRequest _$GithubProjectRequestFromJson(Map<String, dynamic> json) {
  return _GithubProjectRequest.fromJson(json);
}

/// @nodoc
mixin _$GithubProjectRequest {
  String? get name => throw _privateConstructorUsedError;
  String? get owner => throw _privateConstructorUsedError;
  String? get repo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubProjectRequestCopyWith<GithubProjectRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubProjectRequestCopyWith<$Res> {
  factory $GithubProjectRequestCopyWith(GithubProjectRequest value,
          $Res Function(GithubProjectRequest) then) =
      _$GithubProjectRequestCopyWithImpl<$Res, GithubProjectRequest>;
  @useResult
  $Res call({String? name, String? owner, String? repo});
}

/// @nodoc
class _$GithubProjectRequestCopyWithImpl<$Res,
        $Val extends GithubProjectRequest>
    implements $GithubProjectRequestCopyWith<$Res> {
  _$GithubProjectRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? owner = freezed,
    Object? repo = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_GithubProjectRequestCopyWith<$Res>
    implements $GithubProjectRequestCopyWith<$Res> {
  factory _$$_GithubProjectRequestCopyWith(_$_GithubProjectRequest value,
          $Res Function(_$_GithubProjectRequest) then) =
      __$$_GithubProjectRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? owner, String? repo});
}

/// @nodoc
class __$$_GithubProjectRequestCopyWithImpl<$Res>
    extends _$GithubProjectRequestCopyWithImpl<$Res, _$_GithubProjectRequest>
    implements _$$_GithubProjectRequestCopyWith<$Res> {
  __$$_GithubProjectRequestCopyWithImpl(_$_GithubProjectRequest _value,
      $Res Function(_$_GithubProjectRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? owner = freezed,
    Object? repo = freezed,
  }) {
    return _then(_$_GithubProjectRequest(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$_GithubProjectRequest extends _GithubProjectRequest {
  const _$_GithubProjectRequest({this.name, this.owner, this.repo}) : super._();

  factory _$_GithubProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$$_GithubProjectRequestFromJson(json);

  @override
  final String? name;
  @override
  final String? owner;
  @override
  final String? repo;

  @override
  String toString() {
    return 'GithubProjectRequest(name: $name, owner: $owner, repo: $repo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GithubProjectRequest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.repo, repo) || other.repo == repo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, owner, repo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GithubProjectRequestCopyWith<_$_GithubProjectRequest> get copyWith =>
      __$$_GithubProjectRequestCopyWithImpl<_$_GithubProjectRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GithubProjectRequestToJson(
      this,
    );
  }
}

abstract class _GithubProjectRequest extends GithubProjectRequest {
  const factory _GithubProjectRequest(
      {final String? name,
      final String? owner,
      final String? repo}) = _$_GithubProjectRequest;
  const _GithubProjectRequest._() : super._();

  factory _GithubProjectRequest.fromJson(Map<String, dynamic> json) =
      _$_GithubProjectRequest.fromJson;

  @override
  String? get name;
  @override
  String? get owner;
  @override
  String? get repo;
  @override
  @JsonKey(ignore: true)
  _$$_GithubProjectRequestCopyWith<_$_GithubProjectRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
