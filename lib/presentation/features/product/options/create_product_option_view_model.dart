import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

import '../../../../data/models/create_product_option_req.dart';

@Injectable()
class CreateProductOptionViewModel {
  final Signal<String> title = Signal<String>("");
  final ListSignal<String> variations = ListSignal<String>([]);
  String _productId = "";

  final ProductUseCase _productUseCase;

  CreateProductOptionViewModel(this._productUseCase);

  void init(String productId) {
    _productId = productId;
  }

  void onSave(
    VoidCallback onSuccess,
    VoidCallback onError,
  ) {
    try {
      _productUseCase.createProductOption(
        _productId,
        CreateProductOptionRequest(
          title: title.value,
          values: variations.value,
        ),
      );
      onSuccess();
    } catch (e) {
      onError();
      print(e);
    }
  }
}
