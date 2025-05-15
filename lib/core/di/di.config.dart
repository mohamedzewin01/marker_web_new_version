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

import '../../features/auth/data/data_sources/auth_data_sources_repo.dart'
    as _i69;
import '../../features/auth/data/data_sources/auth_data_sources_rpo_impl.dart'
    as _i552;
import '../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i279;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/use_cases/auth_use_case.dart' as _i283;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/best_deals/data/data_sources/best_deals_data_sources.dart'
    as _i573;
import '../../features/best_deals/data/repo_impl/best_deals_repo_impl.dart'
    as _i95;
import '../../features/best_deals/domain/repo/best_deals_repo.dart' as _i988;
import '../../features/best_deals/domain/use_cases/best_deals_use_cases.dart'
    as _i148;
import '../../features/best_deals/presention/cubit/best_by_discount/best_discount_by_discount_cubit.dart'
    as _i989;
import '../../features/best_deals/presention/cubit/best_deals_categories_cubit.dart'
    as _i123;
import '../../features/cart/data/data_sources/cart_data_sources_repo.dart'
    as _i992;
import '../../features/cart/data/data_sources/cart_data_sources_repo_impl.dart'
    as _i248;
import '../../features/cart/data/repo_impl/cart_repo_impl.dart' as _i966;
import '../../features/cart/domain/repo/cart_repo.dart' as _i379;
import '../../features/cart/domain/use_cases/cart_use_case.dart' as _i886;
import '../../features/cart/presentation/cubit/address/address_cubit.dart'
    as _i499;
import '../../features/cart/presentation/cubit/cart_cubit.dart' as _i499;
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
import '../../features/order/data/data_sources/orders_data_sources_repo.dart'
    as _i74;
import '../../features/order/data/data_sources/orders_data_sources_repo_impl.dart'
    as _i981;
import '../../features/order/data/repo_impl/orders_repo_impl.dart' as _i368;
import '../../features/order/domain/repo/orders_repo.dart' as _i357;
import '../../features/order/domain/use_cases/orders_use_cases_impl.dart'
    as _i35;
import '../../features/order/presention/cubit/active_orders_cubit/active_orders_cubit.dart'
    as _i381;
import '../../features/order/presention/cubit/orders_cubit.dart' as _i548;
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
import '../uses_cases/orders/add_order_use_case_repo.dart' as _i529;

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
    gh.factory<_i69.AuthDataSourcesRepo>(
      () => _i552.AuthDataSourcesRpoImpl(gh<_i680.ApiService>()),
    );
    gh.factory<_i170.AuthRepo>(
      () => _i279.AuthRepoImpl(gh<_i69.AuthDataSourcesRepo>()),
    );
    gh.factory<_i573.BestDealsDataSources>(
      () => _i573.BestDealsDataSources(gh<_i680.ApiService>()),
    );
    gh.factory<_i426.CategoriesZoneDataSource>(
      () => _i426.CategoriesZoneDataSource(gh<_i680.ApiService>()),
    );
    gh.factory<_i645.ProductsDataSource>(
      () => _i645.ProductsDataSource(gh<_i680.ApiService>()),
    );
    gh.factory<_i283.AuthUseCase>(
      () => _i283.AuthUseCase(gh<_i170.AuthRepo>()),
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
    gh.factory<_i74.OrdersDataSourcesRepo>(
      () => _i981.OrdersDataSourcesRepoImpl(gh<_i680.ApiService>()),
    );
    gh.factory<_i148.BestDealsUseCases>(
      () => _i148.BestDealsUseCases(gh<_i988.BestDealsRepo>()),
    );
    gh.factory<_i117.AuthCubit>(() => _i117.AuthCubit(gh<_i283.AuthUseCase>()));
    gh.factory<_i280.HomeRepo>(
      () => _i886.HomeRepoImpl(gh<_i645.HomeDataSourceRepo>()),
    );
    gh.factory<_i357.OrdersRepo>(
      () => _i368.OrdersRepoImpl(gh<_i74.OrdersDataSourcesRepo>()),
    );
    gh.factory<_i992.CartDataSourcesRepo>(
      () => _i248.CartDataSourcesRepoImpl(gh<_i680.ApiService>()),
    );
    gh.factory<_i83.CategoriesZoneRepo>(
      () => _i106.CategoriesZoneRepoImpl(gh<_i426.CategoriesZoneDataSource>()),
    );
    gh.factory<_i529.AddOrderUseCaseRepo>(
      () => _i35.OrdersUseCasesImpl(gh<_i357.OrdersRepo>()),
    );
    gh.factory<_i989.BestDiscountByDiscountCubit>(
      () => _i989.BestDiscountByDiscountCubit(gh<_i148.BestDealsUseCases>()),
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
    gh.factory<_i379.CartRepo>(
      () => _i966.CartRepoImpl(gh<_i992.CartDataSourcesRepo>()),
    );
    gh.factory<_i911.ProductsCubit>(
      () => _i911.ProductsCubit(gh<_i258.ProductsUseCase>()),
    );
    gh.factory<_i381.ActiveOrdersCubit>(
      () => _i381.ActiveOrdersCubit(gh<_i529.AddOrderUseCaseRepo>()),
    );
    gh.factory<_i548.OrdersCubit>(
      () => _i548.OrdersCubit(gh<_i529.AddOrderUseCaseRepo>()),
    );
    gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit(gh<_i933.HomeUseCase>()));
    gh.factory<_i886.CartUseCase>(
      () => _i886.CartUseCase(gh<_i379.CartRepo>()),
    );
    gh.factory<_i499.AddressCubit>(
      () => _i499.AddressCubit(gh<_i886.CartUseCase>()),
    );
    gh.factory<_i499.CartCubit>(() => _i499.CartCubit(gh<_i886.CartUseCase>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
