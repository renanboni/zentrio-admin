import 'package:zentrio_admin/data/mappers/collection_mapper.dart';
import 'package:zentrio_admin/data/models/create_collection_request.dart';
import 'package:zentrio_admin/data/remote/collection_service.dart';
import 'package:zentrio_admin/domain/models/collection.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';

import '../domain/repositories/collection_repository.dart';

class CollectionRepositoryImpl implements CollectionRepository {
  final CollectionService _service;

  CollectionRepositoryImpl(this._service);

  @override
  Future<void> createCollection(CreateCollectionRequest collection) {
    return _service.createCollection(collection);
  }

  @override
  Future<PaginatedResponse<Collection>> getCollections({int limit = 10, int offset = 0}) {
    return _service.getAll(limit, offset).then(
          (response) {
        return PaginatedResponse<Collection>(
          count: response.count ?? 0,
          offset: response.offset ?? 0,
          limit: response.limit ?? 0,
          data: response.data?.map((e) => e.toCollection()).toList() ?? [],
        );
      },
    );
  }

  @override
  Future<Collection> getCollectionById(String id, List<String> expand) {
    return _service
        .getCollectionById(id, expand.join(','))
        .then((value) => value.toCollection());
  }

  @override
  Future<void> deleteCollection(String id) {
    return _service.deleteCollection(id);
  }
}
