
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/category.dart';

import '../../../domain/usecase/product_usecase.dart';

@injectable
class CategoriesViewModel {
  final ProductUseCase _productUseCase;

  final Signal<List<Category>> categories = signal([]);

  CategoriesViewModel(this._productUseCase) {
    _getCategories();
  }

  _getCategories() async {
    try {
      categories.value = await _productUseCase.getCategories();
    } catch (e) {
      print(e);
    }
  }
}
