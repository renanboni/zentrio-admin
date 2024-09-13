
import 'package:zentrio_admin/domain/models/category.dart';

import '../models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAll();

  Future<List<Category>> getCategories();
}
