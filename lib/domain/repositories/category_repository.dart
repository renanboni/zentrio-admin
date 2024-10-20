
import 'package:zentrio_admin/domain/models/paginated_response.dart';

import '../../data/models/req/create_category_req.dart';
import '../models/category.dart';

abstract class CategoryRepository {
  Future<PaginatedResponse<Category>> getCategories({int limit = 10, int offset = 0});

  Future<void> createCategory(CreateCategoryRequest req);

  Future<void> deleteCategory(String id);

  Future<Category> getCategoryById(String id);

  Future<void> updateCategory(String id, Map<String, dynamic> fields);
}
