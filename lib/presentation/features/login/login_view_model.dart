import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/domain/usecase/auth_usecase.dart';

@injectable
class LoginViewModel {
  final AuthUseCase _authUseCase;

  LoginViewModel(
    this._authUseCase,
  );

  void login(
    String email,
    String password,
    VoidCallback onSuccess,
    VoidCallback onError,
  ) async {
    try {
      await _authUseCase.login(email, password);
      onSuccess();
    } catch (e) {
      onError();
    }
  }
}
