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
  static const double latitude = 	25.4155625;
  static const double longitude = 	51.5035781;
  static const String mapUrlTemplate =
      'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
  static const String googleMapUrlTemplate =
      "https://www.google.com/maps/place/CG83%2B6CG%D8%8C+%D9%84%D9%88%D8%B3%D9%8A%D9%84%D8%8C+%D9%82%D8%B7%D8%B1%E2%80%AD/@25.4155625,51.506153,17z/data=!3m1!4b1!4m5!3m4!1s0x3e45e5d941c8aef7:0xa4dd4c4211787aab!8m2!3d25.4155625!4d51.5035781?entry=ttu&g_ep=EgoyMDI1MDgwNC4wIKXMDSoASAFQAw%3D%3D";
  static String publicAccessToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiQURNSU4iLCJ1c2VybmFtZSI6ImNiYWl1c2VyMDEiLCJwZXJtaXNzaW9uc19pZHMiOlsiMSIsIjIiLCIzIiwiNCIsIjUiLCI2IiwiNyIsIjgiLCI5IiwiMTAiLCIxMSIsIjEyIiwiMTMiLCIxNCIsIjE1IiwiMTYiLCIxNyIsIjE4IiwiMTkiLCIyMCIsIjIxIiwiMjIiLCIyMyIsIjI0IiwiMjUiLCIyNiIsIjI3IiwiMjgiLCIyOSIsIjMwIiwiMzEiLCIzMiIsIjMzIiwiMzQiLCIzNSIsIjM2IiwiMzciLCIzOSIsIjQwIiwiNDEiLCI0MiIsIjQzIiwiNDQiLCI0NSIsIjQ2IiwiNDciLCI0OCIsIjQ5IiwiNTAiLCI1MSIsIjUyIiwiNTMiLCI1NCIsIjc3IiwiNTUiLCI1NiIsIjM4IiwiNTciLCI1OCIsIjU5IiwiNjAiLCI2MSIsIjYzIiwiNjIiLCI2NCIsIjY1IiwiNjYiLCI2NyIsIjY4IiwiNjkiLCI3MyIsIjcyIiwiNzEiLCI3MCIsIjc0IiwiNzUiLCI3NiIsIjc4IiwiNzkiLCI4MCIsIjgxIiwiOTUiLCI5NiIsIjk3IiwiOTgiXSwiZXhwIjoxODc3OTU2OTk5LCJ0b2tlbl90eXBlIjoiYWNjZXNzIn0.0NSN6RFtU2mHc14gfYidotc9Lq8GKO8r_aQKdvtAZmk";
  //STG
  static const String authorityChatBotBaseUrl =
      'https://apigatewaystg.aqarat.gov.qa/api-afnqcscbai01';

  ///============= NOTE FROM ZAK To FATINA:==============
  ///u can find the ocpApimSubscription Key from our chat in Teams
  static String ocpApimSubscriptionKey = "2685074912d34e97a1a677bdacb8e385";
}
