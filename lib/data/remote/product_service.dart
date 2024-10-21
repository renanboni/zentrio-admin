import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:zentrio_admin/data/models/api_product.dart';
import 'package:zentrio_admin/data/models/api_product_option.dart';
import 'package:zentrio_admin/data/models/api_product_type.dart';
import 'package:zentrio_admin/data/models/create_product_option_req.dart';
import 'package:zentrio_admin/data/models/req/create_product_tag_req.dart';
import 'package:zentrio_admin/data/models/req/create_product_type_req.dart';
import 'package:zentrio_admin/data/models/res/products_response.dart';

import '../models/api_product_tag.dart';
import '../models/create_product_request.dart';
import '../models/res/product_response.dart';
import '../models/res/product_tag_response.dart';
import '../models/res/product_type_response.dart';

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

  @POST("/vendor/products/{id}")
  Future<ApiProduct> updateProduct(
    @Path("id") String id,
    @Body() Map<String, dynamic> fields,
  );

  @POST("/vendor/products/{id}/options")
  Future<ApiProduct> createProductOption(
    @Path("id") String id,
    @Body() CreateProductOptionRequest product,
  );

  @DELETE("/vendor/products/{id}/options/{option_id}")
  Future<void> deleteProductOption(
    @Path("id") String id,
    @Path("option_id") String optionId,
  );

  @GET("/vendor/products/{id}/options")
  Future<List<ApiProductOption>> getProductOptions(
    @Path("id") String id,
  );

  @POST("/vendor/product-types")
  Future<void> createProductType(@Body() CreateProductTypeReq req);

  @GET("/vendor/product-types")
  Future<ProductTypeResponse> getProductTypes(
    @Query("limit") int limit,
    @Query("offset") int offset,
  );

  @GET("/vendor/product-types/{id}")
  Future<ApiProductType> getProductTypeById(@Path("id") String id);

  @POST("/vendor/product-tags")
  Future<void> createProductTag(@Body() CreateProductTagReq req);

  @GET("/vendor/product-tags")
  Future<ProductTagResponse> getProductTags(
    @Query("limit") int limit,
    @Query("offset") int offset,
  );

  @GET("/vendor/product-tags/{id}")
  Future<ApiProductTag> getProductTagById(@Path("id") String id);

  @DELETE("/vendor/product-tags/{id}")
  Future<void> deleteProductTag(@Path("id") String id);

  @DELETE("/vendor/product-types/{id}")
  Future<void> deleteProductType(@Path("id") String id);
}
