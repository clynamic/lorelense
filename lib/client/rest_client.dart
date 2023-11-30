// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:dio/dio.dart';

import 'users/users_client.dart';
import 'projects/projects_client.dart';
import 'user_projects/user_projects_client.dart';

/// Scrollstack API `v1.0.0`.
/// 
/// API for Scrollstack, the clynamic portfolio site.
class RestClient {
  RestClient(
    Dio dio, {
    String? baseUrl,
  })  : _dio = dio,
        _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  UsersClient? _users;
  ProjectsClient? _projects;
  UserProjectsClient? _userProjects;

  UsersClient get users => _users ??= UsersClient(_dio, baseUrl: _baseUrl);

  ProjectsClient get projects => _projects ??= ProjectsClient(_dio, baseUrl: _baseUrl);

  UserProjectsClient get userProjects => _userProjects ??= UserProjectsClient(_dio, baseUrl: _baseUrl);
}
