
import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/usecase/category_usecase.dart';

import '../../../domain/models/category.dart';

@injectable
class RankingViewModel {

  final CategoryUseCase _categoryUseCase;

  final Signal<List<Category>> categories = signal([]);

  RankingViewModel(this._categoryUseCase) {
    _getCategories();
  }

  _getCategories() async {
    try {
      categories.value = (await _categoryUseCase.getCategories()).data;
    } catch (e) {
      print(e);
    }
  }
}