import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/data/remote/medusa_client.dart';

import 'models/req/auth_req.dart';

@lazySingleton
class AuthenticationRepository {
  final MedusaClient _medusaClient;

  AuthenticationRepository(
    this._medusaClient,
  );

  Future<void> login(String email, String password) {
    try {
      return _medusaClient.signIn(
        AuthRequest(
          email: email,
          password: password,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
