import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

@Injectable()
class ProductViewModel {
  final ProductUseCase _productUseCase;

  final Signal<Product> product = signal(Product.empty());

  ProductViewModel(this._productUseCase);

  void getProductById(String id) async {
    try {
      product.value = await _productUseCase.getProductById(
        id,
        expand: ['images', 'collection', 'categories'],
      );
    } catch (e) {
      print(e);
    }
  }
}
