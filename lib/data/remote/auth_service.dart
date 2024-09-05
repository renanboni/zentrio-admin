
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:zentrio_admin/data/models/jwt_token.dart';

import '../models/req/auth_req.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(@Named("unauthenticated") Dio dio, {String baseUrl}) = _AuthService;

  @POST("/auth/user/emailpass")
  Future<JwtToken> signInAdmin(@Body() AuthRequest req);

  @POST("/auth/vendor/emailpass")
  Future<JwtToken> signInVendor(@Body() AuthRequest req);
}
