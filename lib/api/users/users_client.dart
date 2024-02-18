// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/user.dart';
import '../models/user_request.dart';
import '../models/user_update.dart';

part 'users_client.g.dart';

@RestApi()
abstract class UsersClient {
  factory UsersClient(Dio dio, {String? baseUrl}) = _UsersClient;

  /// Get a user by ID.
  ///
  /// [id] - The user ID.
  @GET('/users/{id}')
  Future<User> user({
    @Path('id') required int id,
  });

  /// Update a user.
  ///
  /// [id] - The user ID.
  @PUT('/users/{id}')
  Future<void> updateUser({
    @Path('id') required int id,
    @Body() required UserUpdate body,
  });

  /// Delete a user.
  ///
  /// [id] - The user ID.
  @DELETE('/users/{id}')
  Future<void> deleteUser({
    @Path('id') required int id,
  });

  /// Get a page of users.
  ///
  /// [page] - The page number.
  ///
  /// [size] - The page size.
  ///
  /// [sort] - The sort field.
  ///
  /// [order] - The sort order.
  ///
  /// [project] - Project ID to filter by association.
  @GET('/users')
  Future<List<User>> users({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('sort') required String sort,
    @Query('order') required String order,
    @Query('project') required int project,
  });

  /// Create a user
  @POST('/users')
  Future<int> createUser({
    @Body() required UserRequest body,
  });
}
