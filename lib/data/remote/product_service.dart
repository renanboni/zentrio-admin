import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:zentrio_admin/data/models/req/create_category_req.dart';
import 'package:zentrio_admin/data/models/res/categories_response.dart';
import 'package:zentrio_admin/data/models/res/products_response.dart';

part 'product_service.g.dart';

@RestApi()
abstract class ProductService {
  factory ProductService(
    @Named("authenticated") Dio dio, {
    String baseUrl,
  }) = _ProductService;

  @GET("/vendors/products")
  Future<ProductsResponse> getAll();

  @GET("/vendor/categories")
  Future<CategoriesResponse> getCategories();

  @POST("/vendor/categories")
  Future<void> createCategory(@Body() CreateCategoryRequest req);
}
