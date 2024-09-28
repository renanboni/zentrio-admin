import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/collection.dart';
import 'package:zentrio_admin/domain/usecase/collection_use_case.dart';

import '../../../../domain/models/product.dart';

@Injectable()
class ProductOrganizationViewModel {
  final CollectionUseCase _collectionUseCase;

  final Signal<Product> product = signal(Product.empty());
  final ListSignal<Collection> collections = ListSignal<Collection>([]);

  ProductOrganizationViewModel(this._collectionUseCase) {
    _getCollection();
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
}
