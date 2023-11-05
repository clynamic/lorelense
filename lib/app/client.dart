import 'dart:io';

import 'package:clynamic/project/project.dart';
import 'package:clynamic/user/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

typedef ClientException = DioException;

/// App-wide http client for all requests.
class Client {
  Client() {
    _dio = Dio(
      BaseOptions(
        // baseUrl: 'https://clynamic.net',
        baseUrl: 'http://localhost:8080',
        headers: {
          HttpHeaders.userAgentHeader: 'clynamic-client/0.0.1 (clragon)',
        },
      ),
    );
  }

  late final Dio _dio;

  Future<List<User>> users({
    int? page,
    int? limit,
    int? project,
  }) async {
    final response = await _dio.get('/users', queryParameters: {
      if (page != null) 'page': page,
      if (limit != null) 'limit': limit,
      if (project != null) 'project': project,
    });
    return List<User>.from(response.data!.map((e) => User.fromJson(e)));
  }

  Future<User> user(int id) async {
    final response = await _dio.get('/users/$id');
    return User.fromJson(response.data);
  }

  Future<List<Project>> projects({
    int? page,
    int? limit,
    int? user,
  }) async {
    final response = await _dio.get(
      '/projects',
      queryParameters: {
        if (page != null) 'page': page,
        if (limit != null) 'limit': limit,
        if (user != null) 'user': user,
      },
    );
    return List<Project>.from(response.data!.map((e) => Project.fromJson(e)));
  }

  Future<Project> project(int id) async {
    final response = await _dio.get('/projects/$id');
    return Project.fromJson(response.data);
  }
}

/// Provides a [Client] to a subtree.
class ClientProvider extends StatefulWidget {
  const ClientProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  /// Returns the [Client] from the nearest [ClientProvider] ancestor.
  static Client of(BuildContext context) => maybeOf(context)!;

  /// Returns the [Client] from the nearest [ClientProvider] ancestor, or null
  static Client? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<_ClientProviderState>()?._client;

  @override
  State<ClientProvider> createState() => _ClientProviderState();
}

class _ClientProviderState extends State<ClientProvider> {
  final Client _client = Client();

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
