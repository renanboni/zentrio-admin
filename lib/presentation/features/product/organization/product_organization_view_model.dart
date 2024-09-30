import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/category.dart';
import 'package:zentrio_admin/domain/models/collection.dart';
import 'package:zentrio_admin/domain/usecase/category_usecase.dart';
import 'package:zentrio_admin/domain/usecase/collection_use_case.dart';

import '../../../../domain/models/product.dart';

@Injectable()
class ProductOrganizationViewModel {
  final CollectionUseCase _collectionUseCase;
  final CategoryUseCase _categoryUseCase;

  final Signal<Product> product = signal(Product.empty());
  final ListSignal<Collection> collections = ListSignal([]);
  final ListSignal<Category> categories = ListSignal([]);
  final Signal<Category> selectedCategory = signal(Category.empty());

  ProductOrganizationViewModel(
    this._collectionUseCase,
    this._categoryUseCase,
  ) {
    _getCollection();
    _getCategories();
  }

  void init(Product product) {
    this.product.value = product;
  }

  _getCollection() async {
    try {
      final result = await _collectionUseCase.getCollections();
      collections.value = result;
    } catch (e) {
      print(e);
    }
  }

  _getCategories() async {
    try {
      final result = await _categoryUseCase.getCategories();
      categories.value = result;
    } catch (e) {
      print(e);
    }
  }
}
