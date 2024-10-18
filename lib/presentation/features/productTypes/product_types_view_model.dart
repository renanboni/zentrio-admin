
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/product_type.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

@Injectable()
class ProductTypesViewModel {

  final ListSignal<ProductType> productTypes = ListSignal<ProductType>([]);

  final ProductUseCase _productUseCase;

  ProductTypesViewModel(this._productUseCase) {
    _getProductTypes();
  }

  _getProductTypes() async {
    try {
      productTypes.value = await _productUseCase.getProductTypes();
    } catch (e) {
      print(e);
    }
  }

  void refresh() {
    _getProductTypes();
  }
}