import 'dart:ui';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/depndency_injection.dart';
import '../../../../domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import '../../../resources/values_manager.dart';
import '../blocs/chat_faq_bloc/chat_faq_bloc.dart';
import '../blocs/messages_history_bloc/chat_history_cubit.dart';
import '../blocs/send_message_bloc/chat_bloc.dart';
import '../blocs/stream_id_cubit.dart/stream_id_cubit.dart';

class FAQListWidget extends StatefulWidget {
  const FAQListWidget({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<FAQListWidget> createState() => _FAQListWidgetState();
}

class _FAQListWidgetState extends State<FAQListWidget> {
  late ChatFaqBloc chatFaqBloc;
  @override
  void initState() {
    super.initState();
    chatFaqBloc = instance<ChatFaqBloc>();
    chatFaqBloc.add(const ChatFaqEvent.started("website"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: chatFaqBloc,
      child: BlocConsumer<ChatFaqBloc, ChatFaqState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.maybeMap(
              // error: (value) {

              // },
              done: (value) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizeW.s20),
                  child: SizedBox(
                    height: AppSizeH.s50,
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 500),
                      tween: Tween(begin: 0, end: 1),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 30 * (1 - value)),
                            child: child,
                          ),
                        );
                      },
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.response.length,
                        itemBuilder: (context, index) {
                          final message = value.response[index].actualQuestion;
                          return GestureDetector(
                            onTap: () {
                              if (message.isNotEmpty) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  if (widget.scrollController.hasClients) {
                                    widget.scrollController.animateTo(
                                      widget.scrollController.position
                                              .maxScrollExtent +
                                          AppSizeH.s30,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeOut,
                                    );
                                  }
                                });
                                // Send the user's message as a ChatMessage instance
                                context
                                    .read<ChatHistoryCubit>()
                                    .sanitizeAuthorityMessages();
                                final userMessage = MessageRequestModel(
                                    content: message, role: 'user');
                                context
                                    .read<ChatHistoryCubit>()
                                    .addMessage(userMessage);
                                BlocProvider.of<ChatBotBloc>(context).add(
                                    SendMessageEvent.started(
                                        ChatbotRequestModel(
                                  streamId:
                                      BlocProvider.of<StreamIdCubit>(context)
                                          .state
                                          .streamId,
                                  messages: context
                                      .read<ChatHistoryCubit>()
                                      .state
                                      .authorityMessages,
                                )));
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: AppSizeH.s5,
                                horizontal: AppSizeW.s5,
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(AppSizeR.s20),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 8.0, sigmaY: 8.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: AppSizeW.s10),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .canvasColor
                                          .withValues(alpha: 0.2),
                                      border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? ColorManager.white
                                              : ColorManager.blackBG,
                                          width: AppSizeW.s1),
                                      borderRadius:
                                          BorderRadius.circular(AppSizeR.s20),
                                    ),
                                    child: Text(
                                      value.response[index].actualQuestion,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              orElse: () {
                return const SizedBox.shrink();
              },
            );
          }),
    );
  }
}
