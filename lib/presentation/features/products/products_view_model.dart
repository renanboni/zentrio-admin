
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

@injectable
class ProductsViewModel {
  final ProductUseCase _productUseCase;

  final Signal<List<Product>> products = signal([]);

  ProductsViewModel(this._productUseCase) {
    _getProducts();
  }

  void refresh() {
    _getProducts();
  }

  _getProducts() async {
    try {
      products.value = await _productUseCase.getAll();
    } catch (e) {
      print(e);
    }
  }
}