import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/metadata.dart';
import 'package:zentrio_admin/domain/models/product.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

@Injectable()
class ProductMetadataViewModel {
  final ListSignal<Metadata> metadata = ListSignal([]);
  final Signal<Product> product = signal(Product.empty());

  final ProductUseCase _productUseCase;

  ProductMetadataViewModel(this._productUseCase);

  void init(String productId) async {
    try {
      final product = await _productUseCase.getProductById(productId);
      this.product.value = product;
      metadata.value =
          product.metadata.isEmpty ? [Metadata.empty()] : product.metadata;
    } catch (e) {
      print(e);
    }
  }

  void onSave(
      VoidCallback onSuccess,
      VoidCallback onError,
      ) async {
    try {
      final metadataMap = {
        for (var meta in metadata) meta.key: meta.value,
      };

      await _productUseCase.updateProduct(
        product.value.id,
        {
          "metadata": metadataMap,
        },
      );
      onSuccess();
    } catch (e) {
      print(e);
      onError();
    }
  }

  void onKeyChanged(int index, String value) {
    metadata[index] = metadata[index].copyWith(key: value);
  }

  void onValueChanged(int index, String value) {
    metadata[index] = metadata[index].copyWith(value: value);
  }

  void onAddRowAbove(int index) {
    metadata.insert(
      index,
      Metadata.empty(),
    );
  }

  void onAddRowBelow(int index) {
    metadata.insert(
      index + 1,
      Metadata.empty(),
    );
  }

  void onDeleteRow(int index) {
    metadata.removeAt(index);
  }
}
