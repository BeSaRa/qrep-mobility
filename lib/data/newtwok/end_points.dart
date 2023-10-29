class EndPoints {
  //CMS
  static const String translations = '/translations';

  static const String news = '/items/news';
  static const String newsById = '/items/news/{id}';
  static const String laws = '/items/laws';
  static const String lawsById = '/items/laws/{id}';
  static const String about = '/items/about';
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
  static const String rentSummary = '/kpi/rent/kpi29/summary';
  static const String certificateCount =
      '/kpi/rent/kpi30/stats/certificate-count';
  static const String contractCount = '/kpi/rent/kpi30_1/stats/contract-count';

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

  // قائمة معاملات البيع
  static const String sellTransactions = '/kpi/sell/kpi29/transactions';

  // أفضل عشر مناطق من حيث عدد العقود
  static const String certificateCountSell =
      '/kpi/sell/kpi19/chart/certificate-count';

  // أفضل عشر مناطق من حيث عدد الوحدات المباعة
  static const String contractsCountSell =
      '/kpi/sell/kpi30/zones/transactions-number';

  //---------------------------------------------mortgage-----------------------
  //look up
  static const mortgageLookUp = '/kpi/mortgage/lookup';

  // KPI1
  static const totalMortgageTransactions =
      '/kpi/mortgage/kpi1/transaction-number';

  // KPI3
  static const totalNumberOfMortgageUnits = '/kpi/mortgage/kpi3/unit-num';

  // KPI5
  static const totalValueOfMortgageTransactions =
      '/kpi/mortgage/kpi5/stats/transaction-value';

  //KPI7
  static const mortgageTransactions = '/kpi/mortgage/kpi7/detail/transaction';
}
