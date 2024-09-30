import 'package:injectable/injectable.dart';

import '../../data/models/create_collection_request.dart';
import '../models/collection.dart';
import '../repositories/collection_repository.dart';

@Injectable()
class CollectionUseCase {
  final CollectionRepository _collectionRepository;

  CollectionUseCase(this._collectionRepository);

  Future<List<Collection>> getCollections() {
    return _collectionRepository.getCollections();
  }

  Future<Collection> getCollectionById(
    String id, {
    List<String> expand = const [],
  }) {
    return _collectionRepository.getCollectionById(id, expand);
  }

  Future<void> createCollection(CreateCollectionRequest collection) {
    return _collectionRepository.createCollection(collection);
  }
}
