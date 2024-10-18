import 'package:zentrio_admin/data/mappers/product_mapper.dart';
import 'package:zentrio_admin/data/models/api_file.dart';
import 'package:zentrio_admin/data/models/api_product.dart';
import 'package:zentrio_admin/data/models/create_product_option_req.dart';
import 'package:zentrio_admin/data/models/req/create_product_tag_req.dart';
import 'package:zentrio_admin/data/models/req/create_product_type_req.dart';
import 'package:zentrio_admin/data/remote/product_service.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/domain/models/product_tag.dart';
import 'package:zentrio_admin/domain/models/product_type.dart';

import '../domain/models/medusa_file.dart';
import '../domain/models/product_option.dart';
import '../domain/repositories/product_repository.dart';
import 'models/api_product_option.dart';
import 'models/create_product_request.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService _service;

  ProductRepositoryImpl(this._service);

  @override
  Future<List<Product>> getAll() {
    return _service
        .getAll()
        .then((value) => value.products.map((e) => e.toProduct()).toList());
  }

  @override
  Future<void> createProduct(CreateProductRequest product) {
    return _service.createProduct(product);
  }

  @override
  Future<Product> getProductById(String id, {List<String> expand = const []}) {
    return _service
        .getProductById(id, expand.join(','))
        .then((value) => value.product.toProduct());
  }

  @override
  Future<void> updateProduct(String productId, Map<String, dynamic> fields) {
    return _service.updateProduct(productId, fields);
  }

  @override
  Future<void> createProductOption(
    String productId,
    CreateProductOptionRequest request,
  ) {
    return _service.createProductOption(productId, request);
  }

  @override
  Future<void> deleteProductOption(String productId, String optionId) {
    return _service.deleteProductOption(productId, optionId);
  }

  @override
  Future<List<ProductOption>> getProductOptions(String productId) {
    return _service
        .getProductOptions(productId)
        .then((value) => value.map((e) => e.toProductOption()).toList());
  }

  @override
  Future<void> createProductTag(CreateProductTagReq req) {
    return _service.createProductTag(req);
  }

  @override
  Future<void> createProductType(CreateProductTypeReq req) {
    return _service.createProductType(req);
  }

  @override
  Future<List<ProductTag>> getProductTags() {
    return _service
        .getProductTags()
        .then((value) => value.map((e) => e.toProductTag()).toList());
  }

  @override
  Future<List<ProductType>> getProductTypes() {
    return _service
        .getProductTypes()
        .then((value) => value.map((e) => e.toProductType()).toList());
  }
}
