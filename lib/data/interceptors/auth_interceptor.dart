import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zentrio_admin/data/local/auth_local_data_source.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final AuthenticationLocalDataSource authLocalDataSource;

  AuthInterceptor({required this.authLocalDataSource});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String jwtToken = authLocalDataSource.getToken();

    if (jwtToken.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $jwtToken";
    }

    return handler.next(options);
  }
}
