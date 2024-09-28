import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/collection.dart';
import 'package:zentrio_admin/domain/usecase/collection_use_case.dart';

@Injectable()
class ProductOrganizationViewModel {
  final CollectionUseCase _collectionUseCase;
  final ListSignal<Collection> collections = ListSignal<Collection>([]);

  ProductOrganizationViewModel(this._collectionUseCase) {
    _getCollection();
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
