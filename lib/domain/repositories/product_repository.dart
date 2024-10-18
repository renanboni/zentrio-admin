import 'package:zentrio_admin/data/models/api_product.dart';
import 'package:zentrio_admin/data/models/req/create_product_tag_req.dart';
import 'package:zentrio_admin/data/models/req/create_product_type_req.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';

import '../../data/models/create_product_option_req.dart';
import '../../data/models/create_product_request.dart';
import '../models/product.dart';
import '../models/product_tag.dart';
import '../models/product_type.dart';

abstract class ProductRepository {
  Future<List<Product>> getAll();

  Future<void> createProduct(CreateProductRequest product);

  Future<Product> getProductById(String id, {List<String> expand = const []});

  Future<void> updateProduct(String productId, Map<String, dynamic> fields);

  Future<void> createProductOption(
    String productId,
    CreateProductOptionRequest request,
  );

  Future<void> deleteProductOption(String productId, String optionId);

  Future<List<ProductOption>> getProductOptions(String productId);

  Future<void> createProductType(CreateProductTypeReq req);

  Future<List<ProductType>> getProductTypes();

  Future<ProductType> getProductTypeById(String id);

  Future<void> createProductTag(CreateProductTagReq req);

  Future<List<ProductTag>> getProductTags();

  Future<ProductTag> getProductTagById(String id);
}
