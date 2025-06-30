import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/models/chatboot/new_chatbot_response_models/new_chatbot_response_model.dart';
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
    String content = '';

    if (message.content is String) {
      content = message.content;
      isMessageInArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(content);
    } else if (message.content is NewChatbotResponseModel) {
      final response = message.content as NewChatbotResponseModel;
      content = response.data.content;
      isMessageInArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(content);
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
                        isPDFFileLoadingForSAS: isPDFFileLoadingForSAS,
                        content: content),
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

class FormattedDataWidget extends StatefulWidget {
  final bool isMessageInArabic;
  final MessageRequestModel message;
  final int currentMessageIndex;
  final String content;
  final ValueNotifier<bool> isPDFFileLoadingForSAS;
  final Stream<String>? contentStream;
  const FormattedDataWidget({
    super.key,
    required this.isMessageInArabic,
    required this.message,
    required this.currentMessageIndex,
    required this.isPDFFileLoadingForSAS,
    required this.content,
    this.contentStream,
  });

  @override
  State<FormattedDataWidget> createState() => _FormattedDataWidgetState();
}

class _FormattedDataWidgetState extends State<FormattedDataWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final ValueNotifier<TypingAnimationState> _animationState = ValueNotifier(
    TypingAnimationState(displayText: '', isComplete: false),
  );

  Timer? _timer;
  int _currentLetterIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.message.role != 'user') {
      _startTypingAnimation();
    } else {
      _animationState.value = TypingAnimationState(
        displayText: widget.content,
        isComplete: true,
      );
    }
  }

  void _startTypingAnimation() {
    if (_animationState.value.isComplete) {
      return;
    }

    _currentLetterIndex = 0;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      if (_currentLetterIndex < widget.content.length) {
        _animationState.value = TypingAnimationState(
          displayText: widget.content.substring(0, _currentLetterIndex + 1),
          isComplete: false,
        );
        _currentLetterIndex++;
      } else {
        timer.cancel();
        _animationState.value = TypingAnimationState(
          displayText: widget.content,
          isComplete: true,
        );
        if (widget.message.content is NewChatbotResponseModel) {
          context.read<ChatHistoryCubit>().sanitizeAuthorityMessages();
        }
      }
    });
  }

  @override
  void didUpdateWidget(covariant FormattedDataWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.content != widget.content &&
        !_animationState.value.isComplete) {
      _startTypingAnimation();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationState.dispose();
    super.dispose();
  }

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

  // List<TextSpan> _buildStringContentWithLinks(
  //     MessageRequestModel message, BuildContext context) {
  //   final citations = message.contextData?.citations ?? [];
  //   final RegExp regex = RegExp(r'\[doc(\d+)\]');
  //   final content = message.content.toString();

  //   final List<TextSpan> spans = [];
  //   int start = 0;

  //   // Get the default text style from theme
  //   final defaultStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
  //         color: message.role == 'user'
  //             ? ColorManager.white
  //             : Theme.of(context).textTheme.bodyMedium!.color,
  //       );

  //   for (final match in regex.allMatches(content)) {
  //     final matchStart = match.start;
  //     final matchEnd = match.end;
  //     final matchText = match.group(0)!;
  //     final docIndex = int.parse(match.group(1)!);

  //     // Add the text before the match
  //     if (start < matchStart) {
  //       spans.add(TextSpan(
  //         text: content.substring(start, matchStart),
  //         style: defaultStyle,
  //       ));
  //     }

  //     // Add the clickable 📎 icon
  //     if (docIndex - 1 < citations.length && citations.isNotEmpty) {
  //       final url = citations[docIndex - 1].url;
  //       spans.add(TextSpan(
  //         text: '📎',
  //         style: defaultStyle.copyWith(
  //           decoration: TextDecoration.underline,
  //         ),
  //         recognizer: TapGestureRecognizer()
  //           ..onTap = () async {
  //             if (url.contains('blob.core.windows')) {
  //               context
  //                   .read<SasPdfBloc>()
  //                   .add(SasPdfEvent.getSasPdf(request: url));
  //             } else {
  //               if (await canLaunchUrl(Uri.parse(url))) {
  //                 await launchUrl(Uri.parse(url),
  //                     mode: LaunchMode.externalApplication);
  //               }
  //             }
  //             // if (await canLaunchUrl(Uri.parse(url))) {
  //             //   await launchUrl(Uri.parse(url),
  //             //       mode: LaunchMode.externalApplication);
  //             // }
  //           },
  //       ));
  //     } else {
  //       // fallback if citation not found
  //       spans.add(TextSpan(
  //         text: matchText,
  //         style: defaultStyle,
  //       ));
  //     }

  //     start = matchEnd;
  //   }

  //   // Add the remaining text after the last match
  //   if (start < content.length) {
  //     spans.add(TextSpan(
  //       text: content.substring(start),
  //       style: defaultStyle,
  //     ));
  //   }

  //   return spans;
  // }

  List<TextSpan> parseMarkdownLinks(String text, BuildContext context) {
    final RegExp linkRegExp = RegExp(r'\[([^\]]+)\]\(([^)]+)\)');
    final List<TextSpan> spans = [];
    int currentIndex = 0;

    final matches = linkRegExp.allMatches(text);

    for (final match in matches) {
      final start = match.start;
      final end = match.end;
      final title = match.group(1)!;
      final url = match.group(2)!;

      // Add text before the link
      if (start > currentIndex) {
        spans.add(TextSpan(text: text.substring(currentIndex, start)));
      }

      // Add the link as clickable text
      spans.add(
        TextSpan(
          text: title,
          style: TextStyle(
              color: ColorManager.primary,
              decoration: TextDecoration.underline),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              final fileName = title.replaceAll(' ', '_'); // safe name

              if (url.contains('blob.core.windows')) {
                context.read<SasPdfBloc>().add(
                    SasPdfEvent.getSasPdf(request: url, fileName: fileName));
              } else {
                if (await canLaunchUrl(Uri.parse(url))) {
                  await launchUrl(Uri.parse(url),
                      mode: LaunchMode.externalApplication);
                }
              }
            },
        ),
      );

      currentIndex = end;
    }

    // Add any remaining text after last match
    if (currentIndex < text.length) {
      spans.add(TextSpan(text: text.substring(currentIndex)));
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ValueListenableBuilder<TypingAnimationState>(
        valueListenable: _animationState,
        builder: (context, state, _) {
          if (widget.message.content is String) {
            return BlocListener<SasPdfBloc, SasPdfState>(
              listener: (context, sasState) {
                sasState.mapOrNull(loading: (value) {
                  widget.isPDFFileLoadingForSAS.value = true;
                }, done: (value) async {
                  await onSasDone(value);
                });
              },
              child: Text.rich(
                TextSpan(
                  children: parseMarkdownLinks(widget.message.content, context),
                  // children: _buildStringContentWithLinks(widget.message, context),
                ),
                textDirection: widget.isMessageInArabic
                    ? ui.TextDirection.rtl
                    : ui.TextDirection.ltr,
                textAlign:
                    widget.message.role == 'user' ? TextAlign.center : null,
              ),
            );
          } else if ((widget.message.content is NewChatbotResponseModel)) {
            return BlocListener<SasPdfBloc, SasPdfState>(
              listener: (context, sasState) {
                sasState.mapOrNull(
                  loading: (value) {
                    widget.isPDFFileLoadingForSAS.value = true;
                  },
                  done: (value) async {
                    await onSasDone(value);
                  },
                );
              },
              child: Text.rich(
                TextSpan(
                  children: parseMarkdownLinks(state.displayText, context),
                ),
                textDirection: widget.isMessageInArabic
                    ? ui.TextDirection.rtl
                    : ui.TextDirection.ltr,
                textAlign:
                    widget.message.role == 'user' ? TextAlign.center : null,
              ),
            );
          } else if (widget.message.content is PlatformChatbotResponseModel) {
            final platformResponse =
                widget.message.content as PlatformChatbotResponseModel;
            switch (platformResponse.responseFormat) {
              //-----------------------------------------------------------------------------
              case "OTHER":
                {
                  if (platformResponse.response.isNotEmpty) {
                    return PlatformTableResponse(
                        pdfTitle: context
                                .read<ChatHistoryCubit>()
                                .state
                                .platformMessages[
                                    widget.currentMessageIndex - 1]
                                .content is String
                            ? context
                                .read<ChatHistoryCubit>()
                                .state
                                .platformMessages[
                                    widget.currentMessageIndex - 1]
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
                                  .platformMessages[
                                      widget.currentMessageIndex - 1]
                                  .content is String
                              ? context
                                  .read<ChatHistoryCubit>()
                                  .state
                                  .platformMessages[
                                      widget.currentMessageIndex - 1]
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
                                    .platformMessages[
                                        widget.currentMessageIndex - 1]
                                    .content is String
                                ? context
                                    .read<ChatHistoryCubit>()
                                    .state
                                    .platformMessages[
                                        widget.currentMessageIndex - 1]
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
                                  .platformMessages[
                                      widget.currentMessageIndex - 1]
                                  .content is String
                              ? context
                                  .read<ChatHistoryCubit>()
                                  .state
                                  .platformMessages[
                                      widget.currentMessageIndex - 1]
                                  .content
                              : "data",
                          responseData: platformResponse,
                          currentMessageIndex: widget.currentMessageIndex);
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
                        isMessageInArabic: widget.isMessageInArabic,
                      );
                    } else if (elementKeysNumber == 2) {
                      return PlatformChartResponse(
                          pdfTitle: context
                                  .read<ChatHistoryCubit>()
                                  .state
                                  .platformMessages[
                                      widget.currentMessageIndex - 1]
                                  .content is String
                              ? context
                                  .read<ChatHistoryCubit>()
                                  .state
                                  .platformMessages[
                                      widget.currentMessageIndex - 1]
                                  .content
                              : "data",
                          currentMessageIndex: widget.currentMessageIndex,
                          responseData: platformResponse);
                    } else {
                      return PlatformTableResponse(
                          pdfTitle: context
                                  .read<ChatHistoryCubit>()
                                  .state
                                  .platformMessages[
                                      widget.currentMessageIndex - 1]
                                  .content is String
                              ? context
                                  .read<ChatHistoryCubit>()
                                  .state
                                  .platformMessages[
                                      widget.currentMessageIndex - 1]
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
        });
  }

  Future<void> onSasDone(value) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final rawTitle = value.fileName;
      final safeFileName = rawTitle
          .replaceAll(RegExp(r'[\\/:*?"<>|]'), '') // Remove illegal chars
          .replaceAll(' ', '_') // Replace spaces
          .trim();

      final filePath = '${tempDir.path}/$safeFileName.pdf';
      // final filePath = '${tempDir.path}/temp_pdf.pdf';
      final response = await Dio().get(
        value.response,
        options: Options(responseType: ResponseType.bytes),
      );
      final file = File(filePath);
      await file.writeAsBytes(response.data);
      widget.isPDFFileLoadingForSAS.value = false;
      await OpenFile.open(filePath);
    } catch (e) {
      log("Error opening PDF: $e");
      final uri = Uri.parse(value.response);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } finally {
      widget.isPDFFileLoadingForSAS.value = false;
    }
  }
}

class TypingAnimationState {
  final String displayText;
  final bool isComplete;

  TypingAnimationState({
    required this.displayText,
    required this.isComplete,
  });
}
