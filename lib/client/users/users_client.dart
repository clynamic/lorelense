// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../models/user.dart';
import '../models/user_request.dart';
import '../models/user_update.dart';

part 'users_client.g.dart';

@RestApi()
abstract class UsersClient {
  factory UsersClient(Dio dio, {String? baseUrl}) = _UsersClient;

  /// Get a page of users.
  /// 
  /// [page] - The page number.
  /// [size] - The page size.
  /// [project] - Project ID to filter by association.
  @GET('/users')
  Future<List<User>> getUsers({
    @Query('page') int? page,
    @Query('size') int? size,
    @Query('project') int? project,
  });

  /// Create a user.
  /// 
  /// [body] - New user properties.
  @POST('/users')
  Future<int> postUsers({
    @Body() required UserRequest body,
  });

  /// Get a user by ID.
  /// 
  /// [id] - The user ID.
  @GET('/users/{id}')
  Future<User> getUsersId({
    @Path('id') int? id,
  });

  /// Update a user.
  /// 
  /// [id] - The user ID.
  /// [body] - Changed user properties.
  @PUT('/users/{id}')
  Future<void> putUsersId({
    @Body() required UserUpdate body,
    @Path('id') int? id,
  });

  /// Delete a user.
  /// 
  /// [id] - The user ID.
  @DELETE('/users/{id}')
  Future<void> deleteUsersId({
    @Path('id') int? id,
  });
}
