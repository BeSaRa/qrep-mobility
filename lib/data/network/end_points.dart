class EndPoints {
  //CMS
  static const String translations = '/translations';

  static const String news =
      '/items/news?sort=-date_created&filter%5Bstatus%5D%5B_eq%5D=published';
  static const String newsById = '/items/news/{id}';
  // static const String laws = '/items/laws';
  static const String lawsById = '/items/laws/{id}';
  static const String about = '/items/about?fields=*,translations.*';
  static const String faq = '/items/FAQ';

  //-------------------Rent----------------------------------------------------------
  static const String lockupRent = '/kpi/rent/lookup';
  static const String rentDefault = '/kpi/rent/default';
  static const String totalContracts = '/kpi/rent/kpi1/total-contracts';
  static const String rentTotalContracts =
      '/kpi/rent/kpi2/total-contracts/purpose';
  static const String totalRentedUnits = '/kpi/rent/kpi4/total-units';
  static const String contractValue = '/kpi/rent/kpi7/contract-value';
  static const String meanValue = '/kpi/rent/kpi13/mean-value';
  static const String meanArea = '/kpi/rent/kpi16/mean-area';

  // اجمالي المساحات المستأجرة
  static const String totalRentedSpace = '/kpi/rent/kpi10/total-areas';

  static const String rentSummary = '/kpi/rent/kpi29/summary';
  static const String certificateCount =
      '/kpi/rent/kpi30/stats/certificate-count';
  static const String contractCount = '/kpi/rent/kpi30_1/stats/contract-count';

  //kpi 31 for top 10 section
  static const String avgPriceTop = '/kpi/rent/kpi31/stats/mean-rent-amount';

  static const String rentAmountTop = '/kpi/rent/kpi32/stats/rent-amount';

  static const String meanRentMeter = '/kpi/rent/kpi31_1/stats/mean-rent-meter';

  static const String rentedAreas = '/kpi/rent/kpi33/stats/area';

  //----------------------------------------sell-------------------------------
  static const String lookupSell = '/kpi/sell/lookup';

  static const String sellDefault = '/kpi/sell/default';

  // اجمالي عدد معاملات البيع
  static const String totalContractsSell = '/kpi/sell/kpi1/total-contracts';

  // اجمالي عدد العقارات / الوحدات المباعة
  static const String totalSoldUnits = '/kpi/sell/kpi4/total-units';

  // اجمالي قيمة معاملات البيع
  static const String totalTransactionsSell =
      '/kpi/sell/kpi7/total-transactions';

  // متوسط سعر الوحدة
  static const String meanValueSell = '/kpi/sell/kpi13/mean-value';

  // أفضل عشر مناطق من حيث عدد العقود
  static const String certificateCountSell =
      '/kpi/sell/kpi19/chart/certificate-count';

  // قائمة معاملات البيع
  static const String sellTransactions = '/kpi/sell/kpi29/transactions';

  // أفضل عشر مناطق من حيث عدد الوحدات المباعة
  static const String sellContractCount =
      '/kpi/sell/kpi30/zones/transactions-number';
  static const String avgPricePerUnit = '/kpi/sell/kpi31/zones/unit-price';
  static const String transactionsValue =
      '/kpi/sell/kpi32/zones/transactions-value';
  static const String soldAreas = '/kpi/sell/kpi33/zones/areas';
  static const String realStateNumber =
      '/kpi/sell/kpi33_1/zones/real-estate-number';
  static const String averagePricePerSquareFoot =
      '/kpi/sell/kpi33_2/zones/real-estate-mt-value';

  // إجمالي المساحات المباعة
  static const String totalSoldSpaces = '/kpi/sell/kpi10/total-areas';

  // متوسط سعر البيع (بالمتر/ القدم المربع)
  static const String meanSoldArea = '/kpi/sell/kpi16/mean-area';

  //---------------------------------------------mortgage-----------------------
  //look up
  static const String mortgageLookUp = '/kpi/mortgage/lookup';

  // KPI1
  static const String totalMortgageTransactions =
      '/kpi/mortgage/kpi1/transaction-number';

  // KPI3
  static const String totalNumberOfMortgageUnits =
      '/kpi/mortgage/kpi3/unit-num';

  // KPI5
  static const String totalValueOfMortgageTransactions =
      '/kpi/mortgage/kpi5/stats/transaction-value';

  //KPI7
  static const String mortgageTransactions =
      '/kpi/mortgage/kpi7/detail/transaction';

  //Auth
  static const String auth = '/auth/login';
  static const String resetPassword = '/auth/password/request';
  static const String refreshToken = '/auth/refresh';
  static const String userInfo = '/users/me';
  static const String updateUserInfo = '/users/{id}';
  static const String userEdit = '/users/';

  //Main menu
  static const String mainMenu =
      '/flows/trigger/F0D286AC-588E-4863-B6A1-6230EB88F710';

  //broker
  static const String brokerLookUp = "/kpi/broker/lookup";
  static const String brokerTransactions = "/kpi/broker/transactions";
  static const String brokerKpi1 = "/kpi/broker/kpi1";
  static const String brokerOVLookUp = "/kpi/ov/lookup";

  ///settings
  static const String appSettings = "/settings";

  static const String getTokenApi =
      "/flows/trigger/412A3B92-16F9-437D-AAFC-BBE5E25ED9F5";

  //favourite

  static const String getUserWishList = "/user-wish-list";
  static const String getUserWishListById = "/user-wish-list/user-id/";

  //platform chatbot
  static const String sendMessageToPlatformChatbot = '/openai/chat/completion';

  //send-feedback
  static const String sendFeedback = '/chat-history/add-feedback';
}
