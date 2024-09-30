import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/models/collection.dart';
import 'package:zentrio_admin/domain/usecase/collection_use_case.dart';

@Injectable()
class CollectionViewModel {
  final Signal<Collection> collection = Signal(Collection.empty());

  final CollectionUseCase _collectionUseCase;

  CollectionViewModel(this._collectionUseCase);

  void init(String collectionId) async {
    try {
      final collection = await _collectionUseCase.getCollectionById(
        collectionId,
        expand: ["products"],
      );
      this.collection.value = collection;
    } catch (e) {
      print(e);
    }
  }
}
