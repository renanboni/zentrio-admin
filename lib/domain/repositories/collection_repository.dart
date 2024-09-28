import 'package:zentrio_admin/data/models/create_collection_request.dart';

import '../models/collection.dart';

abstract class CollectionRepository {
  Future<List<Collection>> getCollections();

  Future<void> createCollection(CreateCollectionRequest collection);
}
