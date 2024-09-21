import 'package:zentrio_admin/data/mappers/product_mapper.dart';
import 'package:zentrio_admin/data/models/api_file.dart';
import 'package:zentrio_admin/data/models/api_product.dart';
import 'package:zentrio_admin/data/remote/product_service.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/product.dart';

import '../domain/models/medusa_file.dart';
import '../domain/models/product_option.dart';
import '../domain/repositories/product_repository.dart';
import 'models/api_product_option.dart';

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
  Future<List<Category>> getCategories() {
    return _service
        .getCategories()
        .then((value) => value.categories.map((e) => e.toCategory()).toList());
  }

  @override
  Future<void> createCategory(Category category) {
    return _service.createCategory(category.createCategoryRequest());
  }

  @override
  Future<void> deleteCategory(String id) {
    return _service.deleteCategory(id);
  }

  @override
  Future<Category> getCategoryById(String id) {
    return _service
        .getCategoryById(id)
        .then((value) => value.category.toCategory());
  }

  @override
  Future<void> updateCategory(String id, Map<String, dynamic> fields) {
    return _service.updateCategory(id, fields);
  }

  @override
  Future<void> createProduct(ApiProduct product) {
    return _service.createProduct(product);
  }
}
