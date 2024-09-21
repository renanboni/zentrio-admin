import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/usecase/category_usecase.dart';

@injectable
class CategoryViewModel {
  final Signal<Category> category = Signal<Category>(Category.empty());

  final CategoryUseCase _categoryUseCase;

  CategoryViewModel(this._categoryUseCase);

  void getCategory(String categoryId) async {
    try {
      final category = await _categoryUseCase.getCategoryById(categoryId);
      this.category.value = category;
    } catch (e) {
      print(e);
    }
  }
}
