import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:zentrio_admin/data/models/api_product.dart';
import 'package:zentrio_admin/data/models/req/create_category_req.dart';
import 'package:zentrio_admin/data/models/res/categories_response.dart';
import 'package:zentrio_admin/data/models/res/products_response.dart';

import '../models/create_product_request.dart';
import '../models/res/category_response.dart';
import '../models/res/product_response.dart';

part 'product_service.g.dart';

@RestApi()
abstract class ProductService {
  factory ProductService(
    @Named("authenticated") Dio dio, {
    String baseUrl,
  }) = _ProductService;

  @GET("/vendor/products")
  Future<ProductsResponse> getAll();

  @POST("/vendor/products")
  Future<ApiProduct> createProduct(@Body() CreateProductRequest product);

  @GET("/vendor/products/{id}")
  Future<ProductResponse> getProductById(
    @Path("id") String id,
    @Query("expand") String expand,
  );

  @GET("/vendor/categories")
  Future<CategoriesResponse> getCategories();

  @POST("/vendor/categories")
  Future<void> createCategory(@Body() CreateCategoryRequest req);

  @DELETE("/vendor/categories/{id}")
  Future<void> deleteCategory(@Path("id") String id);

  @GET("/vendor/categories/{id}")
  Future<CategoryResponse> getCategoryById(@Path("id") String id);

  @POST("/vendor/categories/{id}")
  Future<void> updateCategory(
    @Path("id") String id,
    @Body() Map<String, dynamic> fields,
  );
}
