
import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';

import '../../data/models/req/create_category_req.dart';
import '../models/category.dart';
import '../repositories/category_repository.dart';

@Injectable()
class CategoryUseCase {
  final CategoryRepository _categoryRepository;

  CategoryUseCase(this._categoryRepository);

  Future<PaginatedResponse<Category>> getCategories({int limit = 10, int offset = 0}) {
    return _categoryRepository.getCategories(limit: limit, offset: offset);
  }

  Future<void> createCategory(CreateCategoryRequest req) {
    return _categoryRepository.createCategory(req);
  }

  Future<void> deleteCategory(String id) {
    return _categoryRepository.deleteCategory(id);
  }

  Future<Category> getCategoryById(String id) {
    return _categoryRepository.getCategoryById(id);
  }

  Future<void> updateCategory(String id, Map<String, dynamic> fields) {
    return _categoryRepository.updateCategory(id, fields);
  }
}