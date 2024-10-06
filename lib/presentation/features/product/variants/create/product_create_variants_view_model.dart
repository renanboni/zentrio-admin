import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/product_option.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

@Injectable()
class ProductCreateVariantsViewModel {
  final ProductUseCase _productUseCase;

  final ListSignal<ProductOption> options = ListSignal<ProductOption>([]);

  ProductCreateVariantsViewModel(
    this._productUseCase,
  );

  void init(String productId) async {
    try {
      options.value = await _productUseCase.getProductOptions(productId);
    } catch (e) {
      print(e);
    }
  }
}
