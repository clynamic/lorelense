// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'contents_client.g.dart';

@RestApi()
abstract class ContentsClient {
  factory ContentsClient(Dio dio, {String? baseUrl}) = _ContentsClient;

  /// Get a byte stream of a content by ID.
  ///
  /// [id] - The content ID.
  @GET('/cdn/{id}')
  Future<List<String>> content({
    @Path('id') required int id,
  });
}
