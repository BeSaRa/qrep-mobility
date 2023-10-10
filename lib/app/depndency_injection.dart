import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ebla/domain/usecases/rent_usecases/rent_usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/newtwok/app_api.dart';
import '../data/newtwok/dio_factory.dart';
import '../data/newtwok/network_info.dart';
import '../data/repository/repository_implementer.dart';
import '../domain/repository/repository.dart';
import '../domain/usecases/contract_value_kpi7/contract_value_usecase.dart';
import '../domain/usecases/rent_usecases/defualt_rent_usecase.dart';
import '../domain/usecases/rent_usecases/mean_area_usecase.dart/mean_area_usecase.dart';
import '../domain/usecases/rent_usecases/mean_value_usecases/mean_value_usecases.dart';
import '../presentations/features/rent/blocs/mean_value_bloc/mean_value_bloc.dart';
import '../presentations/features/rent/blocs/rent_bloc/rent_bloc.dart';
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
  if (!GetIt.I.isRegistered<MeanAreaUsecase>()) {
    instance
        .registerFactory<MeanAreaUsecase>(() => MeanAreaUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<RentDefaultUseCase>()) {
    instance.registerLazySingleton(() => RentDefaultUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<ContractValueUseCase>()) {
    instance.registerLazySingleton(() => ContractValueUseCase(instance()));
  }

//Blocs
  instance.registerFactory(() => RentBloc(getRentLookupUseCase: instance()));
  instance.registerFactory(
    () => MeanValueBloc(
      meanValueUsecase: instance(),
    ),
  );
}
