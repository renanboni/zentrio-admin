
import '../models/api_key.dart';

abstract class ApiKeyRepository {
  Future<ApiKey> getStoreApiKey(String storeId);
}
