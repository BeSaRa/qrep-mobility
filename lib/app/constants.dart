//* after changing the urls you should run this command in terminal
import 'package:flutter_dotenv/flutter_dotenv.dart';

///flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

class Constant {
  // static const String baseUrl = 'https://qrepbe.mm.gov.qa/mme-services';
  // // static const String webUrl = 'http://qrep1-eblacorp.edge.eu.ztna.trendmicro.com/';
  // static const String webUrl = 'https://qrep.mm.gov.qa/';
  // static const String cmsBaseUrl = 'https://qrepcms.mm.gov.qa';
  //
  // static const String baseUrl = 'https://qrepbe.mm.gov.qa/mme-services';
  // // static const String webUrl = 'http://qrep1-eblacorp.edge.eu.ztna.trendmicro.com/';
  // static const String webUrl = 'https://qrep.mm.gov.qa/';
  // static const String cmsBaseUrl = 'https://qrepcms.mm.gov.qa';
  // static const String chatBotBaseUrl = 'https://afnqcpcbai01.azurewebsites.net';
  // static const String aqaratBaseUrl = 'https://ministry-municipality.v2202305135856227727.ultrasrv.de';
  //
  static const String baseUrl = 'Https://qrepbe.aqarat.gov.qa/mme-services';
  // static const String webUrl = 'http://qrep1-eblacorp.edge.eu.ztna.trendmicro.com/';
  static const String webUrl = 'Https://qrepbe.aqarat.gov.qa/';
  static const String cmsBaseUrl = 'https://qrepcms.aqarat.gov.qa';
  /*--- */
  static const String aqaratBaseUrl = 'https://www.aqarat.gov.qa';
  static const String aqaratBaseUrl2 = 'https://ministry-municipality.v2202305135856227727.ultrasrv.de';
  static const String authorityChatBotBaseUrl = 'https://afnqcpcbai01.azurewebsites.net';
  static String xFunctionsAuthorityChatbotKey =  dotenv.env['X_FUNCTION_AUTHORITY_CHATBOT_KEY'] ?? 'NO_KEY_FOUND';



  // static const String baseUrl = 'http://192.168.52.4:9080/mme-services';
  // static const String webUrl = 'http://192.168.52.5:3000/';
  // static const String cmsBaseUrl = 'http://192.168.52.5:8055';
  //static const String aqaratBaseUrl = 'https://ministry-municipality.v2202305135856227727.ultrasrv.de';
  // static const String chatBotBaseUrl = 'https://afnqcpcbai01.azurewebsites.net';

  static const String guestToken = "lyHWSTHj1SBm9IRECnLAHviNHnXGaS27";
  /*Authority Map Points*/  

  static const double latitude = 25.370494;
  static const double longitude = 51.552943;
  static const String mapUrlTemplate ='https://tile.openstreetmap.org/{z}/{x}/{y}.png';
}
