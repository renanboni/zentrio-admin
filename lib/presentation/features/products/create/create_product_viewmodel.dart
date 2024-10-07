import 'dart:typed_data';
import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/data/models/api_file.dart';
import 'package:zentrio_admin/data/models/api_product.dart';
import 'package:zentrio_admin/data/models/api_product_option.dart';
import 'package:zentrio_admin/data/models/create_product_option_req.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/product_option_value.dart';
import 'package:zentrio_admin/domain/models/product_variant.dart';
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
  late final ListSignal<ProductOption> productOptions = ListSignal(
    [ProductOption.empty()],
  );

  late final Computed<List<ProductVariant>> variants = computed(() {
    return _generateVariants(productOptions.value);
  });

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
                  values: e.values.map((e) => e.value).toList(),
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
    productOptions.add(ProductOption.empty());
  }

  void onRemoveProductOption(int index) {
    productOptions.removeAt(index);
  }

  void onProductOptionTitleChanged(int index, String title) {
    productOptions[index] = productOptions[index].copyWith(title: title);
  }

  void onProductOptionValuesChanged(
      int index, List<ProductOptionValue> values) {
    productOptions[index] = productOptions[index].copyWith(values: values);
  }

  void onProductOptionValueRemoved(int index, String value) {
    productOptions[index] = productOptions[index].copyWith(
      values:
          productOptions[index].values.where((e) => e.value != value).toList(),
    );
  }

  List<ProductVariant> _generateVariants(List<ProductOption> options) {
    if (options.isEmpty) {
      return [];
    }

    // Step 1: Extract the list of option values
    List<List<ProductOptionValue>> optionValues = options.map((option) => option.values).toList();

    // Step 2: Generate the Cartesian product of the option values
    List<List<ProductOptionValue>> combinations = _cartesianProduct(optionValues);

    // Step 3: Map the combinations to ProductVariant objects
    return combinations.map((combination) {
      // Create a map of option titles and selected values
      Map<String, String> optionMap = {
        for (int i = 0; i < combination.length; i++) options[i].title: combination[i].value
      };

      // Create a title by concatenating the selected values with '/'
      String title = combination.map((e) => e.value).join('/');

      return ProductVariant(
        title: title,
        options: optionMap,
      );
    }).toList();
  }

// Helper function to generate the Cartesian product
  List<List<ProductOptionValue>> _cartesianProduct(List<List<ProductOptionValue>> lists) {
    List<List<ProductOptionValue>> result = [[]];

    for (List<ProductOptionValue> list in lists) {
      List<List<ProductOptionValue>> newResult = [];
      for (List<ProductOptionValue> prefix in result) {
        for (ProductOptionValue value in list) {
          newResult.add([...prefix, value]);
        }
      }
      result = newResult;
    }

    return result;
  }
}
