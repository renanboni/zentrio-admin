import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:zentrio_admin/data/remote/api_key_service.dart';
import 'package:zentrio_admin/data/remote/auth_service.dart';
import 'package:zentrio_admin/data/remote/banner_service.dart';
import 'package:zentrio_admin/data/remote/category_service.dart';
import 'package:zentrio_admin/data/remote/collection_service.dart';
import 'package:zentrio_admin/data/remote/file_service.dart';
import 'package:zentrio_admin/data/remote/product_service.dart';
import 'package:zentrio_admin/data/remote/vendor_service.dart';
import 'package:zentrio_admin/di/init.dart';

import '../../data/interceptors/auth_interceptor.dart';
import '../../data/remote/customer_service.dart';
import '../../data/remote/sales_channel_service.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  AuthService get authService => AuthService(getIt<Dio>(instanceName: 'unauthenticated'));

  @lazySingleton
  VendorService get vendorService => VendorService(getIt<Dio>(instanceName: 'authenticated'));

  @lazySingleton
  ProductService get productService => ProductService(getIt<Dio>(instanceName: 'authenticated'));

  @lazySingleton
  CategoryService get categoryService => CategoryService(getIt<Dio>(instanceName: 'authenticated'));

  @lazySingleton
  CollectionService get collectionService => CollectionService(getIt<Dio>(instanceName: 'authenticated'));

  @lazySingleton
  FileService get fileService => FileService(getIt<Dio>(instanceName: 'authenticated'));

  @lazySingleton
  ApiKeyService get apiKeyService => ApiKeyService(getIt<Dio>(instanceName: 'authenticated'));

  @lazySingleton
  BannerService get bannerService => BannerService(getIt<Dio>(instanceName: 'authenticated'));

  @lazySingleton
  CustomerService get customerService => CustomerService(getIt<Dio>(instanceName: 'authenticated'));

  @lazySingleton
  SalesChannelService get salesChannelService => SalesChannelService(getIt<Dio>(instanceName: 'authenticated'));

  final Interceptor _loggerInterceptor = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: false,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  );

  @Named("unauthenticated")
  @lazySingleton
  Dio get unauthenticatedDio => Dio(
    BaseOptions(
        baseUrl: kIsWeb ? 'http://localhost:9000' : 'http://10.0.2.2:9000'),
  )..interceptors.addAll(
    [
      _loggerInterceptor,
    ],
  );

  @Named("authenticated")
  @lazySingleton
  Dio get authenticatedDio => Dio(
        BaseOptions(
            baseUrl: kIsWeb ? 'http://localhost:9000' : 'http://10.0.2.2:9000'),
      )..interceptors.addAll(
          [
            getIt<AuthInterceptor>(),
            _loggerInterceptor,
          ],
        );
}
