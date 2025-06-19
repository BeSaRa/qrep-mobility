//* after changing the urls you should run this command in terminal
// import 'package:flutter_dotenv/flutter_dotenv.dart';

///flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

class Constant {
  // static const String baseUrl = 'https://qrepbe.mm.gov.qa/mme-services';
  // // static const String webUrl = 'http://qrep1-eblacorp.edge.eu.ztna.trendmicro.com/';
  // static const String webUrl = 'https://qrep.mm.gov.qa/';
  // static const String cmsBaseUrl = 'https://qrepcms.mm.gov.qa';
  //---------------------------------------------------------------------------------------------------------------
  // static const String baseUrl = 'https://qrepbe.mm.gov.qa/mme-services';
  // // static const String webUrl = 'http://qrep1-eblacorp.edge.eu.ztna.trendmicro.com/';
  // static const String webUrl = 'https://qrep.mm.gov.qa/';
  // static const String cmsBaseUrl = 'https://qrepcms.mm.gov.qa';
  // static const String chatBotBaseUrl = 'https://afnqcpcbai01.azurewebsites.net';
  // static const String aqaratBaseUrl = 'https://ministry-municipality.v2202305135856227727.ultrasrv.de';
  //---------------------------------------------------------------------------------------------------------------
  static const String baseUrl = 'Https://qrepbe.aqarat.gov.qa/mme-services';
  static const String platformStgBaseUrl =
      'https://stgqrepbe.aqarat.gov.qa/mme-services';
  // static const String webUrl = 'http://qrep1-eblacorp.edge.eu.ztna.trendmicro.com/';
  static const String webUrl = 'Https://qrepbe.aqarat.gov.qa/';
  static const String cmsBaseUrl = 'https://qrepcms.aqarat.gov.qa';
  static const String aqaratBaseUrl = 'https://www.aqarat.gov.qa';
  //---------------------------------------------------------------------------------------------------------------
  // static const String baseUrl = 'http://192.168.52.4:9080/mme-services';
  // static const String webUrl = 'http://192.168.52.5:3000/';
  // static const String cmsBaseUrl = 'http://192.168.52.5:8055';
  //static const String aqaratBaseUrl = 'https://ministry-municipality.v2202305135856227727.ultrasrv.de';
  // static const String chatBotBaseUrl = 'https://afnqcpcbai01.azurewebsites.net';

  //---------------------------------------------------------------------------------------------------------------
  static const String guestToken = "lyHWSTHj1SBm9IRECnLAHviNHnXGaS27";
  /*Authority Map Points*/
  static const double latitude = 25.370494;
  static const double longitude = 51.552943;
  static const String mapUrlTemplate =
      'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
  static const String googleMapUrlTemplate =
      "https://www.google.com/maps/place/%D8%A7%D9%84%D9%87%D9%8A%D8%A6%D8%A9+%D8%A7%D9%84%D8%B9%D8%A7%D9%85%D8%A9+%D9%84%D8%AA%D9%86%D8%B8%D9%8A%D9%85+%D8%A7%D9%84%D9%82%D8%B7%D8%A7%D8%B9+%D8%A7%D9%84%D8%B9%D9%82%D8%A7%D8%B1%D9%8A+-+%D8%B9%D9%82%D8%A7%D8%B1%D8%A7%D8%AA%E2%80%AD/@25.370463,51.552953,777m/data=!3m1!1e3!4m6!3m5!1s0x3e45c30011f86e83:0x4dc04497efcca14c!8m2!3d25.3704625!4d51.5529531!16s%2Fg%2F11whwkhg57?hl=en&entry=ttu&g_ep=EgoyMDI1MDMxMC4wIKXMDSoASAFQAw%3D%3D";
  static String publicAccessToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiJBRE1JTiIsInVzZXJuYW1lIjoiY2JhaXVzZXIwMSIsImRlcGFydG1lbnQiOm51bGwsIm1hbmFnZXJfbmFtZSI6bnVsbCwiZW1wbG95ZWVfSUQiOm51bGwsInJvbGUiOm51bGwsInBlcm1pc3Npb25zX2lkcyI6WyIyIiwiMyIsIjQiLCI1IiwiNyIsIjgiLCI5IiwiMTAiLCIxMSIsIjEyIiwiMTMiLCIxNCIsIjE1IiwiMTYiLCIxNyIsIjE4IiwiMTkiLCIyMCIsIjIxIiwiMjIiLCIyMyIsIjI0IiwiMjUiLCIyNiIsIjI3IiwiMjgiLCIyOSIsIjMwIiwiMzEiLCIzMiIsIjMzIiwiMzQiLCIzNSIsIjM2IiwiMzciLCIzOSIsIjQwIiwiNDEiLCI0MiIsIjQzIiwiNDQiLCI0NSIsIjQ2IiwiNDgiLCI0OSIsIjUwIiwiNTEiLCI1MiIsIjUzIiwiNTQiLCI3NyIsIjU1IiwiNTYiLCIzOCIsIjU4IiwiNTkiLCI2MCIsIjYxIiwiNjMiLCI2MiIsIjY0IiwiNjUiLCI2NiIsIjY3IiwiNjgiLCI3MyIsIjcyIiwiNzEiLCI3MCIsIjc0IiwiNzUiLCJERVZFTE9QRVIiLCI3NiJdLCJleHAiOjE4NzY5MDU0MTEsInRva2VuX3R5cGUiOiJhY2Nlc3MifQ.IoiSItY12S_7Ax4jer-qoSU_j5nFMtOcsvi5d69-UHQ";
  //STG
  static const String authorityChatBotBaseUrl ='https://apigatewaystg.aqarat.gov.qa/api-afnqcscbai01';

  ///============= NOTE FROM ZAK To FATINA:==============
  ///u can find the ocpApimSubscription Key from our chat in Teams
  static String ocpApimSubscriptionKey = "2685074912d34e97a1a677bdacb8e385";
}
