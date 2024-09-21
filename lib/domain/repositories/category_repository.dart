
import '../models/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();

  Future<void> createCategory(Category category);

  Future<void> deleteCategory(String id);

  Future<Category> getCategoryById(String id);

  Future<void> updateCategory(String id, Map<String, dynamic> fields);
}
