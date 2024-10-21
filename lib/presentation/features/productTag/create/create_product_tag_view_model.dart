import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

import '../../../../data/models/req/create_product_tag_req.dart';

@Injectable()
class CreateProductTagViewModel {
  final Signal<String> value = Signal<String>("");

  final ProductUseCase _productUseCase;

  CreateProductTagViewModel(this._productUseCase);

  void onCreate(
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    try {
      await _productUseCase.createProductTag(
        CreateProductTagReq(value: value.value),
      );
      onSuccess();
    } catch (e) {
      print(e);
      onError();
    }
  }
}
