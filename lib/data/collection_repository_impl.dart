import 'package:zentrio_admin/data/mappers/collection_mapper.dart';
import 'package:zentrio_admin/data/models/create_collection_request.dart';
import 'package:zentrio_admin/data/remote/collection_service.dart';
import 'package:zentrio_admin/domain/models/collection.dart';

import '../domain/repositories/collection_repository.dart';

class CollectionRepositoryImpl implements CollectionRepository {
  final CollectionService _service;

  CollectionRepositoryImpl(this._service);

  @override
  Future<void> createCollection(CreateCollectionRequest collection) {
    return _service.createCollection(collection);
  }

  @override
  Future<List<Collection>> getCollections() {
    return _service.getAll().then((value) =>
        value.collections?.map((e) => e.toCollection()).toList() ?? []);
  }

  @override
  Future<Collection> getCollectionById(String id, List<String> expand) {
    return _service
        .getCollectionById(id, expand.join(','))
        .then((value) => value.toCollection());
  }
}