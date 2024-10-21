import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/category_status.dart';
import 'package:zentrio_admin/domain/models/category_visibility.dart';
import 'package:zentrio_admin/domain/usecase/category_usecase.dart';

import '../../../../data/models/req/create_category_req.dart';
import '../../../../domain/models/category.dart';

@Injectable()
class CreateCategoryViewModel {
  final CategoryUseCase _categoryUseCase;

  final Signal<CategoryStatus> categoryStatus = signal(CategoryStatus.active);
  final Signal<CategoryVisibility> categoryVisibility =
      signal(CategoryVisibility.public);
  final Signal<List<Category>> categories = signal([]);

  final title = signal("");
  final handle = signal("");
  final description = signal("");

  late final ranking = computed(
    () {
      final sortedCategories = categories.value
          .map((e) => e.isNew ? e.copyWith(name: title.value) : e)
          .toList();

      return sortedCategories;
    },
  );

  CreateCategoryViewModel(this._categoryUseCase) {
    _getCategories();
  }

  Future<void> createCategory(
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    try {
      await _categoryUseCase.createCategory(
        CreateCategoryRequest(
          name: title.value,
          handle: handle.value,
          description: description.value,
          rank: categories.value.isEmpty ? 0 : categories.value.indexWhere((element) => element.isNew),
          isActive: categoryStatus.value == CategoryStatus.active,
          isInternal: categoryVisibility.value == CategoryVisibility.internal,
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
        ...(await _categoryUseCase.getCategories()).data
      ];
    } catch (e) {
      print(e);
    }
  }

  void onCategoryStatusChanged(CategoryStatus? status) {
    if (status != null) {
      categoryStatus.value = status;
    }
  }

  void onCategoryVisibilityChanged(CategoryVisibility? visibility) {
    if (visibility != null) {
      categoryVisibility.value = visibility;
    }
  }
}
