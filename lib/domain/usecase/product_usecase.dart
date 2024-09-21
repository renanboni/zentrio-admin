import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/data/models/api_product.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/medusa_file.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/domain/repositories/product_repository.dart';

@injectable
class ProductUseCase {
  final ProductRepository _productRepository;

  ProductUseCase(this._productRepository);

  Future<void> createProduct(ApiProduct product) {
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
}
