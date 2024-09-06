import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/domain/models/user_type.dart';

import '../../data/auth_repository_impl.dart';

@injectable
class AuthUseCase {
  final AuthenticationRepository _authenticationRepository;

  AuthUseCase(
    this._authenticationRepository,
  );

  Future<void> login(
    bool admin,
    String email,
    String password,
  ) async {
    return _authenticationRepository.login(
      admin,
      email,
      password,
    );
  }

  UserType getUserType() {
    return _authenticationRepository.getUserType();
  }
}
