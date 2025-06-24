import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import 'package:ebla/presentations/features/chatbot/widgets/platform_chat_widgets.dart';
import 'package:ebla/presentations/features/more/ai_search_view/blocs/sas_pdf_blocs/sas_pdf_bloc.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ShownMessageWidget extends StatelessWidget {
  const ShownMessageWidget({
    super.key,
    required this.message,
    required this.isAvatarShow,
    required this.currentMessageIndex,
    required this.isPDFFileLoadingForSAS,
  });
  final MessageRequestModel message;
  final bool isAvatarShow;
  final int currentMessageIndex;
  final ValueNotifier<bool> isPDFFileLoadingForSAS;

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
                      gradient: message.role == 'user' && isAvatarShow
                          ? LinearGradient(
                              colors: [
                                ColorManager.primary,
                                ColorManager.primary.withValues(alpha: .7),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : null,
                      color: message.role == 'user'
                          ? isAvatarShow
                              ? Theme.of(context)
                                  .primaryColor
                                  .withValues(alpha: .9)
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
                  child: BlocProvider(
                    create: (context) => instance<SasPdfBloc>(),
                    child: FormattedDataWidget(
                        isMessageInArabic: isMessageInArabic,
                        message: message,
                        currentMessageIndex: currentMessageIndex,
                        isPDFFileLoadingForSAS: isPDFFileLoadingForSAS),
                  )

                  //  _formatedDataFun(isMessageInArabic, context),
                  ),
            ),
          ],
        ),
        if (message.role != 'user' &&
            message.content is PlatformChatbotResponseModel)
          Divider(
            thickness: 2,
            endIndent: AppSizeW.s20,
            indent: AppSizeW.s20,
          ),
      ],
    );
  }
}

class FormattedDataWidget extends StatelessWidget {
  final bool isMessageInArabic;
  final MessageRequestModel message;
  final int currentMessageIndex;
  final ValueNotifier<bool> isPDFFileLoadingForSAS;
  const FormattedDataWidget({
    super.key,
    required this.isMessageInArabic,
    required this.message,
    required this.currentMessageIndex,
    required this.isPDFFileLoadingForSAS,
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

  List<TextSpan> _buildStringContentWithLinks(
      MessageRequestModel message, BuildContext context) {
    final citations = message.contextData?.citations ?? [];
    final RegExp regex = RegExp(r'\[doc(\d+)\]');
    final content = message.content.toString();

    final List<TextSpan> spans = [];
    int start = 0;

    // Get the default text style from theme
    final defaultStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: message.role == 'user'
              ? ColorManager.white
              : Theme.of(context).textTheme.bodyMedium!.color,
        );

    for (final match in regex.allMatches(content)) {
      final matchStart = match.start;
      final matchEnd = match.end;
      final matchText = match.group(0)!;
      final docIndex = int.parse(match.group(1)!);

      // Add the text before the match
      if (start < matchStart) {
        spans.add(TextSpan(
          text: content.substring(start, matchStart),
          style: defaultStyle,
        ));
      }

      // Add the clickable 📎 icon
      if (docIndex - 1 < citations.length) {
        final url = citations[docIndex - 1].url;
        spans.add(TextSpan(
          text: '📎',
          style: defaultStyle.copyWith(
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              if (url.contains('blob.core.windows')) {
                context
                    .read<SasPdfBloc>()
                    .add(SasPdfEvent.getSasPdf(request: url));
              } else {
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url),
                      mode: LaunchMode.externalApplication);
                }
              }
              // if (await canLaunchUrl(Uri.parse(url))) {
              //   await launchUrl(Uri.parse(url),
              //       mode: LaunchMode.externalApplication);
              // }
            },
        ));
      } else {
        // fallback if citation not found
        spans.add(TextSpan(
          text: matchText,
          style: defaultStyle,
        ));
      }

      start = matchEnd;
    }

    // Add the remaining text after the last match
    if (start < content.length) {
      spans.add(TextSpan(
        text: content.substring(start),
        style: defaultStyle,
      ));
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    if (message.content is String) {
      return BlocListener<SasPdfBloc, SasPdfState>(
        listener: (context, sasState) {
          sasState.mapOrNull(
              //   loading: (value) {
              //   // Show loading dialog
              //   showDialog(
              //     context: context,
              //     barrierDismissible: false,
              //     builder: (context) => const Center(
              //       child: CircularProgressIndicator(),
              //     ),
              //   );
              // },
              loading: (value) {
            isPDFFileLoadingForSAS.value = true;
          }, done: (value) async {
            try {
              // Temporary file path
              final tempDir = await getTemporaryDirectory();
              final filePath = '${tempDir.path}/temp_pdf.pdf';

              // Download the file
              final response = await Dio().get(
                value.response,
                options: Options(responseType: ResponseType.bytes),
              );

              // Save to temporary file
              final file = File(filePath);
              await file.writeAsBytes(response.data);

              // Open with open_file - this will trigger the system bottom sheet
              isPDFFileLoadingForSAS.value = false;
              await OpenFile.open(filePath);
            } catch (e) {
              log("Error opening PDF: $e");
              // Fallback to launchUrl
              final uri = Uri.parse(value.response);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            } finally {
              isPDFFileLoadingForSAS.value = false;
            }
            // finally {
            //   // Close loading dialog using the captured context
            //   if (Navigator.canPop(dialogContext)) {
            //     Navigator.of(dialogContext).pop();
            //   }
            // }
          });
        },
        child: Text.rich(
          TextSpan(
            children: _buildStringContentWithLinks(message, context),
          ),
          textDirection:
              isMessageInArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
          textAlign: message.role == 'user' ? TextAlign.center : null,
        ),
      );
    } else if (message.content is PlatformChatbotResponseModel) {
      final platformResponse = message.content as PlatformChatbotResponseModel;
      switch (platformResponse.responseFormat) {
        //-----------------------------------------------------------------------------
        case "OTHER":
          {
            if (platformResponse.response.isNotEmpty) {
              return PlatformTableResponse(
                  pdfTitle: context
                          .read<ChatHistoryCubit>()
                          .state
                          .platformMessages[currentMessageIndex - 1]
                          .content is String
                      ? context
                          .read<ChatHistoryCubit>()
                          .state
                          .platformMessages[currentMessageIndex - 1]
                          .content
                      : "data",
                  note: "",
                  response: platformResponse,
                  isHasNote: false);
            } else {
              return const InvalidQuestionWidget();
            }
          }
        //-----------------------------------------------------------------------------
        case "CHART":
          {
            if (platformResponse.response.isNotEmpty) {
              final int elementKeysNumber =
                  platformResponse.response.first.keys.toList().length;
              if (elementKeysNumber > 2) {
                return PlatformTableResponse(
                    pdfTitle: context
                            .read<ChatHistoryCubit>()
                            .state
                            .platformMessages[currentMessageIndex - 1]
                            .content is String
                        ? context
                            .read<ChatHistoryCubit>()
                            .state
                            .platformMessages[currentMessageIndex - 1]
                            .content
                        : "data",
                    note: AppStrings().chartNote,
                    response: platformResponse,
                    isHasNote: true);
              } else {
                // if all data values are huge:
                if (!allValuesHaveLessThanFiveDigitsBeforePoint(
                    platformResponse.response)) {
                  return PlatformTableResponse(
                      pdfTitle: context
                              .read<ChatHistoryCubit>()
                              .state
                              .platformMessages[currentMessageIndex - 1]
                              .content is String
                          ? context
                              .read<ChatHistoryCubit>()
                              .state
                              .platformMessages[currentMessageIndex - 1]
                              .content
                          : "data",
                      note: AppStrings().largeDigitsNumbersNote,
                      response: platformResponse,
                      isHasNote: true);
                }
                return PlatformChartResponse(
                    pdfTitle: context
                            .read<ChatHistoryCubit>()
                            .state
                            .platformMessages[currentMessageIndex - 1]
                            .content is String
                        ? context
                            .read<ChatHistoryCubit>()
                            .state
                            .platformMessages[currentMessageIndex - 1]
                            .content
                        : "data",
                    responseData: platformResponse,
                    currentMessageIndex: currentMessageIndex);
              }
            } else {
              return const InvalidQuestionWidget();
            }
          }
        //-----------------------------------------------------------------------------
        case "LAW":
          {
            if (platformResponse.response.isNotEmpty) {
              return PlatformLawResponse(
                responseData: platformResponse,
              );
            } else {
              return const InvalidQuestionWidget();
            }
          }
        //-----------------------------------------------------------------------------
        case "AVG":
          {
            if (platformResponse.response.isNotEmpty) {
              final int elementKeysNumber =
                  platformResponse.response.first.keys.toList().length;
              if (elementKeysNumber == 1) {
                return PlatformAvgResponse(
                  responseData: platformResponse,
                  isMessageInArabic: isMessageInArabic,
                );
              } else if (elementKeysNumber == 2) {
                return PlatformChartResponse(
                    pdfTitle: context
                            .read<ChatHistoryCubit>()
                            .state
                            .platformMessages[currentMessageIndex - 1]
                            .content is String
                        ? context
                            .read<ChatHistoryCubit>()
                            .state
                            .platformMessages[currentMessageIndex - 1]
                            .content
                        : "data",
                    currentMessageIndex: currentMessageIndex,
                    responseData: platformResponse);
              } else {
                return PlatformTableResponse(
                    pdfTitle: context
                            .read<ChatHistoryCubit>()
                            .state
                            .platformMessages[currentMessageIndex - 1]
                            .content is String
                        ? context
                            .read<ChatHistoryCubit>()
                            .state
                            .platformMessages[currentMessageIndex - 1]
                            .content
                        : "data",
                    note: AppStrings().avgNote,
                    response: platformResponse,
                    isHasNote: true);
              }
            } else {
              return const InvalidQuestionWidget();
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
