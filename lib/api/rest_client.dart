// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';

import 'contents/contents_client.dart';
import 'users/users_client.dart';
import 'projects/projects_client.dart';
import 'userprojects/userprojects_client.dart';

/// scrollstack `v1.0.0`.
///
/// API server for clynamic profile pages.
class RestClient {
  RestClient(
    Dio dio, {
    String? baseUrl,
  })  : _dio = dio,
        _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  ContentsClient? _contents;
  UsersClient? _users;
  ProjectsClient? _projects;
  UserprojectsClient? _userprojects;

  ContentsClient get contents => _contents ??= ContentsClient(_dio, baseUrl: _baseUrl);

  UsersClient get users => _users ??= UsersClient(_dio, baseUrl: _baseUrl);

  ProjectsClient get projects => _projects ??= ProjectsClient(_dio, baseUrl: _baseUrl);

  UserprojectsClient get userprojects => _userprojects ??= UserprojectsClient(_dio, baseUrl: _baseUrl);
}
