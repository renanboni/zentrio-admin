import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

import '../../../domain/models/product_option.dart';

@Injectable()
class ProductViewModel {
  final ProductUseCase _productUseCase;

  final Signal<Product> product = signal(Product.empty());

  ProductViewModel(this._productUseCase);

  void getProductById(String id) async {
    try {
      product.value = await _productUseCase.getProductById(
        id,
        expand: ['images', 'collection', 'categories', 'options.values'],
      );
    } catch (e) {
      print(e);
    }
  }

  void deleteProductOption(ProductOption option) async {
    try {
      await _productUseCase.deleteProductOption(
        product.value.id,
        option.id,
      );
      getProductById(product.value.id);
    } catch (e) {
      print(e);
    }
  }
}
