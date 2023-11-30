// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../models/project.dart';
import '../models/project_request.dart';
import '../models/project_update.dart';

part 'projects_client.g.dart';

@RestApi()
abstract class ProjectsClient {
  factory ProjectsClient(Dio dio, {String? baseUrl}) = _ProjectsClient;

  /// Get a page of projects.
  ///
  /// [page] - The page number.
  /// [size] - The page size.
  /// [user] - User ID to filter by association.
  @GET('/projects')
  Future<List<Project>> getProjects({
    @Query('page') int? page,
    @Query('size') int? size,
    @Query('user') int? user,
  });

  /// Create a project.
  ///
  /// [body] - New project properties.
  @POST('/projects')
  Future<int> postProjects({
    @Body() required ProjectRequest body,
  });

  /// Get a project by ID.
  ///
  /// [id] - The project ID.
  @GET('/projects/{id}')
  Future<Project> getProjectsId({
    @Path('id') int? id,
  });

  /// Update a project by ID.
  ///
  /// [id] - The project ID.
  /// [body] - New project properties.
  @PUT('/projects/{id}')
  Future<void> putProjectsId({
    @Body() required ProjectUpdate body,
    @Path('id') int? id,
  });

  /// Delete a project by ID.
  ///
  /// [id] - The project ID.
  @DELETE('/projects/{id}')
  Future<void> deleteProjectsId({
    @Path('id') int? id,
  });
}
