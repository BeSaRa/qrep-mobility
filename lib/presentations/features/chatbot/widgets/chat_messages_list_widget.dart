import 'package:ebla/domain/usecases/chatbot_usecase/send_feedback_usecase.dart';
import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/send_feedback_bloc/send_feedback_bloc.dart';
import 'package:ebla/presentations/features/chatbot/utility/chatbot_enums.dart';
import 'package:ebla/presentations/features/chatbot/widgets/shown_loading_indecator.dart';
import 'package:ebla/presentations/features/chatbot/widgets/shown_message_widget.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:ebla/presentations/widgets/taost_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatMessagesListWidget extends StatelessWidget {
  const ChatMessagesListWidget({
    super.key,
    required this.isSending,
    required this.isAvatarPressed,
    required this.scrollController,
  });

  final ScrollController scrollController;
  final bool isSending;
  final bool isAvatarPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizeW.s8),
      child: BlocConsumer<ChatHistoryCubit, ChatHistoryState>(
        listener: (context, state) {},
        builder: (context, messageHistory) {
          //-----------------------------------------
          // ✅ Get messages for the active chat
          final chatState = context.read<ChatHistoryCubit>().state;
          final messages = chatState.activeChat == ChatTypeEnum.authority
              ? chatState.authorityMessages
              : chatState.platformMessages;
          //-----------------------------------------
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizeW.s10),
            child: ListView.builder(
              controller: scrollController,
              // itemCount: messageHistory.messages.length + (isSending ? 1 : 0),
              itemCount: messages.length + (isSending ? 1 : 0),
              itemBuilder: (context, index) {
                //-----------------Loading container-------------
                // if (isSending && index == messageHistory.messages.length) {
                if (isSending && index == messages.length) {
                  return const ShownLoadingIndecetorWidget();
                } else {
                  //-----------------main message-------------
                  final message = messages[index];
                  final isHadBeenRated =
                      context.read<SendFeedbackBloc>().state.maybeMap(
                            done: (state) => state.isRated,
                            orElse: () => false,
                          );
                  // final message = messageHistory.messages[index];
                  return Column(
                    crossAxisAlignment: message.role == 'user'
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      ShownMessageWidget(
                          currentMessageIndex: index,
                          isAvatarShow: isAvatarPressed,
                          message: message),
                      if (message.role != "user" &&
                          index == messages.length - 1 &&
                          !isSending &&
                          chatState.activeChat == ChatTypeEnum.authority &&
                          //here i will not show the feedback if there is just the welcome message in the lest
                          chatState.authorityMessages.length != 1 &&
                          //here i will not show the feedback if it had beed rated before
                          !isHadBeenRated)
                        _RateConversationWidget(
                          isVisible:
                              true, // Show animation when condition is met
                          onLike: () {
                            final convId = message.authorityConvId ?? "";
                            if (convId != "") {
                              context.read<SendFeedbackBloc>().add(
                                    SendFeedbackEvent.sendFeedBack(
                                      MainSendFeedbackRequestModel(
                                        convId: convId,
                                        feedback: 1,
                                      ),
                                    ),
                                  );
                            }
                          },
                          onDislike: () {
                            final convId = message.authorityConvId ?? "";
                            if (convId != "") {
                              context.read<SendFeedbackBloc>().add(
                                    SendFeedbackEvent.sendFeedBack(
                                      MainSendFeedbackRequestModel(
                                        convId: convId,
                                        feedback: 0,
                                      ),
                                    ),
                                  );
                            }
                          },
                        ),
                    ],
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class _RateConversationWidget extends StatefulWidget {
  final bool isVisible;
  final VoidCallback onLike;
  final VoidCallback onDislike;

  const _RateConversationWidget({
    required this.isVisible,
    required this.onLike,
    required this.onDislike,
    Key? key,
  }) : super(key: key);

  @override
  _RateConversationWidgetState createState() => _RateConversationWidgetState();
}

class _RateConversationWidgetState extends State<_RateConversationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from bottom
      end: Offset.zero, // Move to normal position
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    if (widget.isVisible) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant _RateConversationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizeW.s10),
        child: BlocListener<SendFeedbackBloc, SendFeedbackState>(
          listener: (context, state) {
            state.mapOrNull(
              error: (value) {
                errorToast(value.message, context);
              },
            );
          },
          child: Row(
            spacing: AppSizeH.s10,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                AppStrings().rateTheCOnversation,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              GestureDetector(
                onTap: widget.onLike,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      color: Theme.of(context).textTheme.labelSmall!.color,
                      size: AppSizeW.s18,
                    ),
                    Text(
                      AppStrings().like,
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: widget.onDislike,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.thumb_down_alt_outlined,
                      color: Theme.of(context).textTheme.labelSmall!.color,
                      size: AppSizeW.s18,
                    ),
                    Text(
                      AppStrings().dislike,
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
