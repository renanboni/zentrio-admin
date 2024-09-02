
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zentrio_admin/data/local/auth_local_data_source.dart';
import 'package:zentrio_admin/data/remote/vendor_service.dart';
import 'package:zentrio_admin/data/vendor_repository_impl.dart';

import '../../domain/repositories/vendor_repository.dart';
import '../init.dart';

@module
abstract class DataModule {

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  AuthenticationLocalDataSource get medusaClient => AuthenticationLocalDataSourceImpl(getIt<SharedPreferences>());

  @lazySingleton
  VendorRepository get vendorRepository => VendorRepositoryImpl(getIt<VendorService>());
}
