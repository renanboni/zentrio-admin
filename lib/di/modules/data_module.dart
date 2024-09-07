import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zentrio_admin/data/local/auth_local_data_source.dart';
import 'package:zentrio_admin/data/remote/product_service.dart';
import 'package:zentrio_admin/data/remote/vendor_service.dart';
import 'package:zentrio_admin/data/vendor_repository_impl.dart';
import 'package:zentrio_admin/domain/repositories/product_repository.dart';

import '../../data/preferences_repository_impl.dart';
import '../../data/product_repository_impl.dart';
import '../../domain/repositories/preferences_repository.dart';
import '../../domain/repositories/vendor_repository.dart';
import '../init.dart';

@module
abstract class DataModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  AuthenticationLocalDataSource get medusaClient =>
      AuthenticationLocalDataSourceImpl(getIt<SharedPreferences>());

  @lazySingleton
  VendorRepository get vendorRepository =>
      VendorRepositoryImpl(getIt<VendorService>());

  @lazySingleton
  ProductRepository get productRepository =>
      ProductRepositoryImpl(getIt<ProductService>());

  @lazySingleton
  PreferencesRepository get preferencesRepository =>
      PreferencesRepositoryImpl(getIt<SharedPreferences>());
}
