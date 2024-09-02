import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/data/local/auth_local_data_source.dart';
import 'package:zentrio_admin/data/remote/medusa_client.dart';

import 'models/req/auth_req.dart';

@lazySingleton
class AuthenticationRepository {
  final MedusaClient _medusaClient;
  final AuthenticationLocalDataSource _localDataSource;

  AuthenticationRepository(
    this._medusaClient,
    this._localDataSource,
  );

  Future<void> login(String email, String password) async {
    try {
      final authResponse = await _medusaClient.signIn(
        AuthRequest(
          email: email,
          password: password,
        ),
      );
      _localDataSource.setToken(authResponse.token);
    } catch (e) {
      rethrow;
    }
  }
}
