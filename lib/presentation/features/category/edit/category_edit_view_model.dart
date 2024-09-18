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

  final ProductUseCase _productUseCase;

  CategoryEditViewModel(this._productUseCase);

  void getCategory(String categoryId) async {
    try {
      final category = await _productUseCase.getCategoryById(categoryId);

      title.value = category.name;
      handle.value = category.handle;
      description.value = category.description;
      categoryStatus.value =
          category.isActive ? CategoryStatus.active : CategoryStatus.inactive;
      categoryVisibility.value = category.isInternal
          ? CategoryVisibility.internal
          : CategoryVisibility.public;
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
