
import 'package:zentrio_admin/data/models/api_product.dart';

import '../../data/models/create_product_request.dart';
import '../models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAll();

  Future<void> createProduct(CreateProductRequest product);

  Future<Product> getProductById(String id, {List<String> expand = const []});

  Future<void> updateProduct(String productId, Map<String, dynamic> fields);
}
