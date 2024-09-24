import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:zentrio_admin/data/models/res/api_key_response.dart';

part 'api_key_service.g.dart';

@RestApi()
abstract class ApiKeyService {
  factory ApiKeyService(
    @Named("authenticated") Dio dio, {
    String baseUrl,
  }) = _ApiKeyService;

  @GET("/admin/vendor/{id}/api-key")
  Future<ApiKeyResponse> getStoreApiKey(@Path("id") String id);
}
