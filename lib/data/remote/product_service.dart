import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:zentrio_admin/data/models/res/categories_response.dart';
import 'package:zentrio_admin/data/models/res/products_response.dart';

part 'product_service.g.dart';

@RestApi()
abstract class ProductService {
  factory ProductService(@Named("authenticated") Dio dio, {String baseUrl}) =
      _ProductService;

  @GET("/vendors/products")
  Future<ProductsResponse> getAll();

  @GET("/vendors/categories")
  Future<CategoriesResponse> getCategories();
}
