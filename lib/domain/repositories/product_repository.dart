
import 'package:zentrio_admin/data/models/api_product.dart';
import 'package:zentrio_admin/domain/models/category.dart';

import '../models/medusa_file.dart';
import '../models/product.dart';
import '../models/product_option.dart';

abstract class ProductRepository {
  Future<List<Product>> getAll();

  Future<List<Category>> getCategories();

  Future<void> createCategory(Category category);

  Future<void> createProduct(ApiProduct product);

  Future<void> deleteCategory(String id);

  Future<Category> getCategoryById(String id);

  Future<void> updateCategory(String id, Map<String, dynamic> fields);

  Future<Product> getProductById(String id);
}
