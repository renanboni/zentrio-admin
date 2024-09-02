
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zentrio_admin/data/local/auth_local_data_source.dart';

import '../init.dart';

@module
abstract class DataModule {

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  AuthenticationLocalDataSource get medusaClient => AuthenticationLocalDataSourceImpl(getIt<SharedPreferences>());
}
