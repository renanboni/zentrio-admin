import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zentrio_admin/data/local/auth_local_data_source.dart';
import 'package:zentrio_admin/data/remote/api_key_service.dart';
import 'package:zentrio_admin/data/remote/banner_service.dart';
import 'package:zentrio_admin/data/remote/category_service.dart';
import 'package:zentrio_admin/data/remote/collection_service.dart';
import 'package:zentrio_admin/data/remote/customer_service.dart';
import 'package:zentrio_admin/data/remote/file_service.dart';
import 'package:zentrio_admin/data/remote/product_service.dart';
import 'package:zentrio_admin/data/remote/sales_channel_service.dart';
import 'package:zentrio_admin/data/remote/vendor_service.dart';
import 'package:zentrio_admin/data/vendor_repository_impl.dart';
import 'package:zentrio_admin/domain/repositories/api_key_repository.dart';
import 'package:zentrio_admin/domain/repositories/api_key_repository.dart';
import 'package:zentrio_admin/domain/repositories/banner_repository.dart';
import 'package:zentrio_admin/domain/repositories/banner_repository.dart';
import 'package:zentrio_admin/domain/repositories/category_repository.dart';
import 'package:zentrio_admin/domain/repositories/customer_repository.dart';
import 'package:zentrio_admin/domain/repositories/customer_repository.dart';
import 'package:zentrio_admin/domain/repositories/file_repository.dart';
import 'package:zentrio_admin/domain/repositories/product_repository.dart';
import 'package:zentrio_admin/domain/repositories/sales_channel_repository.dart';
import 'package:zentrio_admin/domain/repositories/sales_channel_repository.dart';

import '../../data/api_key_repository_impl.dart';
import '../../data/banner_repository_impl.dart';
import '../../data/category_repository_impl.dart';
import '../../data/collection_repository_impl.dart';
import '../../data/customer_repository_impl.dart';
import '../../data/file_repository_impl.dart';
import '../../data/preferences_repository_impl.dart';
import '../../data/product_repository_impl.dart';
import '../../data/sales_channel_repository_impl.dart';
import '../../domain/repositories/collection_repository.dart';
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

  @lazySingleton
  ApiKeyRepository get apiKeyRepository =>
      ApiKeyRepositoryImpl(getIt<ApiKeyService>());

  @lazySingleton
  CollectionRepository get collectionRepository =>
      CollectionRepositoryImpl(getIt<CollectionService>());

  @lazySingleton
  BannerRepository get bannersRepository =>
      BannerRepositoryImpl(getIt<BannerService>());

  @lazySingleton
  CustomerRepository get customerRepository =>
      CustomerRepositoryImpl(getIt<CustomerService>());

  @lazySingleton
  SalesChannelRepository get salesChannelRepository =>
      SalesChannelRepositoryImpl(getIt<SalesChannelService>());
}
