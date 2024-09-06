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
import 'package:zentrio_admin/data/remote/auth_service.dart' as _i311;
import 'package:zentrio_admin/data/remote/vendor_service.dart' as _i451;
import 'package:zentrio_admin/di/modules/data_module.dart' as _i555;
import 'package:zentrio_admin/di/modules/network_module.dart' as _i184;
import 'package:zentrio_admin/domain/repositories/vendor_repository.dart'
    as _i74;
import 'package:zentrio_admin/domain/usecase/auth_usecase.dart' as _i620;
import 'package:zentrio_admin/domain/usecase/vendor_usecase.dart' as _i97;
import 'package:zentrio_admin/presentation/features/dashboard/side_bar_controller.dart'
    as _i857;
import 'package:zentrio_admin/presentation/features/dashboard/vendor/vendors_controller.dart'
    as _i60;
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
    gh.lazySingleton<_i311.AuthService>(() => networkModule.authService);
    gh.lazySingleton<_i451.VendorService>(() => networkModule.vendorService);
    gh.lazySingleton<_i671.AuthenticationLocalDataSource>(
        () => dataModule.medusaClient);
    gh.lazySingleton<_i74.VendorRepository>(() => dataModule.vendorRepository);
    gh.lazySingleton<_i660.AuthInterceptor>(() => _i660.AuthInterceptor(
        authLocalDataSource: gh<_i671.AuthenticationLocalDataSource>()));
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.unauthenticatedDio,
      instanceName: 'unauthenticated',
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.authenticatedDio,
      instanceName: 'authenticated',
    );
    gh.factory<_i671.AuthenticationLocalDataSourceImpl>(() =>
        _i671.AuthenticationLocalDataSourceImpl(gh<_i460.SharedPreferences>()));
    gh.factory<_i97.VendorUseCase>(
        () => _i97.VendorUseCase(gh<_i74.VendorRepository>()));
    gh.lazySingleton<_i132.AuthenticationRepository>(
        () => _i132.AuthenticationRepository(
              gh<_i311.AuthService>(),
              gh<_i671.AuthenticationLocalDataSource>(),
            ));
    gh.factory<_i620.AuthUseCase>(
        () => _i620.AuthUseCase(gh<_i132.AuthenticationRepository>()));
    gh.factory<_i60.VendorsController>(
        () => _i60.VendorsController(gh<_i97.VendorUseCase>()));
    gh.factory<_i939.LoginViewModel>(
        () => _i939.LoginViewModel(gh<_i620.AuthUseCase>()));
    gh.lazySingleton<_i857.DashboardViewModel>(() => _i857.DashboardViewModel(
          gh<_i620.AuthUseCase>(),
          gh<_i97.VendorUseCase>(),
        ));
    return this;
  }
}

class _$DataModule extends _i555.DataModule {}

class _$NetworkModule extends _i184.NetworkModule {}
