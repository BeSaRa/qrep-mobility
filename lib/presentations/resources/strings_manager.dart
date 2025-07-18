import "package:easy_localization/easy_localization.dart";

class AppStrings {
  // shared
  String filterValuesShouldBeAsFollows =
      "filter_values_should_be_as_follows".tr();
  String valuesOtherThanAll = "value_other_than_all".tr();
  String singleValueOtherThanAll = "single_value_other_than_all".tr();
  String shouldUpdateApplication = "should_update_application".tr();

  //main scaffold locals
  String main = "home".tr();
  String rent = "rent".tr();
  String sell = "sell".tr();
  String mortgage = "mortgage".tr();
  String more = "more".tr();

  String rental = "rental".tr();
  String map = "map".tr();
  String indicators = "indicators".tr();
  String indicatorsAndNumbers = "indicators_numbers".tr();
  String laws = "laws".tr();
  String calendar = "calendar".tr();
  String video = "video".tr();
  String aboutAuthority = "about_authority".tr();
  String showAll = "show_all".tr();
  //rent
  static String currentPerformanceSummary = "current_performance_summary";
  String unitType = "unit_type".tr();
  String startDate = "start_date".tr();
  String endDate = "end_date".tr();
  String meterSquare = "meter_square".tr();
  String footSquare = "foot_square".tr();
  String rentRaneValue = "rent_value".tr();
  String areaRangeValue = "area_value".tr();
  String from = "from".tr();
  String to = "to".tr();
  String maxValue = "max_value".tr();
  String minValue = "min_value".tr();
  String maxValueValidate = "max_value_validate".tr();
  String minValueValidate = "min_value_validate".tr();
  String rentContractHistory = "rent_contract_history".tr();
  String nationality = "nationality".tr();
  String month = "month".tr();
  String occupancy = "occupancy".tr();
  String contractType = "contract_type".tr();
  String unspecified = "unspecified".tr();

  // grid
  String totalRentalContractsNumber = "total_rental_contracts_number".tr();
  String totalPropertiesUnitsRented =
      "the_total_number_of_properties_units_rented".tr();
  String averageRentalPricePerUnitProperty =
      "average_rental_price_per_unit_property".tr();
  String totalValueOfLeaseContracts = "the_total_value_of_lease_contracts".tr();

  String rentContractList = "list_of_rental_transactions".tr();
  String rentTopTen = "top_10_areas".tr();

  String rentArea = "rent_area".tr();
  String roomsCount = "room_count".tr();
  String rentValue = "rental_value".tr();
  String currency = "qr".tr();

  //fatina removed this and replace them with no_data_found
  // String noLeaseContracts = "no_lease_contracts".tr();
  // String noPropertiesUnits = "no_properties_units".tr();
  String noDataFound = "no_data_found".tr();
  String countLeaseContracts = "rent_contracts_count".tr();
  String countPropertiesUnits = "number_of_units".tr();
  String noRentContracts = "no_contracts_found".tr();
  String avgPriceEveryMonth = "average_price_per_month".tr();
  String contractsValue = "contracts_values".tr();
  String avgPricePerMeter = "avg_price_per_meter".tr();
  String rentedAreas = "rented_spaces".tr();

  //more view locals
  String moreTitle = "qatar_real_estate_platform".tr();
  String realEstateRegulatoryAuthority =
      "real_estate_regulatory_authority".tr();
  String support = "support".tr();
  String watchList = "my_watch_list".tr();
  String login = "login".tr();
  String logout = "logout".tr();
  String yes = "yes".tr();
  String no = "no".tr();
  String validateLogout = "validate_logout".tr();
  String theme = "theme".tr();
  String language = "language".tr();
  String dark = "dark".tr();
  String light = "light".tr();
  String confirm = "confirm".tr();
  String cancel = "cancel".tr();
  String dataBeingCollectedAndAudited =
      "data_is_being_collected_and_audited".tr();
  String userName = "identifier".tr();
  String email = "email".tr();
  String validatorEmailEmpty = "validator_email_empty".tr();
  String validatorEmailFormat = "validator_email_format".tr();
  String password = "password".tr();
  String validatorPasswordEmpty = "validator_password_empty".tr();
  String forgetPassword = "forget_password".tr();
  String activateFaceId = "activate_face_id".tr();
  static String loginWithUsernameStored = "login_with_user_name_stored";
  String enterYourEmailToReset = "enter_your_email_to_reset".tr();

  //Errors
  String noInternetError = "noInternetError".tr();
  String defaultError = "defaultError".tr();

  //home
  String news = "news".tr();
  String newsDetails = "news_details".tr();
  String relatedNews = "related_news".tr();
  String mortgageIndicators = "mortgage_indicators".tr();
  String rentIndicators = "rent_indicator".tr();
  String sellIndicators = "sell_indicators".tr();
  String realEstateBrokers = "real_estate_broker".tr();
  String aboutUs = "about_us".tr();
  String faqs = "faq".tr();
  String lawsAndDecisions = "laws_and_decisions".tr();
  String issueDate = "issue_date".tr();
  String lawNumber = "law_number".tr();
  String lawDetails = "law_details".tr();
  String downloadFile = "download_file".tr();
  String investorJourney = "investor_journey".tr(); //رحلة المستثمر
  String propertyDevelopers = "property_developers".tr();
  String professionPracticers = "profession_practicers".tr();

  String studyTheIdea = "study_the_idea".tr();
  String connectWithExperts = "connect_with_experts".tr();
  String chooseYourProject = "choose_your_project".tr();
  String ownRealEstate = "own_real_estate".tr();
  String manageYourProperty = "manage_your_property".tr();
  String sellTotalTransactions = "sell_total_transactions".tr();
  String forFirstThreeQuarters = "for_first_three_quarters".tr();
  String totalValuesForSell = "total_values_for_sell".tr();
  String totalNumberForRent = "total_numbers_for_rent".tr();
  String totalValuesForRent = "total_values_for_rent".tr();

  //InvestorJourny
  String back = "back".tr();
  String next = "next".tr();
  //filter
  String measuringUnit = "measuring_unit".tr(); // وحدة القياس
  String meter = "square_meter".tr(); //متر مربع
  String foot = "square_foot".tr(); //قدم مربع
  String chooseDate = "choose_date".tr(); // اختار
  String reset = "reset".tr(); // إعادة ضبط
  String municipal = "municipal".tr(); // البلدية
  String zone = "zone".tr(); //المنطقة
  String propertyType = "property_type".tr(); // نوع العقار
  String propertyUsage = "property_usage".tr(); // استخدام العقار
  String numberOfRooms = "number_of_rooms".tr(); //عدد الغرف
  String duration = "duration".tr(); // المدة الزمنية
  String durationDetails = "duration_details".tr(); //
  String rentValueFromTo = "rent_value_from_to".tr(); //قيمه العقار من - إلى
  String realStateValue = "real_state_value".tr(); //sell قيمه العقار من - إلى
  String areaFromTo = "area_from_to".tr(); //"المساحة من - إلى"
  String search = "search".tr();
  String furnitureStatus = "furniture_status".tr(); // "حالة الاثاث"
  String street = "street".tr(); // "الشارع"
  String selectItems = "select_items".tr();
  String year = "year".tr();
  String mortgageRealEstateValue = "mortgage_value".tr();

  //---------------- sell ----------
  String sellContractCount = "sell_contracts_count".tr();
  String avgPricePerUnit = "average_price_per_unit".tr();
  String transictionValue = "transactions_value".tr();
  String soldAreas = "sold_areas".tr();
  String avgPricePerSquareFoot = "average_price_per_square_foot".tr();
  String avgPricePerSquareMeter = "average_price_per_square_meter".tr();
  String avgPricePer = "average_price_per".tr();

  // grid
  String totalNumberOfPropertiesUnitsSold =
      "the_total_number_of_properties_units_sold".tr();
  String totalSellContractsNumber = "the_total_number_of_sell_contracts".tr();
  String averageSellPricePerUnitProperty =
      "average_sell_price_per_unit_property".tr();
  String totalSellContractsValue = "the_total_value_of_sell_contracts".tr();
  String totalRentedSpaces = "total_rented_space".tr();
  String averageSquareMeterPrice =
      "the_average_price_per_square_meter_square_foot".tr();
  String sellPrice = "sold_for".tr();
  String theUnitPrice = "the_unit_price".tr();
  String meterSquareFull = "meter_square_full".tr();
  String footSquareFull = "foot_square_full".tr();
  String sellContractList = "list_of_sell_transactions".tr();
  String noTransactionFound = "no_transaction_found".tr();

  //mortgage
  String mortgageTransactionsList = "mortgage_transactions_list".tr();
  String mortgageValue = "mortgaged_for".tr();
  String noMortgageTransictions = "no_mortgage_found".tr();

  //Pagination
  String nextPage = "paginator_next_page_label".tr();
  String page = "paginator_page_label".tr();
  String previousPage = "paginator_previous_page_label".tr();
  String lastPage = "paginator_last_page_label".tr();
  String firstPage = "paginator_first_page_label".tr();
  String of = "paginator_of_label".tr();

  /// -------------real estate ------
  String totalCertifiedRealEstate = "total_certified_real_estate".tr();
  String realEstateBrokersDashboard = "real_estate_broker_dashboard".tr();
  String sendEmail = "send_email".tr();
  String callBroker = "call_broker".tr();
  String brokerCompanyName = "broker_company_name".tr();
  String brokerageCompanyActivity = "brokerage_company_activity".tr();
  String openLocation = "open_location".tr();

  ///------------- profile ---------

  String updateProfile = "update_profile".tr();
  String firstName = "first_name".tr();
  String lastName = "last_name".tr();
  String nickName = "nick_name".tr();
  String nameValidationLength = "name_validation_length".tr();
  String activateEmailNotifications = "activate_email_notifications".tr();
// String nickName = "nick_name".tr();

  ///----------------watchlist--------------------------///
  String favName = "fav_name".tr();
  String edit = "edit".tr();
  String delete = "delete".tr();
  String apply = "apply".tr();
  String checkDeleteFav = "check_delete_fav".tr();
  String editName = "edit_name".tr();
  String validatorNameEmpty = "validator_name_empty".tr();
  String somethingWentWrong = "something_went_wrong".tr();
  String mobileAppDonSupport = "mobile_app_don_support".tr();
  String quarter = "quarter".tr();
  String addFavourite = "add_favourite".tr();
  String addFavouriteSuccess = "add_favourite_success".tr();
  String halfYear = "half_year".tr();

  String sessionExpired = "session_expired".tr();
  //--------------webviews---------------
  String tasksAndResponsibilitiesOftheAuthority =
      "tasks_and_responsibilities_of_the_authority".tr();
  String visionAndMission = "vision_and_mission".tr();
  String aboutTheAuthority = "about_the_authority".tr();
  String authorityLocation = "authority_location".tr();
  String contactUs = "contact_us".tr();
  String authorityNews = "authority_news".tr();
  String services = "services".tr();
  //--------------chatbot---------------
  String defaultAuthorityBotMessage = "defult_bot_message".tr();
  String defaultPlatformBotMessage = "defult_platform_bot_message".tr();
  String writeUourMessage = "write_your_message".tr();
  String chartNote = "chart_note".tr();
  String note = "note".tr();
  String articleNumber = "article_number".tr();
  String chatOtherResponseMessage = "chat_other_response_message".tr();
  String chatOtherResponseMessageNote = "chat_other_response_message_note".tr();
  String avgNote = "avg_note".tr();
  String largeDigitsNumbersNote = "large_digits_numbers_note".tr();
  String rateTheCOnversation = "rate_the_conversation".tr();
  String dislike = "dislike".tr();
  String like = "like".tr();
  String aiNote = "ai_note".tr();
  String evaluationCompletedSuccessfully = "Evaluation_completed_successfully".tr();
  String largeDataNote = "large_data_note".tr();
  String viewAsTable = "view_as_table".tr();
  String avatarSessionExpired = "avatar_session_expired".tr();
  String holdRecordMessage = "hold_record_message".tr();

  String noResultFounded = "no_result_founded".tr();
  String allCategories = "All_Categories".tr();
  String clickAnywhereMessage = "click_anywhere_message".tr();

  //--------------ai_search---------------
  String aiSearch = "ai_search".tr();
  String searchHere = "search_here".tr();
  String searchfor = "search_for".tr();
  String numberOfResults = "number_of_results".tr();
  String empowerIdeasAndUnleashIntelligence =
      "Empower_ideas_and_unleash_intelligence".tr();
  String startSearching = "start_searching".tr();
  String seeOnGoogleMap = "see_on_google_map".tr();

  //------------ drawer --------
  String manageUser = "manage_user".tr();
  String manageAccount = "manage_account".tr();
  String privacyPolicy = "privacy_policy".tr();
}
