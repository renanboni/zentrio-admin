import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/product_tag.dart';
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

  void deleteProductTag(
    ProductTag productTag,
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    try {
      await _productUseCase.deleteProductTag(productTag.id);
      _getProductTags();
      onSuccess();
    } catch (e) {
      onError();
      print(e);
    }
  }
}
