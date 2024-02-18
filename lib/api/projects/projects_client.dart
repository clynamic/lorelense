// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/project.dart';
import '../models/project_request.dart';
import '../models/project_update.dart';

part 'projects_client.g.dart';

@RestApi()
abstract class ProjectsClient {
  factory ProjectsClient(Dio dio, {String? baseUrl}) = _ProjectsClient;

  /// Get a project by ID.
  ///
  /// [id] - The project ID.
  @GET('/projects/{id}')
  Future<Project> project({
    @Path('id') required int id,
  });

  /// Update a project by ID.
  ///
  /// [id] - The project ID.
  @PUT('/projects/{id}')
  Future<void> updateProject({
    @Path('id') required int id,
    @Body() required ProjectUpdate body,
  });

  /// Delete a project by ID.
  ///
  /// [id] - The project ID.
  @DELETE('/projects/{id}')
  Future<void> deleteProject({
    @Path('id') required int id,
  });

  /// Get a page of projects.
  ///
  /// [page] - The page number.
  ///
  /// [size] - The page size.
  ///
  /// [sort] - The sort field.
  ///
  /// [order] - The sort order.
  ///
  /// [user] - User ID to filter by association.
  @GET('/projects')
  Future<List<Project>> projects({
    @Query('page') int? page,
    @Query('size') int? size,
    @Query('sort') String? sort,
    @Query('order') String? order,
    @Query('user') int? user,
  });

  /// Create a project
  @POST('/projects')
  Future<int> createProject({
    @Body() required ProjectRequest body,
  });
}
