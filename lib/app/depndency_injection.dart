import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ebla/presentations/features/home/blocs/news_bloc/news_bloc.dart';

import 'package:ebla/presentations/features/rent/blocs/default_bloc/rent_default_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/bloc/sell_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/newtwok/app_api.dart';
import '../data/newtwok/dio_factory.dart';
import '../data/newtwok/network_info.dart';
import '../data/repository/repository_implementer.dart';
import '../domain/repository/repository.dart';
import '../domain/usecases/CMS/cms_usecases.dart';
import '../domain/usecases/sell_usecases/sell_usecases.dart';
import '../domain/usecases/usecases.dart';
import '../presentations/features/info/blocs/about_bloc/about_bloc.dart';
import '../presentations/features/rent/blocs/certificate_contract_bloc/certificate_contract_bloc.dart';
import '../presentations/features/rent/blocs/mean_value_bloc/mean_value_bloc.dart';
import '../presentations/features/rent/blocs/rent_bloc/rent_bloc.dart';
import '../presentations/features/rent/blocs/rent_bloc/rent_grid_kpis_bloc/rent_grid_kpis_bloc.dart';
import '../presentations/features/rent/blocs/summery_bloc/rent_summery_bloc.dart';
import '../presentations/features/sell/blocs/sell_grid_kpis_bloc/sell_grid_kpis_bloc.dart';
import 'app_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerFactory<SharedPreferences>(() => sharedPreferences);
  instance.registerFactory<AppPreferences>(() => AppPreferences(instance()));
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  instance.registerLazySingleton<TranslationsServiceClient>(
      () => TranslationsServiceClient(dio));
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementer(Connectivity()));
  instance.registerLazySingleton<Repository>(() => RepositoryImplementer(
      appServiceClient: instance(),
      translationsServiceClient: instance(),
      networkInfo: instance()));
}

Future<void> initTranslationsModule() async {
  if (!GetIt.I.isRegistered<TranslationsUseCase>()) {
    instance.registerFactory<TranslationsUseCase>(
        () => TranslationsUseCase(instance()));
  }
}

Future<void> initHomeModule() async {
  if (!GetIt.I.isRegistered<AboutUsecase>()) {
    instance.registerFactory<AboutUsecase>(() => AboutUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<NewsUsecase>()) {
    instance.registerFactory<NewsUsecase>(() => NewsUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<LawsUsecase>()) {
    instance.registerFactory<LawsUsecase>(() => LawsUsecase(instance()));
  }

  //Bloc's
  instance.registerFactory(() => AboutBloc(aboutUsecase: instance()));
  instance.registerFactory(() => NewsBloc(newsUsecase: instance()));
}

Future<void> initSellModule() async {
  //Usecases
  if (!GetIt.I.isRegistered<GetSellLookupUseCase>()) {
    instance.registerFactory<GetSellLookupUseCase>(
        () => GetSellLookupUseCase(instance()));
  }
  // KPI1
  if (!GetIt.I.isRegistered<TotalContractsSellUseCase>()) {
    instance.registerFactory<TotalContractsSellUseCase>(
        () => TotalContractsSellUseCase(instance()));
  }
  // KPI4
  if (!GetIt.I.isRegistered<TotalSoldUnitsUseCase>()) {
    instance.registerFactory<TotalSoldUnitsUseCase>(
        () => TotalSoldUnitsUseCase(instance()));
  }
  // KPI7
  if (!GetIt.I.isRegistered<TotalTransactionSellUseCase>()) {
    instance.registerFactory<TotalTransactionSellUseCase>(
        () => TotalTransactionSellUseCase(instance()));
  }
  // KPI13
  if (!GetIt.I.isRegistered<MeanValueSellUsecase>()) {
    instance.registerFactory<MeanValueSellUsecase>(
        () => MeanValueSellUsecase(instance()));
  }
  //-------------- Bloc's---------------------
  instance.registerFactory<SellGridKPIsBloc>(() => SellGridKPIsBloc(
      totalContractsSellUseCase: instance(),
      totalSoldUnitsUseCase: instance(),
      totalTransactionSellUseCase: instance(),
      meanValueSellUsecase: instance()));

  instance.registerFactory(() => SellBloc(getSellLookupUseCase: instance()));
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
      meanValueUsecase: instance(),
      contractValueUseCase: instance(),
    ),
  );
  instance.registerFactory(() => RentSummeryBloc(instance()));
  instance.registerFactory(() => RentDefaultBloc(instance()));
}
