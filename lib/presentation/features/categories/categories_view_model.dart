import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';
import 'package:zentrio_admin/domain/usecase/category_usecase.dart';

import '../../../domain/usecase/product_usecase.dart';

@injectable
class CategoriesViewModel {
  final CategoryUseCase _categoryUseCase;

  final Signal<PaginatedResponse<Category>> categories = signal(PaginatedResponse.empty());

  CategoriesViewModel(this._categoryUseCase) {
    _getCategories();
  }

  _getCategories() async {
    try {
      categories.value = await _categoryUseCase.getCategories();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteCategory(
    Category category,
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    try {
      await _categoryUseCase.deleteCategory(category.id ?? "");
      _getCategories();
      onSuccess();
    } catch (e) {
      onError();
    }
  }
}
