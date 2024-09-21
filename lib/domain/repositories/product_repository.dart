
import 'package:zentrio_admin/data/models/api_product.dart';

import '../models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAll();

  Future<void> createProduct(ApiProduct product);

  Future<Product> getProductById(String id, {List<String> expand = const []});
}
