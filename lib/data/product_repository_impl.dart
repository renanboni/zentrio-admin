import 'package:zentrio_admin/data/mappers/product_mapper.dart';
import 'package:zentrio_admin/data/models/create_product_option_req.dart';
import 'package:zentrio_admin/data/models/req/create_product_tag_req.dart';
import 'package:zentrio_admin/data/models/req/create_product_type_req.dart';
import 'package:zentrio_admin/data/remote/product_service.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/domain/models/product_tag.dart';
import 'package:zentrio_admin/domain/models/product_type.dart';

import '../domain/models/product_option.dart';
import '../domain/repositories/product_repository.dart';
import 'models/create_product_request.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService _service;

  ProductRepositoryImpl(this._service);

  @override
  Future<PaginatedResponse<Product>> getAll({int limit = 10, int offset = 0}) {
    return _service.getAll(limit, offset).then(
          (value) => PaginatedResponse(
            data: value.data?.map((e) => e.toProduct()).toList() ?? [],
            count: value.count ?? 0,
            offset: value.offset ?? 0,
            limit: value.limit ?? 0,
          ),
        );
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
  Future<PaginatedResponse<ProductTag>> getProductTags(
      {int limit = 10, int offset = 0}) {
    return _service.getProductTags(limit, offset).then(
          (value) => PaginatedResponse(
              data: value.data?.map((e) => e.toProductTag()).toList() ?? [],
              count: value.count ?? 0,
              offset: value.offset ?? 0,
              limit: value.limit ?? 0),
        );
  }

  @override
  Future<PaginatedResponse<ProductType>> getProductTypes(
      {int limit = 10, int offset = 0}) {
    return _service.getProductTypes(limit, offset).then(
          (value) => PaginatedResponse(
              data: value.data?.map((e) => e.toProductType()).toList() ?? [],
              count: value.count ?? 0,
              offset: value.offset ?? 0,
              limit: value.limit ?? 0),
        );
  }

  @override
  Future<ProductType> getProductTypeById(String id) {
    return _service
        .getProductTypeById(id)
        .then((value) => value.toProductType());
  }

  @override
  Future<ProductTag> getProductTagById(String id) {
    return _service.getProductTagById(id).then((value) => value.toProductTag());
  }

  @override
  Future<void> deleteProductTag(String id) {
    return _service.deleteProductTag(id);
  }

  @override
  Future<void> deleteProductType(String id) {
    return _service.deleteProductType(id);
  }

  @override
  Future<void> deleteProductById(String id) {
    return _service.deleteProductById(id);
  }
}
