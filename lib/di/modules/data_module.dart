import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zentrio_admin/data/local/auth_local_data_source.dart';
import 'package:zentrio_admin/data/remote/category_service.dart';
import 'package:zentrio_admin/data/remote/file_service.dart';
import 'package:zentrio_admin/data/remote/product_service.dart';
import 'package:zentrio_admin/data/remote/vendor_service.dart';
import 'package:zentrio_admin/data/vendor_repository_impl.dart';
import 'package:zentrio_admin/domain/repositories/category_repository.dart';
import 'package:zentrio_admin/domain/repositories/category_repository.dart';
import 'package:zentrio_admin/domain/repositories/file_repository.dart';
import 'package:zentrio_admin/domain/repositories/product_repository.dart';

import '../../data/category_repository_impl.dart';
import '../../data/file_repository_impl.dart';
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
  CategoryRepository get categoryRepository =>
      CategoryRepositoryImpl(getIt<CategoryService>());

  @lazySingleton
  PreferencesRepository get preferencesRepository =>
      PreferencesRepositoryImpl(getIt<SharedPreferences>());

  @lazySingleton
  FileRepository get fileRepository =>
      FileRepositoryImpl(getIt<FileService>());
}
