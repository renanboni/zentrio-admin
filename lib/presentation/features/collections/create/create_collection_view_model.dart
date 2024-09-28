import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:zentrio_admin/data/models/create_collection_request.dart';
import 'package:zentrio_admin/domain/usecase/collection_use_case.dart';

@Injectable()
class CreateCollectionViewModel {
  final CollectionUseCase _collectionUseCase;

  final Signal<String> title = signal("");
  final Signal<String> handle = signal("");

  CreateCollectionViewModel(this._collectionUseCase);

  void createCollection(
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    try {
      await _collectionUseCase.createCollection(
        CreateCollectionRequest(
          title: title.value,
          handle: handle.value,
        ),
      );
      onSuccess();
    } catch (e) {
      onError();
    }
  }
}
