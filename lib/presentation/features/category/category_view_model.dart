import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/usecase/product_usecase.dart';

@injectable
class CategoryViewModel {
  final Signal<Category> category = Signal<Category>(Category.empty());

  final ProductUseCase _productUseCase;

  CategoryViewModel(this._productUseCase);

  void getCategory(String categoryId) async {
    try {
      final category = await _productUseCase.getCategoryById(categoryId);
      this.category.value = category;
    } catch (e) {
      print(e);
    }
  }
}
