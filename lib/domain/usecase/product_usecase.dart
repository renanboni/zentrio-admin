import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/data/models/api_product.dart';
import 'package:zentrio_admin/data/models/create_product_option_req.dart';
import 'package:zentrio_admin/data/models/req/create_product_type_req.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/medusa_file.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/domain/models/product_type.dart';
import 'package:zentrio_admin/domain/repositories/product_repository.dart';

import '../../data/models/create_product_request.dart';
import '../../data/models/req/create_product_tag_req.dart';
import '../models/product_tag.dart';

@injectable
class ProductUseCase {
  final ProductRepository _productRepository;

  ProductUseCase(this._productRepository);

  Future<void> createProduct(CreateProductRequest product) {
    return _productRepository.createProduct(product);
  }

  Future<Product> getProductById(
    String id, {
    List<String> expand = const [],
  }) {
    return _productRepository.getProductById(id, expand: expand);
  }

  Future<List<Product>> getAll() {
    return _productRepository.getAll();
  }

  Future<void> updateProduct(
    String id,
    Map<String, dynamic> fields,
  ) {
    return _productRepository.updateProduct(id, fields);
  }

  Future<void> createProductOption(
    String id,
    CreateProductOptionRequest request,
  ) {
    return _productRepository.createProductOption(id, request);
  }

  Future<void> deleteProductOption(
    String productId,
    String optionId,
  ) {
    return _productRepository.deleteProductOption(productId, optionId);
  }

  Future<List<ProductOption>> getProductOptions(String productId) {
    return _productRepository.getProductOptions(productId);
  }

  Future<void> createProductType(CreateProductTypeReq req) {
    return _productRepository.createProductType(req);
  }

  Future<PaginatedResponse<ProductType>> getProductTypes({int limit = 10, int offset = 0}) {
    return _productRepository.getProductTypes(limit: limit, offset: offset);
  }

  Future<ProductType> getProductTypeById(String id) {
    return _productRepository.getProductTypeById(id);
  }

  Future<void> createProductTag(CreateProductTagReq req) {
    return _productRepository.createProductTag(req);
  }

  Future<PaginatedResponse<ProductTag>> getProductTags({int limit = 10, int offset = 0}) {
    return _productRepository.getProductTags(limit: limit, offset: offset);
  }

  Future<ProductTag> getProductTagById(String id) {
    return _productRepository.getProductTagById(id);
  }

  Future<void> deleteProductTag(String id) {
    return _productRepository.deleteProductTag(id);
  }

  Future<void> deleteProductType(String id) {
    return _productRepository.deleteProductType(id);
  }
}
