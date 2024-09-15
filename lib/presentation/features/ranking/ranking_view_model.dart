
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';

import '../../../domain/models/category.dart';
import '../../../domain/usecase/product_usecase.dart';

@injectable
class RankingViewModel {

  final ProductUseCase _productUseCase;

  final Signal<List<Category>> categories = signal([]);

  RankingViewModel(this._productUseCase) {
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