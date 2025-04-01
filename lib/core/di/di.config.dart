// dart format width=80
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

import '../../features/best_deals/data/data_sources/best_deals_data_sources.dart'
    as _i573;
import '../../features/best_deals/data/repo_impl/best_deals_repo_impl.dart'
    as _i95;
import '../../features/best_deals/domain/repo/best_deals_repo.dart' as _i988;
import '../../features/best_deals/domain/use_cases/best_deals_use_cases.dart'
    as _i148;
import '../../features/best_deals/presention/cubit/best_deals_categories_cubit.dart'
    as _i123;
import '../../features/categories/data/data_sources/categorieS_zone_data_sourse.dart'
    as _i426;
import '../../features/categories/data/repo_impl/categories_zone_repo_impl.dart'
    as _i106;
import '../../features/categories/domain/repo/category_zone_repo.dart' as _i83;
import '../../features/categories/domain/use_cases/categoriesUseCase.dart'
    as _i388;
import '../../features/categories/presentation/cubit/categories_cubit.dart'
    as _i802;
import '../../features/home/data/data_sources/home_data_source_repo.dart'
    as _i645;
import '../../features/home/data/data_sources/home_data_source_repo_impl.dart'
    as _i985;
import '../../features/home/data/repo_impl/home_repo_impl.dart' as _i886;
import '../../features/home/domain/repo/home_repo.dart' as _i280;
import '../../features/home/domain/use_cases/home_use_case.dart' as _i933;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../../features/products/data/data_sources/products_data_source.dart'
    as _i645;
import '../../features/products/data/repo_impl/products_repo_impl.dart'
    as _i249;
import '../../features/products/domain/repo/products_repo.dart' as _i482;
import '../../features/products/domain/use_cases/products_use_case.dart'
    as _i258;
import '../../features/products/presentation/cubit/products_cubit.dart'
    as _i911;
import '../api/api_manager/api_manager.dart' as _i680;
import '../api/dio_module.dart' as _i784;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.providerDio());
    gh.factory<_i680.ApiService>(() => _i680.ApiService(gh<_i361.Dio>()));
    gh.factory<_i426.CategoriesZoneDataSource>(
      () => _i426.CategoriesZoneDataSource(gh<_i680.ApiService>()),
    );
    gh.factory<_i645.ProductsDataSource>(
      () => _i645.ProductsDataSource(gh<_i680.ApiService>()),
    );
    gh.factory<_i573.BestDealsDataSources>(
      () => _i573.BestDealsDataSources(gh<_i680.ApiService>()),
    );
    gh.factory<_i988.BestDealsRepo>(
      () => _i95.BestDealsRepoImpl(gh<_i573.BestDealsDataSources>()),
    );
    gh.factory<_i645.HomeDataSourceRepo>(
      () => _i985.HomeDataSourceRepoImpl(gh<_i680.ApiService>()),
    );
    gh.factory<_i482.ProductsRepo>(
      () => _i249.ProductsRepoImpl(gh<_i645.ProductsDataSource>()),
    );
    gh.factory<_i148.BestDealsUseCases>(
      () => _i148.BestDealsUseCases(gh<_i988.BestDealsRepo>()),
    );
    gh.factory<_i280.HomeRepo>(
      () => _i886.HomeRepoImpl(gh<_i645.HomeDataSourceRepo>()),
    );
    gh.factory<_i83.CategoriesZoneRepo>(
      () => _i106.CategoriesZoneRepoImpl(gh<_i426.CategoriesZoneDataSource>()),
    );
    gh.factory<_i123.BestDealsCategoriesCubit>(
      () => _i123.BestDealsCategoriesCubit(gh<_i148.BestDealsUseCases>()),
    );
    gh.factory<_i388.CategoriesZoneUseCase>(
      () => _i388.CategoriesZoneUseCase(gh<_i83.CategoriesZoneRepo>()),
    );
    gh.factory<_i258.ProductsUseCase>(
      () => _i258.ProductsUseCase(gh<_i482.ProductsRepo>()),
    );
    gh.factory<_i933.HomeUseCase>(
      () => _i933.HomeUseCase(gh<_i280.HomeRepo>()),
    );
    gh.factory<_i802.CategoriesCubit>(
      () => _i802.CategoriesCubit(gh<_i388.CategoriesZoneUseCase>()),
    );
    gh.factory<_i911.ProductsCubit>(
      () => _i911.ProductsCubit(gh<_i258.ProductsUseCase>()),
    );
    gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit(gh<_i933.HomeUseCase>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
