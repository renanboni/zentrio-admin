import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

import '../../../../domain/models/media_file.dart';
import '../../../../domain/models/product_option.dart';

@injectable
class CreateProductViewModel {
  final showProductOptions = signal(false);
  final productTitle = signal('');
  final files = signal<List<MediaFile>>([]);
  final categories = signal<List<Category>>([]);
  final productOptions = signal<List<ProductOption>>(
    [ProductOption.empty()],
  );
  late final showAddOptionsAlert = computed(() {
    return productOptions.value
            .where((e) => e == ProductOption.empty())
            .length ==
        productOptions.value.length;
  });

  final ProductUseCase _productUseCase;

  CreateProductViewModel(this._productUseCase) {
    _getCategories();
  }

  _getCategories() async {
    try {
      categories.value = await _productUseCase.getCategories();
    } catch (e) {
      print(e);
    }
  }

  void onMakeThumbnail(MediaFile file) {
    files.value = files.value
        .map(
          (e) => e.copyWith(isThumbnail: e == file),
        )
        .toList();
  }

  void onDeleteFile(int index) {
    files.value = files.value..removeAt(index);
  }

  void onFilesAdded(List<MediaFile> mediaFiles) {
    files.value = [...files.value, ...mediaFiles];
  }

  void onToggleProductOptions(bool isChecked) {
    showProductOptions.value = isChecked;
  }

  void onAddProductOption() {
    productOptions.value = [
      ...productOptions.value,
      ProductOption.empty(),
    ];
  }

  void onRemoveProductOption(int index) {
    productOptions.value = [
      ...productOptions.value..removeAt(index),
    ];
  }

  void onProductTitleChanged(int index, String title) {
    productOptions.value = [
      ...productOptions.value
        ..replaceRange(
          index,
          index + 1,
          [
            productOptions.value[index].copyWith(title: title),
          ],
        ),
    ];
  }

  void onProductValuesChanged(int index, List<String> values) {
    productOptions.value = [
      ...productOptions.value
        ..replaceRange(
          index,
          index + 1,
          [
            productOptions.value[index].copyWith(values: values),
          ],
        ),
    ];
  }
}
