import 'package:zentrio_admin/data/mappers/product_mapper.dart';
import 'package:zentrio_admin/data/models/api_file.dart';
import 'package:zentrio_admin/data/models/api_product.dart';
import 'package:zentrio_admin/data/remote/product_service.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/product.dart';

import '../domain/models/medusa_file.dart';
import '../domain/models/product_option.dart';
import '../domain/repositories/product_repository.dart';
import 'models/api_product_option.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService _service;

  ProductRepositoryImpl(this._service);

  @override
  Future<List<Product>> getAll() {
    return _service
        .getAll()
        .then((value) => value.products.map((e) => e.toProduct()).toList());
  }

  @override
  Future<void> createProduct(ApiProduct product) {
    return _service.createProduct(product);
  }

  @override
  Future<Product> getProductById(String id) {
    return _service
        .getProductById(id)
        .then((value) => value.product.toProduct());
  }
}
