enum ChatTypeEnum { authority, qatarRealEstatePlatform }

enum QrepPlatformChatResponseFormat {
 table,
  chart,
  law,
  other,
  invalid,
  avg,
}

// QrepPlatformChatResponseFormat qrepPlatformChatResponseFormatFromString(String format) {
//   switch (format.toLowerCase()) {
//     case 'TABLE':
//       return QrepPlatformChatResponseFormat.table;
//     case 'CHART':
//       return QrepPlatformChatResponseFormat.chart;
//     case 'LAW':
//       return QrepPlatformChatResponseFormat.law;
//     case 'OTHER':
//       return QrepPlatformChatResponseFormat.other;
//     case 'AVG':
//       return QrepPlatformChatResponseFormat.avg;
//     case 'INVALID':
//       return QrepPlatformChatResponseFormat.invalid;
//     default:
//       return QrepPlatformChatResponseFormat.other;
//   }
// }
