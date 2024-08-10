
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:zentrio_admin/data/models/jwt_token.dart';

import '../models/req/auth_req.dart';

part 'medusa_client.g.dart';

@RestApi(baseUrl: 'http://localhost:9000')
abstract class MedusaClient {
  factory MedusaClient(Dio dio, {String baseUrl}) = _MedusaClient;

  @POST("/auth/user/emailpass")
  Future<JwtToken> signIn(@Body() AuthRequest req);
}
