import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/data/models/req/create_product_type_req.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

@Injectable()
class CreateProductTypeViewModel {
  final Signal<String> value = Signal<String>("");

  final ProductUseCase _productUseCase;

  CreateProductTypeViewModel(this._productUseCase);

  void onCreate(
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    try {
      await _productUseCase.createProductType(
        CreateProductTypeReq(value: value.value),
      );
      onSuccess();
    } catch (e) {
      print(e);
      onError();
    }
  }
}
