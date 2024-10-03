import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/data/models/req/update_product_organization_req.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/collection.dart';
import 'package:zentrio_admin/domain/usecase/category_usecase.dart';
import 'package:zentrio_admin/domain/usecase/collection_use_case.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

import '../../../../domain/models/product.dart';

@Injectable()
class ProductOrganizationViewModel {
  final CollectionUseCase _collectionUseCase;
  final CategoryUseCase _categoryUseCase;
  final ProductUseCase _productUseCase;

  final Signal<Product> product = signal(Product.empty());
  final ListSignal<Collection> collections = ListSignal([]);
  final ListSignal<Category> categories = ListSignal([]);
  final List<Category> selectedCategories = [];
  Collection selectedCollection = Collection.empty();

  ProductOrganizationViewModel(
    this._collectionUseCase,
    this._categoryUseCase,
    this._productUseCase,
  ) {
    _getCollection();
    _getCategories();
  }

  void init(String productId) async {
    try {
      final result = await _productUseCase.getProductById(
        productId,
        expand: ["categories", "collection"],
      );
      product.value = result;
    } catch (e) {
      print(e);
    }
  }

  void onCategoriesChanged(List<Category> categories) {
    selectedCategories.clear();
    selectedCategories.addAll(categories);
  }

  void onCollectionChanged(Collection? collection) {
    if (collection != null) {
      selectedCollection = collection;
    }
  }

  void onSave(
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    try {
      final categoryIds = selectedCategories.map((e) => e.id ?? '').toList();

      await _productUseCase.updateProduct(
          product.value.id,
          UpdateProductOrganizationReq(
            categoryIds: categoryIds.isNotEmpty &&
                    categoryIds !=
                        product.value.categories.map((e) => e.id ?? '').toList()
                ? categoryIds
                : null,
            collection: selectedCollection != Collection.empty() &&
                    selectedCollection.id != product.value.collection.id
                ? selectedCollection.id
                : null,
          ).toJson());
      onSuccess();
    } catch (e) {
      onError();
      print(e);
    }
  }

  _getCollection() async {
    try {
      final result = await _collectionUseCase.getCollections();
      collections.value = result;
    } catch (e) {
      print(e);
    }
  }

  _getCategories() async {
    try {
      final result = await _categoryUseCase.getCategories();
      categories.value = result;
    } catch (e) {
      print(e);
    }
  }
}
