import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/data/models/api_product.dart';
import 'package:zentrio_admin/data/models/create_product_option_req.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/medusa_file.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/domain/repositories/product_repository.dart';

import '../../data/models/create_product_request.dart';

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
}
