import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

@injectable
class ProductsViewModel {
  final ProductUseCase _productUseCase;

  final Signal<PaginatedResponse<Product>> products =
      signal(PaginatedResponse.empty());

  ProductsViewModel(this._productUseCase) {
    _getProducts();
  }

  void refresh() {
    _getProducts();
  }

  _getProducts() async {
    try {
      products.value = await _productUseCase.getAll();
      print(products.value);
    } catch (e) {
      print(e);
    }
  }

  void onDeleteProduct(
    String id,
    VoidCallback onSuccess,
    VoidCallback onFailure,
  ) async {
    try {
      await _productUseCase.deleteProductById(id);
      _getProducts();
      onSuccess();
    } catch (e) {
      onFailure();
    }
  }
}
