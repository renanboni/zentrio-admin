import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/data/models/req/update_product_req.dart';
import 'package:zentrio_admin/domain/models/product_status.dart';

import '../../../../domain/models/product.dart';
import '../../../../domain/usecase/product_usecase.dart';

@Injectable()
class ProductEditViewModel {
  final Signal<Product> product = signal(const Product.empty());

  final Signal<ProductStatus> status = signal(ProductStatus.published);
  final Signal<String> title = signal('');
  final Signal<String> subtitle = signal('');
  final Signal<String> handle = signal('');
  final Signal<String> material = signal('');
  final Signal<String> description = signal('');
  final Signal<bool> discountable = signal(false);

  final ProductUseCase _productUseCase;

  ProductEditViewModel(this._productUseCase);

  void init(Product product) {
    this.product.value = product;

    status.value = ProductStatus.fromString(product.status);
    title.value = product.title;
    subtitle.value = product.subtitle;
    handle.value = product.handle;
    material.value = product.material;
    description.value = product.description;
    discountable.value = product.discountable;
  }

  void onSave(
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    final updateProductReq = UpdateProductReq(
      title: title.value != product.value.title ? title.value : null,
      subtitle: subtitle.value != product.value.subtitle ? subtitle.value : null,
      handle: handle.value != product.value.handle ? handle.value : null,
      material: material.value != product.value.material ? material.value : null,
      description: description.value != product.value.description ? description.value : null,
      discountable: discountable.value != product.value.discountable ? discountable.value : null,
      status: status.value != ProductStatus.fromString(product.value.status) ? status.value.name : null,
    );

    try {
      await _productUseCase.updateProduct(
        product.value.id,
        updateProductReq.toJson(),
      );
      onSuccess();
    } catch (e) {
      onError();
    }
  }
}
