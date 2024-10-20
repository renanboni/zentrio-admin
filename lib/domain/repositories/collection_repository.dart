import 'package:zentrio_admin/data/models/create_collection_request.dart';
import 'package:zentrio_admin/domain/models/paginated_response.dart';

import '../models/collection.dart';

abstract class CollectionRepository {
  Future<PaginatedResponse<Collection>> getCollections(
      {int limit = 10, int offset = 0});

  Future<Collection> getCollectionById(
    String id,
    List<String> expand,
  );

  Future<void> createCollection(CreateCollectionRequest collection);

  Future<void> deleteCollection(String id);
}
