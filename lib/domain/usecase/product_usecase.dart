import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/medusa_file.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/domain/repositories/product_repository.dart';

@injectable
class ProductUseCase {
  final ProductRepository _productRepository;

  ProductUseCase(this._productRepository);

  Future<void> createProduct({
    required String title,
    required List<ProductOption> options,
    required String status,
    List<MedusaFile>? images,
  }) {
    return _productRepository.createProduct(
      title: title,
      options: options,
      status: status,
      images: images,
    );
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
