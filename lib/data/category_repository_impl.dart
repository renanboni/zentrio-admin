import 'package:zentrio_admin/data/mappers/product_mapper.dart';
import 'package:zentrio_admin/data/remote/category_service.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';

import '../domain/repositories/category_repository.dart';
import 'models/req/create_category_req.dart';
import 'models/req/update_category_req.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryService _service;

  CategoryRepositoryImpl(this._service);

  @override
  Future<PaginatedResponse<Category>> getCategories({int limit = 10, int offset = 0}) {
    return _service.getCategories(limit, offset).then(
          (response) {
        return PaginatedResponse<Category>(
          count: response.count ?? 0,
          offset: response.offset ?? 0,
          limit: response.limit ?? 0,
          data: response.data?.map((e) => e.toCategory()).toList() ?? [],
        );
      },
    );
  }

  @override
  Future<void> createCategory(CreateCategoryRequest request) {
    return _service.createCategory(request);
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
  Future<void> updateCategory(String id, UpdateCategoryRequest req) {
    return _service.updateCategory(id, req);
  }
}
