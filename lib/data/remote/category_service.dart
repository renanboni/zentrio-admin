import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../models/req/create_category_req.dart';
import '../models/req/update_category_req.dart';
import '../models/res/categories_response.dart';
import '../models/res/category_response.dart';

part 'category_service.g.dart';

@RestApi()
abstract class CategoryService {
  factory CategoryService(
    @Named("authenticated") Dio dio, {
    String baseUrl,
  }) = _CategoryService;

  @GET("/vendor/categories")
  Future<CategoriesResponse> getCategories(
    @Query("limit") int limit,
    @Query("offset") int offset,
  );

  @POST("/vendor/categories")
  Future<void> createCategory(@Body() CreateCategoryRequest req);

  @DELETE("/vendor/categories/{id}")
  Future<void> deleteCategory(@Path("id") String id);

  @GET("/vendor/categories/{id}")
  Future<CategoryResponse> getCategoryById(@Path("id") String id);

  @POST("/vendor/categories/{id}")
  Future<void> updateCategory(
    @Path("id") String id,
    @Body() UpdateCategoryRequest req,
  );
}
