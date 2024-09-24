
import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/domain/models/api_key.dart';

import '../repositories/api_key_repository.dart';

@injectable
class ApiKeyUseCase {
  final ApiKeyRepository _apiKeyRepository;

  ApiKeyUseCase(this._apiKeyRepository);

  Future<ApiKey> getStoreApiKey(String storeId) async {
    return await _apiKeyRepository.getStoreApiKey(storeId);
  }
}