
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthenticationLocalDataSource {
  Future<bool> setToken(String token);
  String getToken();
  bool isLoggedIn();
}

const _token = 'token';

@injectable
class AuthenticationLocalDataSourceImpl implements AuthenticationLocalDataSource {

  final SharedPreferences _preferences;

  AuthenticationLocalDataSourceImpl(this._preferences);

  @override
  String getToken() {
    return _preferences.getString(_token) ?? "";
  }

  @override
  Future<bool> setToken(String token) {
    return _preferences.setString(_token, token);
  }

  @override
  bool isLoggedIn() {
    return getToken().isNotEmpty;
  }
}