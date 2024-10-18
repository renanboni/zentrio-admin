
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/product_type.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

import '../../../domain/models/product_tag.dart';

@Injectable()
class ProductTagViewModel {

  final Signal<ProductTag> productTag = Signal(ProductTag.empty());

  final ProductUseCase _productUseCase;

  ProductTagViewModel(this._productUseCase);

  void init(String productTagId) async {
    try {
      final productTag = await _productUseCase.getProductTagById(productTagId);
      this.productTag.value = productTag;
    } catch (e) {
      print(e);
    }
  }
}
