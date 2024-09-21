
import 'package:injectable/injectable.dart';

import '../models/category.dart';
import '../repositories/category_repository.dart';

@Injectable()
class CategoryUseCase {
  final CategoryRepository _categoryRepository;

  CategoryUseCase(this._categoryRepository);

  Future<List<Category>> getCategories() {
    return _categoryRepository.getCategories();
  }

  Future<void> createCategory(Category category) {
    return _categoryRepository.createCategory(category);
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