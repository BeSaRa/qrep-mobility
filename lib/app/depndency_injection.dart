import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:ebla/domain/usecases/ai_search/ai_search_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/chat_faq_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/chatbot_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/close_stream_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/platform_chatbot_usecases.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/send_answer_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/send_candidate_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/send_feedback_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/start_stream_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/stop_render_usecase.dart';
import 'package:ebla/domain/usecases/favourite_usecases/create_favourite_usecase.dart';
import 'package:ebla/domain/usecases/favourite_usecases/update_favourite_usecase.dart';
import 'package:ebla/domain/usecases/favourite_usecases/user_favourite_usecase.dart';
import 'package:ebla/domain/usecases/laws_usecases/laws_usecases.dart';
import 'package:ebla/presentations/features/chatbot/blocs/chat_faq_bloc/chat_faq_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/close_stream/close_stream_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/send_feedback_bloc/send_feedback_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/send_message_bloc/chat_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/stop_render/stop_render_bloc.dart';
import 'package:ebla/presentations/features/favourite/bloc/UpdateFav/update_favourite_bloc.dart';
import 'package:ebla/presentations/features/favourite/bloc/create_favourite_bloc/create_favourite_bloc.dart';
import 'package:ebla/presentations/features/favourite/bloc/get_favourite_bloc/get_favourite_bloc.dart';
import 'package:ebla/presentations/features/more/ai_search_view/blocs/ai_search_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/network/app_api.dart';
import '../data/network/cms_dio_factory.dart';
import '../data/network/dio_factory.dart';
import '../data/network/general_dio_interceptor.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_implementer.dart';
import '../domain/repository/repository.dart';
import '../domain/usecases/ai_search/sas_pdf_usecase.dart';
import '../domain/usecases/favourite_usecases/delete_favourite_usecase.dart';
import '../domain/usecases/usecases.dart';
import '../presentations/features/auth/authes.dart';
import '../presentations/features/chatbot/blocs/stream_id_cubit.dart/stream_id_cubit.dart';
import '../presentations/features/info/infos.dart';
import '../presentations/features/main/mains.dart';
import '../presentations/features/more/ai_search_view/blocs/sas_pdf_blocs/sas_pdf_bloc.dart';
import '../presentations/features/more/mores.dart';
import '../presentations/features/mortagage/mortgages.dart';
import '../presentations/features/real_estate_brokers/real_estates.dart';
import '../presentations/features/rent/rents.dart';
import '../presentations/features/sell/sells.dart';
import '../presentations/features/splash_screen/splashes.dart';
import 'app_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final dioRefreshToken = Dio();
  instance.registerFactory<SharedPreferences>(() => sharedPreferences);

  instance.registerFactory<AppPreferences>(() => AppPreferences(instance()));

  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  instance
      .registerLazySingleton<CmsDioFactory>(() => CmsDioFactory(instance()));

  instance.registerFactory<GeneralInterceptor>(
      () => GeneralInterceptor(instance<AppPreferences>(), dioRefreshToken));
  instance.registerFactory<GeneralCMSInterceptor>(
      () => GeneralCMSInterceptor(instance<AppPreferences>(), dioRefreshToken));
  final dio = await instance<DioFactory>().getDio();
  final cmsDio = await instance<CmsDioFactory>().getDio();
  instance.registerFactory<Dio>(() => dio);

  instance.registerLazySingleton<AppServiceClient>(
      () => AppServiceClient(instance<Dio>()));
  instance
      .registerLazySingleton<CmsServiceClient>(() => CmsServiceClient(cmsDio));

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementer(Connectivity()));

  instance.registerLazySingleton<Repository>(() => RepositoryImplementer(
      appServiceClient: instance<AppServiceClient>(),
      translationsServiceClient: instance<CmsServiceClient>(),
      networkInfo: instance<NetworkInfo>()));

  if (!GetIt.I.isRegistered<GetSellLookupUseCase>()) {
    instance.registerFactory<GetSellLookupUseCase>(
        () => GetSellLookupUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<GetRentLookupUseCase>()) {
    instance.registerFactory<GetRentLookupUseCase>(
        () => GetRentLookupUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<LookUpMortgageUseCase>()) {
    instance.registerFactory<LookUpMortgageUseCase>(
        () => LookUpMortgageUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<LoginUsecases>()) {
    instance.registerFactory<LoginUsecases>(
        () => LoginUsecases(repository: instance()));
  }
  if (!GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.registerFactory<ForgetPasswordUseCase>(
        () => ForgetPasswordUseCase(repository: instance()));
  }

  if (!GetIt.I.isRegistered<BottomNavCubit>()) {
    instance.registerFactory<BottomNavCubit>(() => BottomNavCubit(0));
  }
  if (!GetIt.I.isRegistered<BrokerLookOVUpUseCase>()) {
    instance.registerFactory<BrokerLookOVUpUseCase>(
        () => BrokerLookOVUpUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<BrokerLookUpUseCase>()) {
    instance.registerFactory<BrokerLookUpUseCase>(
        () => BrokerLookUpUseCase(instance()));
  }

  if (!GetIt.I.isRegistered<LookupBloc>()) {
    instance.registerFactory<LookupBloc>(() => LookupBloc(
        getRentLookupUseCase: instance<GetRentLookupUseCase>(),
        getSellLookupUseCase: instance<GetSellLookupUseCase>(),
        lookUpMortgageUseCase: instance<LookUpMortgageUseCase>(),
        lookOVUpUseCase: instance<BrokerLookOVUpUseCase>(),
        lookupBrokerUsecase: instance<BrokerLookUpUseCase>()));
  }

  if (!GetIt.I.isRegistered<AppSettingsUseCase>()) {
    instance.registerFactory<AppSettingsUseCase>(
        () => AppSettingsUseCase(instance<Repository>()));
  }

  if (!GetIt.I.isRegistered<GetCmsTokenUseCase>()) {
    instance.registerFactory<GetCmsTokenUseCase>(
        () => GetCmsTokenUseCase(instance<Repository>()));
  }

  if (!GetIt.I.isRegistered<GuestTokenBloc>()) {
    instance.registerFactory<GuestTokenBloc>(
      () => GuestTokenBloc(
        appPreferences: instance(),
        appSettingsUseCase: instance<AppSettingsUseCase>(),
        getCmsTokenUsecase: instance<GetCmsTokenUseCase>(),
      ),
    );
  }
  if (!GetIt.I.isRegistered<UserUsecase>()) {
    instance.registerFactory<UserUsecase>(
        () => UserUsecase(repository: instance()));
  }
  if (!GetIt.I.isRegistered<UpdateInfoUsecase>()) {
    instance.registerFactory<UpdateInfoUsecase>(
        () => UpdateInfoUsecase(repository: instance()));
  }
  if (!GetIt.I.isRegistered<UpdateFcmTokenUseCase>()) {
    instance.registerFactory<UpdateFcmTokenUseCase>(
        () => UpdateFcmTokenUseCase(instance()));
  }

  if (!GetIt.I.isRegistered<MainMenuUsecase>()) {
    instance.registerFactory<MainMenuUsecase>(
        () => MainMenuUsecase(repository: instance()));
  }
  //Blocs

  if (!GetIt.I.isRegistered<UserBloc>()) {
    instance.registerFactory<UserBloc>(() => UserBloc(
        userUsecase: instance<UserUsecase>(),
        updateInfoUsecase: instance<UpdateInfoUsecase>(),
        getCmsTokenUsecase: instance<GetCmsTokenUseCase>(),
        appPreferences: instance<AppPreferences>()));
  }
  if (!GetIt.I.isRegistered<MainMenuBloc>()) {
    instance.registerFactory<MainMenuBloc>(
        () => MainMenuBloc(mainMenuUsecase: instance<MainMenuUsecase>()));
  }
  if (!GetIt.I.isRegistered<LoggedInUserCubit>()) {
    instance.registerFactory<LoggedInUserCubit>(
        () => LoggedInUserCubit(false, instance()));
  }
  if (!GetIt.I.isRegistered<CreateFavouriteUseCase>()) {
    instance.registerFactory<CreateFavouriteUseCase>(
        () => CreateFavouriteUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<CreateFavouriteBloc>()) {
    instance.registerFactory(() => CreateFavouriteBloc(
          createFavouriteUseCase: instance(),
        ));
  }
  // if (!GetIt.I.isRegistered<StartStreamUsecase>()) {
  //   instance.registerFactory<StartStreamUsecase>(
  //       () => StartStreamUsecase(instance()));
  // }
  // if (!GetIt.I.isRegistered<SendAnswerUsecase>()) {
  //   instance.registerFactory<SendAnswerUsecase>(
  //       () => SendAnswerUsecase(instance()));
  // }
  // if (!GetIt.I.isRegistered<SendCandidateUsecase>()) {
  //   instance.registerFactory<SendCandidateUsecase>(
  //       () => SendCandidateUsecase(instance()));
  // }
}

Future<void> initTranslationsModule() async {
  if (!GetIt.I.isRegistered<TranslationsUseCase>()) {
    instance.registerFactory<TranslationsUseCase>(
        () => TranslationsUseCase(instance()));
  }
}

Future<void> initChatbotModule() async {
  //--------- chatbot --------------

  if (!GetIt.I.isRegistered<ChatHistoryCubit>()) {
    instance.registerFactory(() => ChatHistoryCubit());
  }
  //Usecases
  if (!GetIt.I.isRegistered<ChatbotUsecase>()) {
    instance.registerFactory<ChatbotUsecase>(() => ChatbotUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<StartStreamUsecase>()) {
    instance.registerFactory<StartStreamUsecase>(
        () => StartStreamUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<SendAnswerUsecase>()) {
    instance.registerFactory<SendAnswerUsecase>(
        () => SendAnswerUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<SendCandidateUsecase>()) {
    instance.registerFactory<SendCandidateUsecase>(
        () => SendCandidateUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<CloseStreamUsecase>()) {
    instance.registerFactory<CloseStreamUsecase>(
        () => CloseStreamUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<StopRenderUsecase>()) {
    instance.registerFactory<StopRenderUsecase>(
        () => StopRenderUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<StopRenderBloc>()) {
    instance.registerFactory<StopRenderBloc>(
        () => StopRenderBloc(instance()));
  }
  if (!GetIt.I.isRegistered<Chatfaqusecase>()) {
    instance.registerFactory<Chatfaqusecase>(() => Chatfaqusecase(instance()));
  }
  if (!GetIt.I.isRegistered<ChatFaqBloc>()) {
    instance.registerFactory<ChatFaqBloc>(() => ChatFaqBloc(instance()));
  }

  //------ platform chatbot ------
  if (!GetIt.I.isRegistered<PlatformChatbotUsecases>()) {
    instance.registerFactory<PlatformChatbotUsecases>(
        () => PlatformChatbotUsecases(instance()));
  }
  //bloc
  if (!GetIt.I.isRegistered<CloseStreamBloc>()) {
    instance
        .registerFactory<CloseStreamBloc>(() => CloseStreamBloc(instance()));
  }
  if (!GetIt.I.isRegistered<ChatBotBloc>()) {
    instance.registerFactory(() => ChatBotBloc(instance(), instance()));
  }
  if (!GetIt.I.isRegistered<StreamIdCubit>()) {
    instance.registerFactory(() => StreamIdCubit());
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
    instance.registerFactory<LawsUsecase>(
        () => LawsUsecase(repository: instance()));
  }

  if (!GetIt.I.isRegistered<FaqUsecase>()) {
    instance.registerFactory<FaqUsecase>(() => FaqUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<AiSearchUsecase>()) {
    instance
        .registerFactory<AiSearchUsecase>(() => AiSearchUsecase(instance()));
  }
  //Bloc's
  if (!GetIt.I.isRegistered<AboutBloc>()) {
    instance.registerFactory(() => AboutBloc(aboutUsecase: instance()));
  }
  if (!GetIt.I.isRegistered<NewsBloc>()) {
    instance.registerFactory(() => NewsBloc(newsUsecase: instance()));
  }

  if (!GetIt.I.isRegistered<LawsBloc>()) {
    instance.registerFactory(() => LawsBloc(lawsUsecase: instance()));
  }
  if (!GetIt.I.isRegistered<FaqBloc>()) {
    instance.registerFactory(() => FaqBloc(
          faqUsecase: instance(),
        ));
  }
  if (!GetIt.I.isRegistered<AiSearchBloc>()) {
    instance.registerFactory<AiSearchBloc>(() => AiSearchBloc(instance()));
  }
  if (!GetIt.I.isRegistered<SendFeedbackUsecase>()) {
    instance.registerFactory<SendFeedbackUsecase>(
        () => SendFeedbackUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<SendFeedbackBloc>()) {
    instance
        .registerFactory<SendFeedbackBloc>(() => SendFeedbackBloc(instance()));
  }
  if (!GetIt.I.isRegistered<SasPdfUsecase>()) {
    instance.registerFactory<SasPdfUsecase>(() => SasPdfUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<SasPdfBloc>()) {
    instance.registerFactory<SasPdfBloc>(() => SasPdfBloc(instance()));
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

  // if (!GetIt.I.isRegistered<GetSellLookupUseCase>()) {
  //   instance.registerFactory<GetSellLookupUseCase>(
  //       () => GetSellLookupUseCase(instance()));
  // }
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
  if (!GetIt.I.isRegistered<CountTransictionNumberUseCase>()) {
    instance.registerFactory<CountTransictionNumberUseCase>(
        () => CountTransictionNumberUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<CountUnitPriceUseCase>()) {
    instance.registerFactory<CountUnitPriceUseCase>(
        () => CountUnitPriceUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<CountTransictionsValueUseCase>()) {
    instance.registerFactory<CountTransictionsValueUseCase>(
        () => CountTransictionsValueUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<CountAreasUseCase>()) {
    instance.registerFactory<CountAreasUseCase>(
        () => CountAreasUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<RealStateNumberUseCase>()) {
    instance.registerFactory<RealStateNumberUseCase>(
        () => RealStateNumberUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<RealStateNumberMeterUseCase>()) {
    instance.registerFactory<RealStateNumberMeterUseCase>(
        () => RealStateNumberMeterUseCase(instance()));
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
    instance.registerFactory(() => SellBloc());
  }
  if (!GetIt.I.isRegistered<SellTransactionBloc>()) {
    instance.registerFactory(() => SellTransactionBloc(instance()));
  }
  if (!GetIt.I.isRegistered<SellDefaultBloc>()) {
    instance.registerFactory(() => SellDefaultBloc(instance()));
  }
  if (!GetIt.I.isRegistered<TopvaluesBloc>()) {
    instance.registerFactory(() => TopvaluesBloc(
        countTransictionNumberUseCase: instance(),
        countUnitPriceUseCase: instance(),
        countTransictionsValueUseCase: instance(),
        countAreasUseCase: instance(),
        realStateNumberUseCase: instance(),
        realStateNumberMeterUseCase: instance()));
  }
  //blocs
}

Future<void> initRentModule() async {
//Usecases
  // if (!GetIt.I.isRegistered<GetRentLookupUseCase>()) {
  //   instance.registerFactory<GetRentLookupUseCase>(
  //       () => GetRentLookupUseCase(instance()));
  // }
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
    instance.registerFactory(() => RentBloc());
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
  // if (!GetIt.I.isRegistered<LookUpMortgageUseCase>()) {
  //   instance.registerFactory<LookUpMortgageUseCase>(
  //       () => LookUpMortgageUseCase(instance()));
  // }
  if (!GetIt.I.isRegistered<MortgageTransactionUseCase>()) {
    instance.registerFactory<MortgageTransactionUseCase>(
        () => MortgageTransactionUseCase(instance()));
  }
  //-------------------------
  if (!GetIt.I.isRegistered<TotalMortgageTransactionsUseCase>()) {
    instance.registerFactory<TotalMortgageTransactionsUseCase>(
        () => TotalMortgageTransactionsUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<TotalNumOfMortgageUnitsUsecase>()) {
    instance.registerFactory<TotalNumOfMortgageUnitsUsecase>(
        () => TotalNumOfMortgageUnitsUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<TotalValOfMortgageTransactionsUsecase>()) {
    instance.registerFactory<TotalValOfMortgageTransactionsUsecase>(
        () => TotalValOfMortgageTransactionsUsecase(instance()));
  }

  //blocs
  if (!GetIt.I.isRegistered<MortgageBloc>()) {
    instance.registerFactory<MortgageBloc>(() => MortgageBloc());
  }
  if (!GetIt.I.isRegistered<MortgageTransactionsBloc>()) {
    instance.registerFactory<MortgageTransactionsBloc>(
        () => MortgageTransactionsBloc(instance()));
  }
  if (!GetIt.I.isRegistered<MortgageGridKPIsBloc>()) {
    instance.registerFactory<MortgageGridKPIsBloc>(() => MortgageGridKPIsBloc(
          totalMortgageTransactionsUseCase: instance(),
          totalNumOfMortgageUnitsUsecase: instance(),
          totalValOfMortgageTransactionsUsecase: instance(),
        ));
  }
}

Future<void> initRealEstateBroker() async {
  if (!GetIt.I.isRegistered<BrokerLookUpUseCase>()) {
    instance.registerFactory<BrokerLookUpUseCase>(
        () => BrokerLookUpUseCase(instance()));
  }

  if (!GetIt.I.isRegistered<BrokerLookOVUpUseCase>()) {
    instance.registerFactory<BrokerLookOVUpUseCase>(
        () => BrokerLookOVUpUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<BrokerTransactionUseCase>()) {
    instance.registerFactory<BrokerTransactionUseCase>(
        () => BrokerTransactionUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<BrokerCountUseCase>()) {
    instance.registerFactory<BrokerCountUseCase>(
        () => BrokerCountUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<LookUpBrokerBloc>()) {
    instance.registerFactory<LookUpBrokerBloc>(() => LookUpBrokerBloc(
        lookupBrokerUsecase: instance<BrokerLookUpUseCase>(),
        lookOVUpUseCase: instance<BrokerLookOVUpUseCase>()));
  }
  if (!GetIt.I.isRegistered<BrokerTransactionBloc>()) {
    instance.registerFactory<BrokerTransactionBloc>(
        () => BrokerTransactionBloc(instance()));
  }
  if (!GetIt.I.isRegistered<BrokersCountBloc>()) {
    instance
        .registerFactory<BrokersCountBloc>(() => BrokersCountBloc(instance()));
  }
}

Future<void> initFavourite() async {
  if (!GetIt.I.isRegistered<GetUserFavouriteUseCase>()) {
    instance.registerFactory<GetUserFavouriteUseCase>(
        () => GetUserFavouriteUseCase(instance()));
  }

  if (!GetIt.I.isRegistered<DeleteFavouriteUseCase>()) {
    instance.registerFactory<DeleteFavouriteUseCase>(
        () => DeleteFavouriteUseCase(instance()));
  }

  if (!GetIt.I.isRegistered<UpdateFavouriteUseCase>()) {
    instance.registerFactory<UpdateFavouriteUseCase>(
        () => UpdateFavouriteUseCase(instance()));
  }

  if (!GetIt.I.isRegistered<GetFavouriteBloc>()) {
    instance.registerFactory<GetFavouriteBloc>(() => GetFavouriteBloc(
        getUserFavouriteUseCase: instance(),
        appPreferences: instance(),
        deleteFavouriteUseCase: instance()));
  }

  if (!GetIt.I.isRegistered<UpdateFavouriteBloc>()) {
    instance.registerFactory<UpdateFavouriteBloc>(
        () => UpdateFavouriteBloc(updateFavouriteUseCase: instance()));
  }
}

Future<void> resetAllModules({bool dispose = true}) async {
  await instance.reset(dispose: dispose);
  await initAppModule();
}
