
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/product_type.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

@Injectable()
class EditProductTypeViewModel {

  final Signal<ProductType> productType = Signal(ProductType.empty());

  final ProductUseCase _productUseCase;

  EditProductTypeViewModel(this._productUseCase);

  void init(String productTypeId) async {
    try {
      final productType = await _productUseCase.getProductTypeById(productTypeId);
      this.productType.set(productType);
    } catch (e) {
      print(e);
    }
  }
}