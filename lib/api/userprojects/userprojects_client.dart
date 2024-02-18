// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/user_project_relation.dart';

part 'userprojects_client.g.dart';

@RestApi()
abstract class UserprojectsClient {
  factory UserprojectsClient(Dio dio, {String? baseUrl}) = _UserprojectsClient;

  /// Check if a user is associated with a project.
  ///
  /// [userId] - The user ID.
  ///
  /// [projectId] - The project ID.
  @GET('/user-projects/{userId}/{projectId}')
  Future<void> userProject({
    @Path('userId') required int userId,
    @Path('projectId') required int projectId,
  });

  /// Dissociate a user from a project
  @DELETE('/user-projects/{userId}/{projectId}')
  Future<void> dissociateUserProject();

  /// Associate a user with a project
  @POST('/user-projects')
  Future<void> associateUserProject({
    @Body() required UserProjectRelation body,
  });
}
