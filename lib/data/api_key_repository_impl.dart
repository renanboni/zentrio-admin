import 'package:zentrio_admin/data/mappers/api_key_mapper.dart';
import 'package:zentrio_admin/data/remote/api_key_service.dart';
import 'package:zentrio_admin/domain/models/api_key.dart';

import '../domain/repositories/api_key_repository.dart';

class ApiKeyRepositoryImpl implements ApiKeyRepository {
  final ApiKeyService _apiKeyService;

  ApiKeyRepositoryImpl(this._apiKeyService);

  @override
  Future<ApiKey> getStoreApiKey(String storeId)  {
    return _apiKeyService
        .getStoreApiKey(storeId)
        .then((value) => value.apiKey.toApiKey());
  }
}
