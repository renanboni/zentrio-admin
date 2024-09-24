
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zentrio_admin/domain/models/user_type.dart';

abstract class AuthenticationLocalDataSource {
  Future<bool> setToken(String token);
  String getToken();
  Future<bool> setUserType(UserType userType);
  UserType getUserType();
  bool isLoggedIn();
}

const _token = 'token';
const _userType = 'userType';

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

  @override
  UserType getUserType() {
    final userType = _preferences.getString(_userType);
    if (userType == UserType.user.name) {
      return UserType.user;
    } else if (userType == UserType.vendor.name) {
      return UserType.vendor;
    } else {
      return UserType.none;
    }
  }

  @override
  Future<bool> setUserType(UserType userType) {
    return _preferences.setString(_userType, userType.name);
  }
}