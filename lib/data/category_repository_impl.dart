import 'package:zentrio_admin/data/mappers/product_mapper.dart';
import 'package:zentrio_admin/data/remote/category_service.dart';
import 'package:zentrio_admin/domain/models/category.dart';

import '../domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryService _service;

  CategoryRepositoryImpl(this._service);

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
}
