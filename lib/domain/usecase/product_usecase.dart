import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/domain/repositories/product_repository.dart';

@injectable
class ProductUseCase {
  final ProductRepository _productRepository;

  ProductUseCase(this._productRepository);

  Future<void> create(Product product) {
    return _productRepository.createProduct(product);
  }

  Future<List<Product>> getAll() {
    return _productRepository.getAll();
  }

  Future<List<Category>> getCategories() {
    return _productRepository.getCategories();
  }

  Future<void> createCategory(Category category) {
    return _productRepository.createCategory(category);
  }

  Future<void> deleteCategory(String id) {
    return _productRepository.deleteCategory(id);
  }

  Future<Category> getCategoryById(String id) {
    return _productRepository.getCategoryById(id);
  }

  Future<void> updateCategory(String id, Map<String, dynamic> fields) {
    return _productRepository.updateCategory(id, fields);
  }
}
