import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/category_status.dart';
import 'package:zentrio_admin/domain/models/category_visibility.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

import '../../../../domain/models/category.dart';

@Injectable()
class CreateCategoryViewModel {
  final ProductUseCase _productUseCase;

  CategoryStatus? categoryStatus = CategoryStatus.active;
  CategoryVisibility? categoryVisibility = CategoryVisibility.public;
  final Signal<List<Category>> categories = signal([]);

  final title = signal("");
  final handle = signal("");
  final description = signal("");

  late final ranking = computed(
    () {
      final sortedCategories = categories.value
          .map(
            (e) => e.isNew ? e.copyWith(name: title.value) : e,
          )
          .toList();

      return sortedCategories;
    },
  );

  CreateCategoryViewModel(this._productUseCase) {
    _getCategories();
  }

  Future<void> createCategory(
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    try {
      await _productUseCase.createCategory(
        Category(
          name: title.value,
          handle: handle.value,
          description: description.value,
          rank: categories.value.indexWhere((element) => element.isNew),
          isActive: categoryStatus == CategoryStatus.active,
          isInternal: categoryVisibility == CategoryVisibility.internal,
        ),
      );
      onSuccess();
    } catch (e) {
      print(e);
      onError();
    }
  }

  _getCategories() async {
    try {
      categories.value = [
        Category.empty().copyWith(
          rank: -1,
          isNew: true,
        ),
        ...(await _productUseCase.getCategories())
      ];
    } catch (e) {
      print(e);
    }
  }

  void onCategoryStatusChanged(CategoryStatus? status) {
    categoryStatus = status;
  }

  void onCategoryVisibilityChanged(CategoryVisibility? visibility) {
    categoryVisibility = visibility;
  }
}
