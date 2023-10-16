import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ebla/presentations/features/rent/blocs/default_bloc/rent_default_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/newtwok/app_api.dart';
import '../data/newtwok/dio_factory.dart';
import '../data/newtwok/network_info.dart';
import '../data/repository/repository_implementer.dart';
import '../domain/repository/repository.dart';
import '../domain/usecases/usecases.dart';
import '../presentations/features/rent/blocs/certificate_contract_bloc/certificate_contract_bloc.dart';
import '../presentations/features/rent/blocs/mean_value_bloc/mean_value_bloc.dart';
import '../presentations/features/rent/blocs/rent_bloc/rent_bloc.dart';
import '../presentations/features/rent/blocs/rent_bloc/rent_grid_kpis_bloc/rent_grid_kpis_bloc.dart';
import '../presentations/features/rent/blocs/summery_bloc/rent_summery_bloc.dart';
import 'app_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerFactory<SharedPreferences>(() => sharedPreferences);
  instance.registerFactory<AppPreferences>(() => AppPreferences(instance()));
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementer(Connectivity()));
  instance.registerLazySingleton<Repository>(() => RepositoryImplementer(
      appServiceClient: instance(), networkInfo: instance()));
}

Future<void> initRentModule() async {
//Usecases
  if (!GetIt.I.isRegistered<GetRentLookupUseCase>()) {
    instance.registerFactory<GetRentLookupUseCase>(
        () => GetRentLookupUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<MeanValueUsecase>()) {
    instance
        .registerFactory<MeanValueUsecase>(() => MeanValueUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<ContractCountUsecase>()) {
    instance.registerFactory<ContractCountUsecase>(
        () => ContractCountUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<CertificateCountUsecase>()) {
    instance.registerFactory<CertificateCountUsecase>(
        () => CertificateCountUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<RentDefaultUseCase>()) {
    instance.registerFactory(() => RentDefaultUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<ContractValueUseCase>()) {
    instance.registerFactory(() => ContractValueUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<RentSummeryUseCase>()) {
    instance.registerFactory(() => RentSummeryUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<TotalContractsUseCase>()) {
    instance.registerFactory<TotalContractsUseCase>(
        () => TotalContractsUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<TotalRentedUnitsUseCase>()) {
    instance.registerFactory<TotalRentedUnitsUseCase>(
        () => TotalRentedUnitsUseCase(instance()));
  }
//Blocs
  instance.registerFactory(() => RentBloc(getRentLookupUseCase: instance()));
  instance.registerFactory(
    () => MeanValueBloc(
      meanValueUsecase: instance(),
    ),
  );
  instance.registerFactory(() => CertificateContractBloc(
      certificateCountUsecase: instance(), contractCountUsecase: instance()));
  instance.registerFactory(
    () => RentGridKPIsBloc(
      totalRentedUnitsUseCase: instance(),
      totalContractsUseCase: instance(),
    ),
  );
  instance.registerFactory(() => RentSummeryBloc(instance()));
  instance.registerFactory(() => RentDefaultBloc(instance()));
}
