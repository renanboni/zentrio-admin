import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../../domain/models/category.dart';
import '../../../../domain/models/category_status.dart';
import '../../../../domain/models/category_visibility.dart';
import '../../../../domain/usecase/product_usecase.dart';

@Injectable()
class CategoryEditViewModel {
  final Signal<CategoryStatus> categoryStatus = signal(CategoryStatus.active);
  final Signal<CategoryVisibility> categoryVisibility = signal(
    CategoryVisibility.public,
  );

  final title = signal("");
  final handle = signal("");
  final description = signal("");

  final loading = signal(false);

  final Signal<Category?> category = signal(null);

  final ProductUseCase _productUseCase;

  CategoryEditViewModel(this._productUseCase);

  void getCategory(String categoryId) async {
    try {
      loading.value = true;

      category.value = await _productUseCase.getCategoryById(categoryId);

      title.value = category.value?.name ?? "";
      handle.value = category.value?.handle ?? "";
      description.value = category.value?.description ?? "";

      categoryStatus.value = category.value?.isActive == true
          ? CategoryStatus.active
          : CategoryStatus.inactive;
      categoryVisibility.value = category.value?.isInternal == true
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
    final fields = <String, dynamic>{};

    addIfChanged(fields, 'name', title.value, category.value?.name);
    addIfChanged(fields, 'handle', handle.value, category.value?.handle);
    addIfChanged(
      fields,
      'description',
      description.value,
      category.value?.description,
    );
    addIfChanged(
      fields,
      'is_active',
      categoryStatus.value == CategoryStatus.active ? true : false,
      category.value?.isActive,
    );
    addIfChanged(
      fields,
      'is_internal',
      categoryVisibility.value == CategoryVisibility.internal ? true : false,
      category.value?.isInternal,
    );

    if (fields.isEmpty) {
      return;
    }

    try {
      await _productUseCase.updateCategory(category.value?.id ?? "", fields);
      onSuccess();
    } catch (e) {
      onError();
      print(e);
    }
  }

  void addIfChanged(
    Map fields,
    String fieldName,
    dynamic newValue,
    dynamic oldValue,
  ) {
    if (newValue != oldValue) {
      fields[fieldName] = newValue;
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
