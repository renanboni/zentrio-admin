import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/data/models/req/update_product_attributes_req.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

@Injectable()
class ProductAttributesViewModel {
  final Signal<Product> product = signal(Product.empty());

  final ProductUseCase _productUseCase;

  ProductAttributesViewModel(this._productUseCase);

  final Signal<String> height = signal('');
  final Signal<String> width = signal('');
  final Signal<String> length = signal('');
  final Signal<String> weight = signal('');
  final Signal<String> midCode = signal('');

  void init(Product product) {
    this.product.value = product;
    height.value = product.height.toString();
    width.value = product.width.toString();
    length.value = product.length.toString();
    weight.value = product.weight.toString();
    midCode.value = product.midCode;
  }

  void onSave(
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    final attributesReq = UpdateProductAttributesReq(
      width: width.value != product.value.width.toString()
          ? double.parse(width.value)
          : null,
      height: height.value != product.value.height.toString()
          ? double.parse(height.value)
          : null,
      length: length.value != product.value.length.toString()
          ? double.parse(length.value)
          : null,
      weight: weight.value != product.value.weight.toString()
          ? double.parse(weight.value)
          : null,
      midCode: midCode.value != product.value.midCode ? midCode.value : null,
    );

    try {
      await _productUseCase.updateProduct(
        product.value.id,
        attributesReq.toJson(),
      );
      onSuccess();
    } catch (e) {
      onError();
    }
  }
}
