// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../models/user_project_relation.dart';

part 'user_projects_client.g.dart';

@RestApi()
abstract class UserProjectsClient {
  factory UserProjectsClient(Dio dio, {String? baseUrl}) = _UserProjectsClient;

  /// Associate a user with a project.
  /// 
  /// [body] - User and project IDs.
  @POST('/user-projects')
  Future<void> postUserProjects({
    @Body() required UserProjectRelation body,
  });

  /// Check if a user is associated with a project.
  /// 
  /// [userId] - The user ID.
  /// [projectId] - The project ID.
  @GET('/user-projects/{userId}/{projectId}')
  Future<void> getUserProjectsUserIdProjectId({
    @Path('userId') int? userId,
    @Path('projectId') int? projectId,
  });

  /// Dissociate a user from a project
  @DELETE('/user-projects/{userId}/{projectId}')
  Future<void> deleteUserProjectsUserIdProjectId();
}
