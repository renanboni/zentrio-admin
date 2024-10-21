
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

import '../../../../domain/models/product_tag.dart';

@Injectable()
class EditProductTagViewModel {

  final Signal<ProductTag> productTag = Signal(ProductTag.empty());

  final ProductUseCase _productUseCase;

  EditProductTagViewModel(this._productUseCase);

  void init(String productTagId) async {
    try {
      final productTag = await _productUseCase.getProductTagById(productTagId);
      this.productTag.set(productTag);
    } catch (e) {
      print(e);
    }
  }
}