import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:ebla/presentations/features/chatbot/widgets/platform_chat_widgets.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ShownMessageWidget extends StatelessWidget {
  const ShownMessageWidget({
    super.key,
    required this.message,
    required this.isAvatarShow,
    required this.currentMessageIndex,

    //  required this.animation
  });
  final MessageRequestModel message;
  final bool isAvatarShow;
  final int currentMessageIndex;

  @override
  Widget build(BuildContext context) {
    bool isMessageInArabic = false;
    if (message.content is String) {
      isMessageInArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(message.content);
    }

    return Column(
      crossAxisAlignment: message.role == 'user'
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: message.role == 'user'
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (message.role != 'user')
              SizedBox(
                height: AppSizeW.s30,
                width: AppSizeW.s30,
                child: const Image(
                  image: AssetImage(
                    ImageAssets.chatBot,
                  ),
                ),
              ),
            SizedBox(width: AppSizeW.s5),
            Flexible(
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizeW.s15, vertical: AppSizeH.s10),
                  margin: EdgeInsets.symmetric(vertical: AppSizeH.s15),
                  decoration: BoxDecoration(
                      color: message.role == 'user'
                          ? isAvatarShow
                              ? Theme.of(context)
                                  .primaryColor
                                  .withValues(alpha: .5)
                              : Theme.of(context).primaryColor
                          : isAvatarShow
                              ? Theme.of(context)
                                  .canvasColor
                                  .withValues(alpha: .5)
                              : Theme.of(context).canvasColor,
                      borderRadius: context.locale == ARABIC_LOCAL
                          ? BorderRadius.only(
                              topLeft: message.role == 'user'
                                  ? Radius.zero
                                  : Radius.circular(AppSizeR.s15),
                              topRight: message.role != 'user'
                                  ? Radius.zero
                                  : Radius.circular(AppSizeR.s15),
                              bottomLeft: Radius.circular(AppSizeR.s15),
                              bottomRight: Radius.circular(AppSizeR.s15))
                          : BorderRadius.only(
                              topLeft: message.role != 'user'
                                  ? Radius.zero
                                  : Radius.circular(AppSizeR.s15),
                              topRight: message.role == 'user'
                                  ? Radius.zero
                                  : Radius.circular(AppSizeR.s15),
                              bottomLeft: Radius.circular(AppSizeR.s15),
                              bottomRight: Radius.circular(AppSizeR.s15))),
                  child: FormattedDataWidget(
                    isMessageInArabic: isMessageInArabic,
                    message: message,
                    currentMessageIndex: currentMessageIndex,
                  )

                  //  _formatedDataFun(isMessageInArabic, context),
                  ),
            ),
          ],
        ),
        if (message.role != 'user')
          const Divider(
            thickness: 2,
            endIndent: 20,
            indent: 20,
          ),
      ],
    );
  }

//   Widget _formatedDataFun(bool isMessageInArabic, BuildContext context) {
//     //this case will happen just when user sent a message from authority or the shown message role is user
//     if (message.content is String) {
//       return Text(
//           textDirection:
//               isMessageInArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
//           message.content.toString(),
//           textAlign: message.role == 'user' ? TextAlign.center : null,
//           style: TextStyle(
//               color: message.role == 'user'
//                   ? ColorManager.white
//                   : Theme.of(context).textTheme.bodySmall!.color));
//     } else if (message.content is PlatformChatbotResponseModel) {
//       final platformResponse = message.content as PlatformChatbotResponseModel;
//       switch (platformResponse.responseFormat) {
//         //-----------------------------------------------------------------------------
//         case "OTHER":
//           {
//             if (platformResponse.response.isNotEmpty) {
//               return PlatformTableResponse(
// note: "",
//                   response: platformResponse,
//                   isHasNote: false);
//             } else {
//               return const InvalidQuestionWidget();
//             }
//           }
//         //-----------------------------------------------------------------------------
//         case "CHART":
//           {
//             final int elementKeysNumber =
//                 platformResponse.response.first.keys.toList().length;
//             if (elementKeysNumber > 2) {
//               return PlatformTableResponse(
//                 note: AppStrings().chartNote,
//                   response: platformResponse,
//                   isHasNote: true);
//             } else {
//               if(allValuesHaveLessThanFiveDigitsBeforePoint(platformResponse.response as List<Map<String,dynamic>>)){
//  return PlatformTableResponse(
// note: AppStrings().largeDigitsNumbersNote,
//                   response: platformResponse,
//                   isHasNote: true

//                   );
//               }
//               return PlatformChartResponse(
//                   responseData: platformResponse,
//                   currentMessageIndex: currentMessageIndex);
//             }
//           }
//         //-----------------------------------------------------------------------------
//         case "LAW":
//           return PlatformLawResponse(
//             responseData: platformResponse,
//           );
//         //-----------------------------------------------------------------------------
//         case "AVG":
//           {
//             final int elementKeysNumber =
//                 platformResponse.response.first.keys.toList().length;
//             if (elementKeysNumber == 1) {
//               return PlatformAvgResponse(
//                 responseData: platformResponse,
//                 isMessageInArabic: isMessageInArabic,
//               );
//             } else if (elementKeysNumber == 2) {
//               return PlatformChartResponse(
//                   currentMessageIndex: currentMessageIndex,
//                   responseData: platformResponse);
//             } else {
//               return PlatformTableResponse(
//                 note: AppStrings().avgNote,
//                   response: platformResponse,
//                   isHasNote: true);
//             }
//           }
//         //-----------------------------------------------------------------------------
//         default:
//           return const InvalidQuestionWidget();
//       }
//     } else {
//       return Text(
//         AppStrings().defaultError,
//         // "Unsupported format",
//         style: const TextStyle(color: Colors.red),
//       );
//     }
//   }
}

class FormattedDataWidget extends StatelessWidget {
  final bool isMessageInArabic;
  final MessageRequestModel message;
  final int currentMessageIndex;

  const FormattedDataWidget({
    super.key,
    required this.isMessageInArabic,
    required this.message,
    required this.currentMessageIndex,
  });

//------------------- function to check if the number come to the chart is has more than 5 digits ---------------
  bool allValuesHaveLessThanFiveDigitsBeforePoint(List<dynamic> response) {
    for (var map in response) {
      if (map.length < 2) continue; // skip if the map has less than 2 keys

      String secondKey = map.keys.elementAt(1);
      var value =
          map[secondKey]; // here i get the value associated with the second key

      if (value is num) {
        // to make sure that the value is a number
        if (!hasLessThanFiveDigitsBeforePoint(value.toDouble())) {
          return false; // If any number has more 5 digits before the point, return false
        }
      } else {
        return false; // If the value is not a number, return false
      }
    }
    return true; // If all numbers have less than 5 digits before the decimal point, return true
  }

  bool hasLessThanFiveDigitsBeforePoint(double number) {
    String numStr = number.toString();
    List<String> parts = numStr.split('.');

    // Get the integer part before the decimal point
    String integerPart = parts[0];

    return integerPart.length <= 5;
  }

  @override
  Widget build(BuildContext context) {
    if (message.content is String) {
      return Text(
          textDirection:
              isMessageInArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
          message.content.toString(),
          textAlign: message.role == 'user' ? TextAlign.center : null,
          style: TextStyle(
              color: message.role == 'user'
                  ? ColorManager.white
                  : Theme.of(context).textTheme.bodySmall!.color));
    } else if (message.content is PlatformChatbotResponseModel) {
      final platformResponse = message.content as PlatformChatbotResponseModel;
      switch (platformResponse.responseFormat) {
        //-----------------------------------------------------------------------------
        case "OTHER":
          {
            if (platformResponse.response.isNotEmpty) {
              return PlatformTableResponse(
                  note: "", response: platformResponse, isHasNote: false);
            } else {
              return const InvalidQuestionWidget();
            }
          }
        //-----------------------------------------------------------------------------
        case "CHART":
          {
            final int elementKeysNumber =
                platformResponse.response.first.keys.toList().length;
            if (elementKeysNumber > 2) {
              return PlatformTableResponse(
                  note: AppStrings().chartNote,
                  response: platformResponse,
                  isHasNote: true);
            } else {
              // if all data values are huge:
              if (!allValuesHaveLessThanFiveDigitsBeforePoint(
                  platformResponse.response)) {
                return PlatformTableResponse(
                    note: AppStrings().largeDigitsNumbersNote,
                    response: platformResponse,
                    isHasNote: true);
              }
              return PlatformChartResponse(
                  responseData: platformResponse,
                  currentMessageIndex: currentMessageIndex);
            }
          }
        //-----------------------------------------------------------------------------
        case "LAW":
          return PlatformLawResponse(
            responseData: platformResponse,
          );
        //-----------------------------------------------------------------------------
        case "AVG":
          {
            final int elementKeysNumber =
                platformResponse.response.first.keys.toList().length;
            if (elementKeysNumber == 1) {
              return PlatformAvgResponse(
                responseData: platformResponse,
                isMessageInArabic: isMessageInArabic,
              );
            } else if (elementKeysNumber == 2) {
              return PlatformChartResponse(
                  currentMessageIndex: currentMessageIndex,
                  responseData: platformResponse);
            } else {
              return PlatformTableResponse(
                  note: AppStrings().avgNote,
                  response: platformResponse,
                  isHasNote: true);
            }
          }
        //-----------------------------------------------------------------------------
        default:
          return const InvalidQuestionWidget();
      }
    } else {
      return Text(
        AppStrings().defaultError,
        // "Unsupported format",
        style: const TextStyle(color: Colors.red),
      );
    }
  }
}
