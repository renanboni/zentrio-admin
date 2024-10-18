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
import 'package:zentrio_admin/data/file_repository_impl.dart' as _i774;
import 'package:zentrio_admin/data/interceptors/auth_interceptor.dart' as _i660;
import 'package:zentrio_admin/data/local/auth_local_data_source.dart' as _i671;
import 'package:zentrio_admin/data/remote/api_key_service.dart' as _i216;
import 'package:zentrio_admin/data/remote/auth_service.dart' as _i311;
import 'package:zentrio_admin/data/remote/banner_service.dart' as _i641;
import 'package:zentrio_admin/data/remote/category_service.dart' as _i676;
import 'package:zentrio_admin/data/remote/collection_service.dart' as _i658;
import 'package:zentrio_admin/data/remote/customer_service.dart' as _i774;
import 'package:zentrio_admin/data/remote/file_service.dart' as _i1013;
import 'package:zentrio_admin/data/remote/product_service.dart' as _i134;
import 'package:zentrio_admin/data/remote/vendor_service.dart' as _i451;
import 'package:zentrio_admin/di/modules/data_module.dart' as _i555;
import 'package:zentrio_admin/di/modules/network_module.dart' as _i184;
import 'package:zentrio_admin/domain/repositories/api_key_repository.dart'
    as _i830;
import 'package:zentrio_admin/domain/repositories/banner_repository.dart'
    as _i1069;
import 'package:zentrio_admin/domain/repositories/category_repository.dart'
    as _i785;
import 'package:zentrio_admin/domain/repositories/collection_repository.dart'
    as _i612;
import 'package:zentrio_admin/domain/repositories/customer_repository.dart'
    as _i204;
import 'package:zentrio_admin/domain/repositories/file_repository.dart'
    as _i182;
import 'package:zentrio_admin/domain/repositories/preferences_repository.dart'
    as _i789;
import 'package:zentrio_admin/domain/repositories/product_repository.dart'
    as _i999;
import 'package:zentrio_admin/domain/repositories/vendor_repository.dart'
    as _i74;
import 'package:zentrio_admin/domain/usecase/api_key_usecase.dart' as _i116;
import 'package:zentrio_admin/domain/usecase/auth_usecase.dart' as _i620;
import 'package:zentrio_admin/domain/usecase/banner_usecase.dart' as _i725;
import 'package:zentrio_admin/domain/usecase/category_usecase.dart' as _i311;
import 'package:zentrio_admin/domain/usecase/collection_use_case.dart' as _i464;
import 'package:zentrio_admin/domain/usecase/customer_usecase.dart' as _i340;
import 'package:zentrio_admin/domain/usecase/file_usecase.dart' as _i850;
import 'package:zentrio_admin/domain/usecase/product_usecase.dart' as _i977;
import 'package:zentrio_admin/domain/usecase/vendor_usecase.dart' as _i97;
import 'package:zentrio_admin/presentation/features/banners/banners_view_model.dart'
    as _i330;
import 'package:zentrio_admin/presentation/features/banners/create/create_banner_view_model.dart'
    as _i986;
import 'package:zentrio_admin/presentation/features/categories/categories_view_model.dart'
    as _i722;
import 'package:zentrio_admin/presentation/features/categories/create/create_category_view_model.dart'
    as _i1019;
import 'package:zentrio_admin/presentation/features/category/category_view_model.dart'
    as _i943;
import 'package:zentrio_admin/presentation/features/category/edit/category_edit_view_model.dart'
    as _i632;
import 'package:zentrio_admin/presentation/features/collection/collection_view_model.dart'
    as _i864;
import 'package:zentrio_admin/presentation/features/collections/collections_view_model.dart'
    as _i255;
import 'package:zentrio_admin/presentation/features/collections/create/create_collection_view_model.dart'
    as _i440;
import 'package:zentrio_admin/presentation/features/customers/customers_view_model.dart'
    as _i611;
import 'package:zentrio_admin/presentation/features/dashboard/side_bar_controller.dart'
    as _i857;
import 'package:zentrio_admin/presentation/features/dashboard/vendors/vendors_view_model.dart'
    as _i149;
import 'package:zentrio_admin/presentation/features/login/login_view_model.dart'
    as _i939;
import 'package:zentrio_admin/presentation/features/product/edit/product_edit_view_model.dart'
    as _i137;
import 'package:zentrio_admin/presentation/features/product/metadata/product_metadata_view_model.dart'
    as _i922;
import 'package:zentrio_admin/presentation/features/product/options/create_product_option_view_model.dart'
    as _i462;
import 'package:zentrio_admin/presentation/features/product/organization/product_organization_view_model.dart'
    as _i790;
import 'package:zentrio_admin/presentation/features/product/product_view_model.dart'
    as _i1010;
import 'package:zentrio_admin/presentation/features/product/variants/create/product_create_variants_view_model.dart'
    as _i264;
import 'package:zentrio_admin/presentation/features/productAttributes/product_attributes_view_model.dart'
    as _i740;
import 'package:zentrio_admin/presentation/features/products/create/create_product_viewmodel.dart'
    as _i531;
import 'package:zentrio_admin/presentation/features/products/products_view_model.dart'
    as _i91;
import 'package:zentrio_admin/presentation/features/productTag/product_tag_view_model.dart'
    as _i471;
import 'package:zentrio_admin/presentation/features/productTags/product_tags_view_model.dart'
    as _i93;
import 'package:zentrio_admin/presentation/features/productType/edit/edit_product_type_view_model.dart'
    as _i163;
import 'package:zentrio_admin/presentation/features/productType/product_type_view_model.dart'
    as _i864;
import 'package:zentrio_admin/presentation/features/productTypes/create/create_product_type_view_model.dart'
    as _i214;
import 'package:zentrio_admin/presentation/features/productTypes/product_types_view_model.dart'
    as _i633;
import 'package:zentrio_admin/presentation/features/ranking/ranking_view_model.dart'
    as _i473;
import 'package:zentrio_admin/presentation/features/vendor/vendor_view_model.dart'
    as _i78;

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
    gh.lazySingleton<_i134.ProductService>(() => networkModule.productService);
    gh.lazySingleton<_i676.CategoryService>(
        () => networkModule.categoryService);
    gh.lazySingleton<_i658.CollectionService>(
        () => networkModule.collectionService);
    gh.lazySingleton<_i1013.FileService>(() => networkModule.fileService);
    gh.lazySingleton<_i216.ApiKeyService>(() => networkModule.apiKeyService);
    gh.lazySingleton<_i641.BannerService>(() => networkModule.bannerService);
    gh.lazySingleton<_i774.CustomerService>(
        () => networkModule.customerService);
    gh.lazySingleton<_i671.AuthenticationLocalDataSource>(
        () => dataModule.medusaClient);
    gh.lazySingleton<_i74.VendorRepository>(() => dataModule.vendorRepository);
    gh.lazySingleton<_i999.ProductRepository>(
        () => dataModule.productRepository);
    gh.lazySingleton<_i785.CategoryRepository>(
        () => dataModule.categoryRepository);
    gh.lazySingleton<_i789.PreferencesRepository>(
        () => dataModule.preferencesRepository);
    gh.lazySingleton<_i182.FileRepository>(() => dataModule.fileRepository);
    gh.lazySingleton<_i830.ApiKeyRepository>(() => dataModule.apiKeyRepository);
    gh.lazySingleton<_i612.CollectionRepository>(
        () => dataModule.collectionRepository);
    gh.lazySingleton<_i1069.BannerRepository>(
        () => dataModule.bannersRepository);
    gh.lazySingleton<_i204.CustomerRepository>(
        () => dataModule.customerRepository);
    gh.lazySingleton<_i660.AuthInterceptor>(() => _i660.AuthInterceptor(
        authLocalDataSource: gh<_i671.AuthenticationLocalDataSource>()));
    gh.factory<_i340.CustomerUseCase>(
        () => _i340.CustomerUseCase(gh<_i204.CustomerRepository>()));
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.unauthenticatedDio,
      instanceName: 'unauthenticated',
    );
    gh.factory<_i311.CategoryUseCase>(
        () => _i311.CategoryUseCase(gh<_i785.CategoryRepository>()));
    gh.factory<_i464.CollectionUseCase>(
        () => _i464.CollectionUseCase(gh<_i612.CollectionRepository>()));
    gh.factory<_i725.BannerUseCase>(
        () => _i725.BannerUseCase(gh<_i1069.BannerRepository>()));
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.authenticatedDio,
      instanceName: 'authenticated',
    );
    gh.factory<_i864.CollectionViewModel>(
        () => _i864.CollectionViewModel(gh<_i464.CollectionUseCase>()));
    gh.factory<_i255.CollectionsViewModel>(
        () => _i255.CollectionsViewModel(gh<_i464.CollectionUseCase>()));
    gh.factory<_i440.CreateCollectionViewModel>(
        () => _i440.CreateCollectionViewModel(gh<_i464.CollectionUseCase>()));
    gh.factory<_i850.FileUseCase>(
        () => _i850.FileUseCase(gh<_i182.FileRepository>()));
    gh.factory<_i977.ProductUseCase>(
        () => _i977.ProductUseCase(gh<_i999.ProductRepository>()));
    gh.factory<_i116.ApiKeyUseCase>(
        () => _i116.ApiKeyUseCase(gh<_i830.ApiKeyRepository>()));
    gh.factory<_i473.RankingViewModel>(
        () => _i473.RankingViewModel(gh<_i311.CategoryUseCase>()));
    gh.factory<_i943.CategoryViewModel>(
        () => _i943.CategoryViewModel(gh<_i311.CategoryUseCase>()));
    gh.factory<_i632.CategoryEditViewModel>(
        () => _i632.CategoryEditViewModel(gh<_i311.CategoryUseCase>()));
    gh.factory<_i722.CategoriesViewModel>(
        () => _i722.CategoriesViewModel(gh<_i311.CategoryUseCase>()));
    gh.factory<_i1019.CreateCategoryViewModel>(
        () => _i1019.CreateCategoryViewModel(gh<_i311.CategoryUseCase>()));
    gh.factory<_i671.AuthenticationLocalDataSourceImpl>(() =>
        _i671.AuthenticationLocalDataSourceImpl(gh<_i460.SharedPreferences>()));
    gh.factory<_i97.VendorUseCase>(
        () => _i97.VendorUseCase(gh<_i74.VendorRepository>()));
    gh.factory<_i986.CreateBannerViewModel>(
        () => _i986.CreateBannerViewModel(gh<_i725.BannerUseCase>()));
    gh.factory<_i330.BannersViewModel>(
        () => _i330.BannersViewModel(gh<_i725.BannerUseCase>()));
    gh.factory<_i611.CustomersViewModel>(
        () => _i611.CustomersViewModel(gh<_i340.CustomerUseCase>()));
    gh.lazySingleton<_i132.AuthenticationRepository>(
        () => _i132.AuthenticationRepository(
              gh<_i311.AuthService>(),
              gh<_i671.AuthenticationLocalDataSource>(),
            ));
    gh.factory<_i531.CreateProductViewModel>(() => _i531.CreateProductViewModel(
          gh<_i977.ProductUseCase>(),
          gh<_i850.FileUseCase>(),
          gh<_i311.CategoryUseCase>(),
          gh<_i464.CollectionUseCase>(),
        ));
    gh.factory<_i78.VendorViewModel>(() => _i78.VendorViewModel(
          gh<_i97.VendorUseCase>(),
          gh<_i116.ApiKeyUseCase>(),
        ));
    gh.lazySingleton<_i774.FileRepositoryImpl>(
        () => _i774.FileRepositoryImpl(gh<_i1013.FileService>()));
    gh.factory<_i790.ProductOrganizationViewModel>(
        () => _i790.ProductOrganizationViewModel(
              gh<_i464.CollectionUseCase>(),
              gh<_i311.CategoryUseCase>(),
              gh<_i977.ProductUseCase>(),
            ));
    gh.factory<_i620.AuthUseCase>(
        () => _i620.AuthUseCase(gh<_i132.AuthenticationRepository>()));
    gh.factory<_i149.VendorsViewModel>(
        () => _i149.VendorsViewModel(gh<_i97.VendorUseCase>()));
    gh.factory<_i939.LoginViewModel>(
        () => _i939.LoginViewModel(gh<_i620.AuthUseCase>()));
    gh.factory<_i91.ProductsViewModel>(
        () => _i91.ProductsViewModel(gh<_i977.ProductUseCase>()));
    gh.factory<_i462.CreateProductOptionViewModel>(
        () => _i462.CreateProductOptionViewModel(gh<_i977.ProductUseCase>()));
    gh.factory<_i264.ProductCreateVariantsViewModel>(
        () => _i264.ProductCreateVariantsViewModel(gh<_i977.ProductUseCase>()));
    gh.factory<_i137.ProductEditViewModel>(
        () => _i137.ProductEditViewModel(gh<_i977.ProductUseCase>()));
    gh.factory<_i1010.ProductViewModel>(
        () => _i1010.ProductViewModel(gh<_i977.ProductUseCase>()));
    gh.factory<_i922.ProductMetadataViewModel>(
        () => _i922.ProductMetadataViewModel(gh<_i977.ProductUseCase>()));
    gh.factory<_i740.ProductAttributesViewModel>(
        () => _i740.ProductAttributesViewModel(gh<_i977.ProductUseCase>()));
    gh.factory<_i633.ProductTypesViewModel>(
        () => _i633.ProductTypesViewModel(gh<_i977.ProductUseCase>()));
    gh.factory<_i214.CreateProductTypeViewModel>(
        () => _i214.CreateProductTypeViewModel(gh<_i977.ProductUseCase>()));
    gh.factory<_i864.ProductTypeViewModel>(
        () => _i864.ProductTypeViewModel(gh<_i977.ProductUseCase>()));
    gh.factory<_i163.EditProductTypeViewModel>(
        () => _i163.EditProductTypeViewModel(gh<_i977.ProductUseCase>()));
    gh.factory<_i93.ProductTagsViewModel>(
        () => _i93.ProductTagsViewModel(gh<_i977.ProductUseCase>()));
    gh.factory<_i471.ProductTagViewModel>(
        () => _i471.ProductTagViewModel(gh<_i977.ProductUseCase>()));
    gh.lazySingleton<_i857.DashboardViewModel>(() => _i857.DashboardViewModel(
          gh<_i620.AuthUseCase>(),
          gh<_i97.VendorUseCase>(),
        ));
    return this;
  }
}

class _$DataModule extends _i555.DataModule {}

class _$NetworkModule extends _i184.NetworkModule {}
