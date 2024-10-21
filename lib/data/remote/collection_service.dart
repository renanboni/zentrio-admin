import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:zentrio_admin/data/models/api_collection.dart';
import 'package:zentrio_admin/data/models/res/collections_response.dart';

import '../models/create_collection_request.dart';

part 'collection_service.g.dart';

@RestApi()
abstract class CollectionService {
  factory CollectionService(
    @Named("authenticated") Dio dio, {
    String baseUrl,
  }) = _CollectionService;

  @GET("/vendor/collections")
  Future<CollectionsResponse> getAll(
    @Query("limit") int limit,
    @Query("offset") int offset,
  );

  @GET("/vendor/collections/{id}")
  Future<ApiCollection> getCollectionById(
    @Path("id") String id,
    @Query("expand") String expand,
  );

  @POST("/vendor/collections")
  Future<void> createCollection(@Body() CreateCollectionRequest collection);

  @DELETE("/vendor/collections/{id}")
  Future<void> deleteCollection(@Path("id") String id);
}
