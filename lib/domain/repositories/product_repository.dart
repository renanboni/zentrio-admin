
import 'package:zentrio_admin/domain/models/category.dart';

import '../models/medusa_file.dart';
import '../models/product.dart';
import '../models/product_option.dart';

abstract class ProductRepository {
  Future<List<Product>> getAll();

  Future<List<Category>> getCategories();

  Future<void> createCategory(Category category);

  Future<void> createProduct({
    required String title,
    required List<ProductOption> options,
    required String status,
    List<MedusaFile>? images,
  });

  Future<void> deleteCategory(String id);

  Future<Category> getCategoryById(String id);

  Future<void> updateCategory(String id, Map<String, dynamic> fields);
}
