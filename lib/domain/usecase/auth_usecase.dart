import 'package:injectable/injectable.dart';

import '../../data/auth_repository_impl.dart';

@injectable
class AuthUseCase {
  final AuthenticationRepository _authenticationRepository;

  AuthUseCase(
    this._authenticationRepository,
  );

  Future<void> login(
    String email,
    String password,
  ) async {
    return _authenticationRepository.login(
      email,
      password,
    );
  }
}
