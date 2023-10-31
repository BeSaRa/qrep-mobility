import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ebla/domain/usecases/mortgage_usecases/lookup_mortgage_usecase.dart';
import 'package:ebla/domain/usecases/mortgage_usecases/transactions_mortgage_usecase.dart';
import 'package:ebla/presentations/features/info/blocs/faq/faq_bloc.dart';
import 'package:ebla/presentations/features/info/blocs/laws_bloc/laws_bloc.dart';
import 'package:ebla/presentations/features/mortagage/blocs/mortgage_bloc.dart';
import 'package:ebla/presentations/features/mortagage/blocs/transactions/mortgage_transactions_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_default/sell_default_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_grid_kpis_bloc/sell_grid_kpis_bloc.dart';
import 'package:ebla/presentations/features/sell/blocs/sell_transaction/sell_transaction_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/newtwok/app_api.dart';
import '../data/newtwok/dio_factory.dart';
import '../data/newtwok/network_info.dart';
import '../data/repository/repository_implementer.dart';
import '../domain/repository/repository.dart';
import '../domain/usecases/CMS/cms_usecases.dart';
import '../domain/usecases/usecases.dart';
import '../presentations/features/info/blocs/about_bloc/about_bloc.dart';
import '../presentations/features/info/blocs/news_bloc/news_bloc.dart';
import '../presentations/features/rent/blocs/rent_blocs.dart';
import '../presentations/features/sell/blocs/sell_bloc/sell_bloc.dart';
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
  // if (!GetIt.I.isRegistered<NewsByIdUsecase>()) {
  //   instance
  //       .registerFactory<NewsByIdUsecase>(() => NewsByIdUsecase(instance()));
  // }
  if (!GetIt.I.isRegistered<LawsUsecase>()) {
    instance.registerFactory<LawsUsecase>(() => LawsUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<LawByIdUsecase>()) {
    instance.registerFactory<LawByIdUsecase>(() => LawByIdUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<FaqUsecase>()) {
    instance.registerFactory<FaqUsecase>(() => FaqUsecase(instance()));
  }

  //Bloc's
  if (!GetIt.I.isRegistered<AboutBloc>()) {
    instance.registerFactory(() => AboutBloc(aboutUsecase: instance()));
  }
  if (!GetIt.I.isRegistered<NewsBloc>()) {
    instance.registerFactory(() => NewsBloc(newsUsecase: instance()));
  }

  if (!GetIt.I.isRegistered<LawsBloc>()) {
    instance.registerFactory(
        () => LawsBloc(lawsUsecase: instance(), lawByIdUsecase: instance()));
  }
  if (!GetIt.I.isRegistered<FaqBloc>()) {
    instance.registerFactory(() => FaqBloc(
          faqUsecase: instance(),
        ));
  }
}

Future<void> initSellModule() async {
  //Usecases
  if (!GetIt.I.isRegistered<SellDefaultUseCase>()) {
    instance.registerFactory<SellDefaultUseCase>(
        () => SellDefaultUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<SellDefaultUseCase>()) {
    instance.registerFactory<SellDefaultUseCase>(
        () => SellDefaultUseCase(instance()));
  }

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
  // KPI10
  if (!GetIt.I.isRegistered<TotalSoldSpacesUsecase>()) {
    instance.registerFactory<TotalSoldSpacesUsecase>(
        () => TotalSoldSpacesUsecase(instance()));
  }
  // KPI13
  if (!GetIt.I.isRegistered<MeanSellUnitValueUsecase>()) {
    instance.registerFactory<MeanSellUnitValueUsecase>(
        () => MeanSellUnitValueUsecase(instance()));
  }
  // KPI16
  if (!GetIt.I.isRegistered<MeanSoldAreaUsecase>()) {
    instance.registerFactory<MeanSoldAreaUsecase>(
        () => MeanSoldAreaUsecase(instance()));
  }

  if (!GetIt.I.isRegistered<SellTransactionUseCase>()) {
    instance.registerFactory<SellTransactionUseCase>(
        () => SellTransactionUseCase(instance()));
  }

  //-------------- Bloc's---------------------

  if (!GetIt.I.isRegistered<SellGridKPIsBloc>()) {
    instance.registerFactory<SellGridKPIsBloc>(() => SellGridKPIsBloc(
        totalContractsSellUseCase: instance(),
        totalSoldUnitsUseCase: instance(),
        totalTransactionSellUseCase: instance(),
        meanSellUnitValueUsecase: instance(),
        meanSoldAreaUseCase: instance(),
        totalSoldPlacesUseCase: instance()));
  }
  if (!GetIt.I.isRegistered<SellBloc>()) {
    instance.registerFactory(() => SellBloc(getSellLookupUseCase: instance()));
  }
  if (!GetIt.I.isRegistered<SellTransactionBloc>()) {
    instance.registerFactory(() => SellTransactionBloc(instance()));
  }
  if (!GetIt.I.isRegistered<SellDefaultBloc>()) {
    instance.registerFactory(() => SellDefaultBloc(instance()));
  }

  //blocs
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
  if (!GetIt.I.isRegistered<TotalRentedSpaceUsecase>()) {
    instance.registerFactory<TotalRentedSpaceUsecase>(
        () => TotalRentedSpaceUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<MeanAreaUsecase>()) {
    instance
        .registerFactory<MeanAreaUsecase>(() => MeanAreaUsecase(instance()));
  }

  if (!GetIt.I.isRegistered<MeanRentAmountUsecase>()) {
    instance.registerFactory<MeanRentAmountUsecase>(
        () => MeanRentAmountUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<RentValueAmountUseCase>()) {
    instance.registerFactory<RentValueAmountUseCase>(
        () => RentValueAmountUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<MeanRentMeterUseCase>()) {
    instance.registerFactory<MeanRentMeterUseCase>(
        () => MeanRentMeterUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<RentedAreasUseCase>()) {
    instance.registerFactory<RentedAreasUseCase>(
        () => RentedAreasUseCase(instance()));
  }

//Blocs

  if (!GetIt.I.isRegistered<RentBloc>()) {
    instance.registerFactory(() => RentBloc(getRentLookupUseCase: instance()));
  }
  if (!GetIt.I.isRegistered<CertificateContractBloc>()) {
    instance.registerFactory(() => CertificateContractBloc(
        certificateCountUsecase: instance(),
        contractCountUsecase: instance(),
        meanRentAmountUsecase: instance(),
        rentValueAmountUseCase: instance(),
        meanRentMeterUseCase: instance(),
        rentedAreasUseCase: instance()));
  }
  if (!GetIt.I.isRegistered<MeanValueBloc>()) {
    instance.registerFactory(() => MeanValueBloc(meanValueUsecase: instance()));
  }
  if (!GetIt.I.isRegistered<RentGridKPIsBloc>()) {
    instance.registerFactory(() => RentGridKPIsBloc(
        totalRentedUnitsUseCase: instance(),
        totalContractsUseCase: instance(),
        meanValueUsecase: instance(),
        contractValueUseCase: instance(),
        totalRentedSpaceUsecase: instance(),
        meanAreaUsecase: instance()));
  }
  if (!GetIt.I.isRegistered<RentSummeryBloc>()) {
    instance.registerFactory(() => RentSummeryBloc(instance()));
  }
  if (!GetIt.I.isRegistered<RentDefaultBloc>()) {
    instance.registerFactory(() => RentDefaultBloc(instance()));
  }
}

Future<void> initMortgageModule() async {
  //usecase
  if (!GetIt.I.isRegistered<LookUpMortgageUseCase>()) {
    instance.registerFactory<LookUpMortgageUseCase>(
        () => LookUpMortgageUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<MortgageTransactionUseCase>()) {
    instance.registerFactory<MortgageTransactionUseCase>(
        () => MortgageTransactionUseCase(instance()));
  }

  //blocs
  if (!GetIt.I.isRegistered<MortgageBloc>()) {
    instance.registerFactory<MortgageBloc>(() => MortgageBloc(instance()));
  }
  if (!GetIt.I.isRegistered<MortgageTransactionsBloc>()) {
    instance.registerFactory<MortgageTransactionsBloc>(
        () => MortgageTransactionsBloc(instance()));
  }
}
