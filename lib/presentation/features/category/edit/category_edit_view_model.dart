import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/data/models/req/update_category_req.dart';
import 'package:zentrio_admin/domain/usecase/category_usecase.dart';

import '../../../../domain/models/category.dart';
import '../../../../domain/models/category_status.dart';
import '../../../../domain/models/category_visibility.dart';

@Injectable()
class CategoryEditViewModel {
  final Signal<CategoryStatus> categoryStatus = signal(CategoryStatus.active);
  final Signal<CategoryVisibility> categoryVisibility = signal(
    CategoryVisibility.public,
  );

  final name = signal("");
  final handle = signal("");
  final description = signal("");

  final loading = signal(false);

  final Signal<Category> category = signal(Category.empty());

  final CategoryUseCase _categoryUseCase;

  CategoryEditViewModel(this._categoryUseCase);

  void getCategory(String categoryId) async {
    try {
      loading.value = true;

      category.value = await _categoryUseCase.getCategoryById(categoryId);

      name.value = category.value.name;
      handle.value = category.value.handle;
      description.value = category.value.description;

      categoryStatus.value = category.value.isActive
          ? CategoryStatus.active
          : CategoryStatus.inactive;

      categoryVisibility.value = category.value.isInternal
          ? CategoryVisibility.internal
          : CategoryVisibility.public;
    } catch (e) {
      print(e);
    } finally {
      loading.value = false;
    }
  }

  void onSaved(
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    try {
      await _categoryUseCase.updateCategory(
        category.value.id ?? "",
        UpdateCategoryRequest(
          name: name.value,
          handle: handle.value,
          description: description.value,
          isActive: categoryStatus.value == CategoryStatus.active,
          isInternal: categoryVisibility.value == CategoryVisibility.internal,
        ),
      );
      onSuccess();
    } catch (e) {
      onError();
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
