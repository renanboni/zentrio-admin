import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:zentrio_admin/data/remote/medusa_client.dart';
import 'package:zentrio_admin/di/init.dart';

@module
abstract class NetworkModule {

  @lazySingleton
  MedusaClient get medusaClient => MedusaClient(getIt<Dio>());

  final Interceptor _loggerInterceptor = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: false,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  );

  @lazySingleton
  Dio get dio => Dio()..interceptors.add(_loggerInterceptor);
}
