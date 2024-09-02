// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:zentrio_admin/data/auth_repository_impl.dart' as _i132;
import 'package:zentrio_admin/data/interceptors/auth_interceptor.dart' as _i660;
import 'package:zentrio_admin/data/local/auth_local_data_source.dart' as _i671;
import 'package:zentrio_admin/data/remote/medusa_client.dart' as _i873;
import 'package:zentrio_admin/di/modules/data_module.dart' as _i555;
import 'package:zentrio_admin/di/modules/network_module.dart' as _i184;
import 'package:zentrio_admin/domain/usecase/auth_usecase.dart' as _i620;
import 'package:zentrio_admin/presentation/features/dashboard/side_bar_controller.dart'
    as _i857;
import 'package:zentrio_admin/presentation/features/login/login_view_model.dart'
    as _i939;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dataModule = _$DataModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => dataModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i873.MedusaClient>(() => networkModule.medusaClient);
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i857.SideBarController>(() => _i857.SideBarController());
    gh.lazySingleton<_i671.AuthenticationLocalDataSource>(
        () => dataModule.medusaClient);
    gh.lazySingleton<_i660.AuthInterceptor>(() => _i660.AuthInterceptor(
        authLocalDataSource: gh<_i671.AuthenticationLocalDataSource>()));
    gh.lazySingleton<_i132.AuthenticationRepository>(
        () => _i132.AuthenticationRepository(
              gh<_i873.MedusaClient>(),
              gh<_i671.AuthenticationLocalDataSource>(),
            ));
    gh.factory<_i671.AuthenticationLocalDataSourceImpl>(() =>
        _i671.AuthenticationLocalDataSourceImpl(gh<_i460.SharedPreferences>()));
    gh.factory<_i620.AuthUseCase>(
        () => _i620.AuthUseCase(gh<_i132.AuthenticationRepository>()));
    gh.factory<_i939.LoginViewModel>(
        () => _i939.LoginViewModel(gh<_i620.AuthUseCase>()));
    return this;
  }
}

class _$DataModule extends _i555.DataModule {}

class _$NetworkModule extends _i184.NetworkModule {}
