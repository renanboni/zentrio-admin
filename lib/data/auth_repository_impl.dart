import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/data/local/auth_local_data_source.dart';
import 'package:zentrio_admin/data/remote/auth_service.dart';
import 'package:zentrio_admin/domain/models/user_type.dart';

import 'models/req/auth_req.dart';

@lazySingleton
class AuthenticationRepository {
  final AuthService _medusaClient;
  final AuthenticationLocalDataSource _localDataSource;

  AuthenticationRepository(
    this._medusaClient,
    this._localDataSource,
  );

  Future<void> login(
    bool admin,
    String email,
    String password,
  ) async {
    try {
      final authResponse = admin
          ? await _medusaClient.signInAdmin(
              AuthRequest(
                email: email,
                password: password,
              ),
            )
          : await _medusaClient.signInVendor(
              AuthRequest(
                email: email,
                password: password,
              ),
            );

      final token = authResponse.token;
      final jwt = JWT.decode(token);
      await _localDataSource.setToken(authResponse.token);
      await _localDataSource.setUserType(
        UserType.fromString(
          jwt.payload['actor_type'],
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  UserType getUserType() {
    return _localDataSource.getUserType();
  }
}
