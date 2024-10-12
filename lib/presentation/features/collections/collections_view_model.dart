import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/domain/usecase/collection_use_case.dart';

import '../../../domain/models/collection.dart';

@injectable
class CollectionsViewModel {
  final CollectionUseCase _collectionUseCase;

  final ListSignal<Collection> collections = listSignal([]);

  CollectionsViewModel(this._collectionUseCase) {
    _getCollections();
  }

  void _getCollections() async {
    try {
      final result = await _collectionUseCase.getCollections();
      collections.value = result;
    } catch (e) {
      print(e);
    }
  }

  void deleteCollection(
    String id,
    VoidCallback onSuccess,
    VoidCallback onFailure,
  ) async {
    try {
      await _collectionUseCase.deleteCollection(id);
      onSuccess();
      _getCollections();
    } catch (e) {
      onFailure();
      print(e);
    }
  }

  void refresh() {
    _getCollections();
  }
}
