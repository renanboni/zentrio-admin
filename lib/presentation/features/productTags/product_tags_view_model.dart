
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/product_tag.dart';
import 'package:zentrio_admin/domain/models/product_tag.dart';
import 'package:zentrio_admin/domain/models/product_type.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

@Injectable()
class ProductTagsViewModel {

  final ListSignal<ProductTag> productTags = ListSignal<ProductTag>([]);

  final ProductUseCase _productUseCase;

  ProductTagsViewModel(this._productUseCase) {
    _getProductTags();
  }

  _getProductTags() async {
    try {
      productTags.value = await _productUseCase.getProductTags();
    } catch (e) {
      print(e);
    }
  }

  void refresh() {
    _getProductTags();
  }
}