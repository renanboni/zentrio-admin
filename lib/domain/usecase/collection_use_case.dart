import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';

import '../../data/models/create_collection_request.dart';
import '../models/collection.dart';
import '../repositories/collection_repository.dart';

@Injectable()
class CollectionUseCase {
  final CollectionRepository _collectionRepository;

  CollectionUseCase(this._collectionRepository);

  Future<PaginatedResponse<Collection>> getCollections(
      {int limit = 10, int offset = 0}) {
    return _collectionRepository.getCollections(limit: limit, offset: offset);
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

  Future<void> deleteCollection(String id) {
    return _collectionRepository.deleteCollection(id);
  }
}
