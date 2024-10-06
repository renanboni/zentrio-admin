import 'dart:typed_data';
import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/data/models/api_file.dart';
import 'package:zentrio_admin/data/models/api_product.dart';
import 'package:zentrio_admin/data/models/api_product_option.dart';
import 'package:zentrio_admin/data/models/create_product_option_req.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/usecase/category_usecase.dart';
import 'package:zentrio_admin/domain/usecase/file_usecase.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

import '../../../../data/models/create_product_request.dart';
import '../../../../domain/models/media_file.dart';
import '../../../../domain/models/product_option.dart';

@injectable
class CreateProductViewModel {
  final showProductOptions = signal(false);
  final productTitle = signal('');
  final files = listSignal<MediaFile>([]);
  final categories = signal<List<Category>>([]);
  final discountable = signal(false);
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
  final CategoryUseCase _categoryUseCase;
  final FileUseCase _fileUseCase;

  CreateProductViewModel(
    this._productUseCase,
    this._fileUseCase,
    this._categoryUseCase,
  ) {
    _getCategories();
  }

  void createProduct(
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    try {
      final bytes = files.value.map((e) => e.bytes ?? Uint8List(0)).toList();
      final uploadedFiles = await _fileUseCase.uploadBytes(bytes);

      await _productUseCase.createProduct(
        CreateProductRequest(
          title: productTitle.value,
          options: productOptions.value
              .map(
                (e) => CreateProductOptionRequest(
                  title: e.title,
                  values: e.values,
                ),
              )
              .toList(),
          status: 'published',
          images: uploadedFiles
              .map(
                (e) => ApiFile(id: e.id, url: e.url),
              )
              .toList(),
        ),
      );
      onSuccess();
    } catch (e) {
      onError();
      print(e);
    }
  }

  _getCategories() async {
    try {
      categories.value = await _categoryUseCase.getCategories();
    } catch (e) {
      print(e);
    }
  }

  void onMakeThumbnail(MediaFile file) {
    files.value = files.value
        .map(
          (e) => e.copyWith(isThumbnail: e.url == file.url),
        )
        .toList();
  }

  void onDeleteFile(int index) {
    files.value = List.from(files.value)..removeAt(index);
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
