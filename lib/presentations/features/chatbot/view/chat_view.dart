import 'package:easy_localization/easy_localization.dart';
import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/send_message_bloc/chat_bloc.dart';
import 'package:ebla/presentations/resources/assets_manager.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/language_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:ebla/presentations/widgets/taost_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _controller = TextEditingController();
  late ChatBotBloc chatBotBloc;
  late ChatHistoryCubit chatHistoryCubit;
  final ValueNotifier<bool> isSendEnabled = ValueNotifier<bool>(false);
  bool isSending = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    chatBotBloc = instance<ChatBotBloc>();
    chatHistoryCubit = ChatHistoryCubit();
    _controller.addListener(() {
      isSendEnabled.value = _controller.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    isSendEnabled.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    chatHistoryCubit.addMessage(MessageRequestModel(
        role: 'assistant', content: AppStrings().defultBotMessage));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: costumeChatAppBar(context),
      body: Stack(
        children: [
          // Background Image
          Opacity(
            opacity: 0.1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.logoPng),
                ),
              ),
            ),
          ),

          MultiBlocProvider(
            providers: [
              // BlocProvider(create: (_) => ChatHistoryCubit()),
              BlocProvider.value(value: chatHistoryCubit),
              BlocProvider.value(
                value: chatBotBloc,
              )
              // create: (context) =>
              //     ChatBloc(ElaiApiService(), context.read<ChatHistoryCubit>())),
            ],
            child: BlocConsumer<ChatBotBloc, ChatBotState>(
                listener: (context, sendState) {
                  sendState.map(
                      initial: (val) {},
                      loading: (val) {
                        isSending = true;
                      },
                      done: (val) {
                        chatHistoryCubit.addMessage(MessageRequestModel(
                          role: 'assistant',
                          content: val.response.message.content,
                        ));
                        isSending = false;
                      },
                      error: (val) {
                        errorToast(AppStrings().defaultError, context);
                        isSending = false;
                      });
                },
                bloc: chatBotBloc,
                builder: (context, sendState) {
                  return Column(
                    children: <Widget>[
                      ClipPath(
                        clipper: AppBarClipper(),
                        child: Container(
                          height: preferredSize.height,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                ColorManager.primary,
                                ColorManager.primary.withOpacity(.8),
                              ], // Blue gradient
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(AppSizeW.s8),
                          child:
                              BlocConsumer<ChatHistoryCubit, ChatHistoryState>(
                            listener: (context, state) {},
                            bloc: chatHistoryCubit,
                            builder: (context, messageHistory) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSizeW.s10),
                                child: ListView.builder(
                                  controller: _scrollController,
                                  itemCount: context
                                          .read<ChatHistoryCubit>()
                                          .state
                                          .messages
                                          .length +
                                      (isSending ? 1 : 0),
                                  itemBuilder: (context, index) {
                                    //-----------------Loading container-------------
                                    if (isSending &&
                                        index ==
                                            messageHistory.messages.length) {
                                      return const ShownLoadingIndecetorWidget();
                                    }
                                    //-----------------main message-------------
                                    final message =
                                        messageHistory.messages[index];
                                    return ShownMessageWidget(message: message);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppSizeW.s8),
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: AppSizeW.s40,
                                height: AppSizeH.s40,
                                padding: EdgeInsets.symmetric(
                                    horizontal: AppSizeW.s5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color:
                                                Theme.of(context).hoverColor))),
                                child: Image.asset(
                                  ImageAssets.chatBot,
                                  // color:Theme.of(context).primaryColor,
                                )),
                            SizedBox(
                              width: AppSizeW.s5,
                            ),
                            /*========================For record========================= */
                            GestureDetector(child: Icon(Icons.mic)),
                            SizedBox(
                              width: AppSizeW.s5,
                            ),
                            Expanded(
                              child: ReraTextFaild(
                                onChange: (p0) {
                                  _controller.text = p0;
                                },
                                controller: _controller,
                                readOnly: false,
                                enabled: true,
                                prefixIcon: null,
                                hint: AppStrings().writeUourMessage,
                              ),
                            ),
                            ValueListenableBuilder<bool>(
                                valueListenable: isSendEnabled,
                                builder: (context, enabled, child) {
                                  return SendButtonWidget(
                                    scrollController: _scrollController,
                                    enabled: enabled,
                                    controller: _controller,
                                  );
                                }),
                            // sendState.map(initial: (value) {
                            //   return ValueListenableBuilder<bool>(
                            //       valueListenable: isSendEnabled,
                            //       builder: (context, enabled, child) {
                            //         return SendButtonWidget(
                            //           scrollController: _scrollController,
                            //           enabled: enabled,
                            //           controller: _controller,
                            //         );
                            //       });
                            // }, loading: (val) {
                            //   return Opacity(
                            //     opacity: .5,
                            //     child: IconButton(
                            //       icon: const Icon(Icons.send),
                            //       onPressed: () {},
                            //     ),
                            //   );
                            // }, error: (val) {
                            //   return ValueListenableBuilder<bool>(
                            //       valueListenable: isSendEnabled,
                            //       builder: (context, enabled, child) {
                            //         return SendButtonWidget(
                            //           scrollController: _scrollController,
                            //           enabled: enabled,
                            //           controller: _controller,
                            //         );
                            //       });
                            // }, done: (loaded) {
                            //   return ValueListenableBuilder<bool>(
                            //       valueListenable: isSendEnabled,
                            //       builder: (context, enabled, child) {
                            //         return SendButtonWidget(
                            //           scrollController: _scrollController,
                            //           enabled: enabled,
                            //           controller: _controller,
                            //         );
                            //       });
                            // }),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  Size get preferredSize => Size.fromHeight(AppSizeH.s40);
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 35);

    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height - 40, size.width, size.height - 20);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class SendButtonWidget extends StatelessWidget {
  final bool enabled;
  final TextEditingController controller;
  final ScrollController scrollController;
  const SendButtonWidget({
    super.key,
    required this.enabled,
    required this.controller,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: !enabled ? .5 : 1,
      child: GestureDetector(
        onTap: !enabled
            ? () {}
            : () {
                final message = controller.text;
                if (message.isNotEmpty) {
                  //--------------
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (scrollController.hasClients) {
                      scrollController.animateTo(
                        scrollController.position.maxScrollExtent +
                            AppSizeH.s30,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    }
                  });

                  //--------------
                  final userMessage =
                      MessageRequestModel(content: message, role: 'user');
                  BlocProvider.of<ChatHistoryCubit>(context)
                      .addMessage(userMessage);
                  // Send the user's message as a ChatMessage instance
                  // chatBotBloc.add(
                  BlocProvider.of<ChatBotBloc>(context).add(
                      SendMessageEvent.started(ChatbotRequestModel(
                          streamId: null,
                          messages: BlocProvider.of<ChatHistoryCubit>(context)
                              .state
                              .messages)));
                  controller.clear();
                }
              },
        child: Container(
            padding: EdgeInsets.all(AppSizeW.s10),
            margin: EdgeInsets.symmetric(horizontal: AppSizeH.s5),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorManager.primary,
                    ColorManager.primary.withOpacity(.7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(AppSizeR.s100)),
            child: Center(
              child: Icon(
                Icons.send_rounded,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            )),
      ),
    );
  }
}

class ShownLoadingIndecetorWidget extends StatelessWidget {
  const ShownLoadingIndecetorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSizeW.s30,
          width: AppSizeW.s30,
          child: const Image(
            image: AssetImage(ImageAssets.chatBot),
          ),
        ),
        SizedBox(width: AppSizeW.s5),
        Flexible(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizeW.s15, vertical: AppSizeH.s10),
            margin: EdgeInsets.symmetric(vertical: AppSizeH.s15),
            decoration: BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: context.locale == ARABIC_LOCAL
                    ? BorderRadius.only(
                        topLeft: Radius.circular(AppSizeR.s15),
                        topRight: Radius.zero,
                        bottomLeft: Radius.circular(AppSizeR.s15),
                        bottomRight: Radius.circular(AppSizeR.s15))
                    : BorderRadius.only(
                        topLeft: Radius.zero,
                        topRight: Radius.circular(AppSizeR.s15),
                        bottomLeft: Radius.circular(AppSizeR.s15),
                        bottomRight: Radius.circular(AppSizeR.s15))),
            child: SizedBox(
                height: AppSizeH.s40,
                width: AppSizeH.s40,
                child: Lottie.asset(ImageAssets.chatBotIndecetor)),
          ),
        ),
      ],
    );
  }
}

class ShownMessageWidget extends StatelessWidget {
  const ShownMessageWidget({
    super.key,
    required this.message,
    //  required this.animation
  });
  final MessageRequestModel message;
//  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return Row(
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
                    ? Theme.of(context).primaryColor
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
            child: Text(message.content,
                textAlign: message.role == 'user' ? TextAlign.center : null,
                style: TextStyle(
                    color: message.role == 'user'
                        ? ColorManager.white
                        : Theme.of(context).textTheme.bodySmall!.color)),
          ),
        ),
      ],
    );
  }
}

AppBar costumeChatAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    // flexibleSpace: ShaderMask(
    //   shaderCallback: (rect) {
    //     return const LinearGradient(
    //       begin: Alignment.topCenter,
    //       end: Alignment.bottomCenter,
    //       colors: [Colors.black, Colors.transparent],
    //     ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
    //   },
    //   blendMode: BlendMode.dstIn,
    //   child: Image.asset(
    //     ImageAssets.appbarBg,
    //     fit: BoxFit.fill,
    //   ),
    // ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorManager.primary,
            ColorManager.primary.withOpacity(.8),
            // ColorManager.primary,
          ], // Blue Gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
    title: Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.maybePop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.arrow_back,
                color: ColorManager.cloudyGrey,
              ),
              SizedBox(width: AppSizeW.s5),
              Text(
                AppStrings().main,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class ReraTextFaild extends StatelessWidget {
  final String hint;
  final String? errorMsg;
  final Widget? prefixIcon;
  final bool enabled;
  final bool readOnly;
  final TextEditingController? controller;
  final dynamic validator;
  final TextInputType? textInputType;
  // final List<TextInputFormatter>? inputFormatter;
  final bool? isBigFaild;
  final Function(String)? onChange;

  const ReraTextFaild({
    super.key,
    required this.hint,
    this.prefixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.controller,
    this.validator,
    this.errorMsg,
    this.onChange,
    this.textInputType,
    // this.inputFormatter,
    this.isBigFaild,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //to format the phone number
      // inputFormatters: [
      //   if (textInputType == TextInputType.number)
      //     FilteringTextInputFormatter.digitsOnly,
      // ],
      keyboardType: textInputType,
      style: Theme.of(context).textTheme.bodyMedium,
      onChanged: onChange,
      enabled: enabled,
      readOnly: readOnly,
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUnfocus,
      minLines: isBigFaild != null ? 4 : null,
      maxLines: isBigFaild != null ? null : 1,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontWeight:
              enabled || !readOnly ? FontWeight.normal : FontWeight.bold,
          fontSize:
              Theme.of(context).textTheme.bodySmall?.fontSize ?? AppSizeW.s14,
          color: enabled
              ? Theme.of(context).cardColor
              : Theme.of(context).primaryColor,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        //  enabled
        //     ? Theme.of(context).inputDecorationTheme.hintStyle
        //     : Theme.of(context).textTheme.titleSmall,
        fillColor: ColorManager.white,
        errorText: errorMsg,
        // prefixIcon:
        //     Padding(padding: EdgeInsets.all(AppSizeW.s5), child: prefixIcon),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s15),
            borderSide:
                BorderSide(color: ColorManager.lightSilver, width: 0.5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s15),
            borderSide:
                BorderSide(color: ColorManager.lightSilver, width: 0.5)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s15),
            borderSide:
                BorderSide(color: ColorManager.lightSilver, width: 0.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s15),
            borderSide:
                BorderSide(color: ColorManager.lightSilver, width: 0.5)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeR.s15),
            borderSide: BorderSide(color: ColorManager.red, width: 0.5)),
      ),
    );
  }
}
