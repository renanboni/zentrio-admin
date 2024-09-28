
import '../../domain/models/collection.dart';
import '../models/api_collection.dart';

extension ApiCollectionMapper on ApiCollection {
  Collection toCollection() {
    return Collection(
      id: id ?? '',
      title: title ?? '',
      handle: handle ?? '',
    );
  }
}