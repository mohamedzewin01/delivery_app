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
import '../../features/home/data/data_sources/home_data_source_repo.dart'
    as _i645;
import '../../features/home/data/data_sources/home_data_source_repo_impl.dart'
    as _i985;
import '../../features/home/data/repo_impl/home_repo_impl.dart' as _i886;
import '../../features/home/domain/repo/home_repo.dart' as _i280;
import '../../features/home/domain/usecases/home_usecase_repo.dart' as _i355;
import '../../features/home/domain/usecases/home_usecase_repo_impl.dart'
    as _i465;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../../features/order_details/data/datasources/order_details_datasource_repo.dart'
    as _i435;
import '../../features/order_details/data/datasources/order_details_datasource_repo_impl.dart'
    as _i585;
import '../../features/order_details/data/repositories_impl/order_details_repo_impl.dart'
    as _i615;
import '../../features/order_details/domain/repositories/order_details_repository.dart'
    as _i304;
import '../../features/order_details/domain/usecases/order_details_usecase_repo.dart'
    as _i489;
import '../../features/order_details/domain/usecases/order_details_usecase_repo_impl.dart'
    as _i719;
import '../../features/order_details/presentation/bloc/order_details_cubit.dart'
    as _i541;
import '../../features/orders_completed/data/datasources/orders_completed_datasource_repo.dart'
    as _i282;
import '../../features/orders_completed/data/datasources/orders_completed_datasource_repo_impl.dart'
    as _i1066;
import '../../features/orders_completed/data/repositories_impl/orders_completed_repo_impl.dart'
    as _i801;
import '../../features/orders_completed/domain/repositories/orders_completed_repository.dart'
    as _i539;
import '../../features/orders_completed/domain/useCases/orders_completed_useCase_repo.dart'
    as _i693;
import '../../features/orders_completed/domain/useCases/orders_completed_useCase_repo_impl.dart'
    as _i166;
import '../../features/orders_completed/presentation/bloc/orders_completed_cubit.dart'
    as _i977;
import '../../features/test/data/datasources/test_datasource_repo.dart'
    as _i539;
import '../../features/test/data/datasources/test_datasource_repo_impl.dart'
    as _i28;
import '../../features/test/data/repositories_impl/test_repo_impl.dart'
    as _i515;
import '../../features/test/domain/repositories/test_repository.dart' as _i403;
import '../../features/test/domain/usecases/test_usecase_repo.dart' as _i53;
import '../../features/test/domain/usecases/test_usecase_repo_impl.dart'
    as _i352;
import '../../features/test/presentation/bloc/test_cubit.dart' as _i190;
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
    gh.factory<_i190.TestCubit>(() => _i190.TestCubit());
    gh.lazySingleton<_i361.Dio>(() => dioModule.providerDio());
    gh.factory<_i680.ApiService>(() => _i680.ApiService(gh<_i361.Dio>()));
    gh.factory<_i403.TestRepository>(() => _i515.TestRepositoryImpl());
    gh.factory<_i435.OrderDetailsDatasourceRepo>(
      () => _i585.OrderDetailsDatasourceRepoImpl(gh<_i680.ApiService>()),
    );
    gh.factory<_i304.OrderDetailsRepository>(
      () => _i615.OrderDetailsRepositoryImpl(
        gh<_i435.OrderDetailsDatasourceRepo>(),
      ),
    );
    gh.factory<_i645.HomeDataSourceRepo>(
      () => _i985.HomeDataSourceRepoImpl(gh<_i680.ApiService>()),
    );
    gh.factory<_i280.HomeRepo>(
      () => _i886.HomeRepoImpl(gh<_i645.HomeDataSourceRepo>()),
    );
    gh.factory<_i489.OrderDetailsUseCaseRepo>(
      () => _i719.OrderDetailsUseCase(gh<_i304.OrderDetailsRepository>()),
    );
    gh.factory<_i539.TestDatasourceRepo>(
      () => _i28.TestDatasourceRepoImpl(gh<_i680.ApiService>()),
    );
    gh.factory<_i282.OrdersCompletedDatasourceRepo>(
      () => _i1066.OrdersCompletedDatasourceRepoImpl(gh<_i680.ApiService>()),
    );
    gh.factory<_i53.TestUseCaseRepo>(
      () => _i352.TestUseCase(gh<_i403.TestRepository>()),
    );
    gh.factory<_i69.AuthDataSourcesRepo>(
      () => _i552.AuthDataSourcesRpoImpl(gh<_i680.ApiService>()),
    );
    gh.factory<_i539.OrdersCompletedRepository>(
      () => _i801.OrdersCompletedRepositoryImpl(
        gh<_i282.OrdersCompletedDatasourceRepo>(),
      ),
    );
    gh.factory<_i693.OrdersCompletedUseCaseRepo>(
      () => _i166.OrdersCompletedUseCase(gh<_i539.OrdersCompletedRepository>()),
    );
    gh.factory<_i355.HomeUseCaseRepo>(
      () => _i465.HomeUseCase(gh<_i280.HomeRepo>()),
    );
    gh.factory<_i977.OrdersCompletedCubit>(
      () => _i977.OrdersCompletedCubit(gh<_i693.OrdersCompletedUseCaseRepo>()),
    );
    gh.factory<_i541.OrderDetailsCubit>(
      () => _i541.OrderDetailsCubit(gh<_i489.OrderDetailsUseCaseRepo>()),
    );
    gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit(gh<_i355.HomeUseCaseRepo>()));
    gh.factory<_i170.AuthRepo>(
      () => _i279.AuthRepoImpl(gh<_i69.AuthDataSourcesRepo>()),
    );
    gh.factory<_i283.AuthUseCase>(
      () => _i283.AuthUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i117.AuthCubit>(() => _i117.AuthCubit(gh<_i283.AuthUseCase>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
