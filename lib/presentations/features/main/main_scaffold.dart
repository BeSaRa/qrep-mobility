// ignore_for_file: use_build_context_synchronously

import 'package:ebla/presentations/features/chatbot/blocs/record_cubit/voice_cubit.dart';
import 'package:ebla/presentations/widgets/aqarat_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/depndency_injection.dart';
import '../../../domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import '../../resources/resources.dart';

import '../chatbot/blocs/drobdown_cubit.dart';
import '../chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import '../chatbot/blocs/send_feedback_bloc/send_feedback_bloc.dart';
import '../chatbot/routes_extras.dart';
import '../navigation_pages/aqarat_drawer.dart';
import 'cubit/bottom_nav_cubit.dart';

class MainScaffold extends StatefulWidget {
  // final StatefulNavigationShell navigationShell;
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold>
    with TickerProviderStateMixin {
  // late int currentPage;
  late TabController _controller;

  late ChatHistoryCubit chatHistoryCubit;
  late DropdownCubit dropdownCubit;
  late SendFeedbackBloc sendFeedbackBloc;
  final voiceCubit = VoiceCubit();

  @override
  void initState() {
    super.initState();

    // currentPage = context.read<BottomNavCubit>().currentPage;
    _controller = TabController(
      length: 5,
      vsync: this,
    );
    chatHistoryCubit = ChatHistoryCubit();
    dropdownCubit = DropdownCubit();
    sendFeedbackBloc = instance<SendFeedbackBloc>();
  }

  @override
  Widget build(BuildContext context) {
    _controller.animateTo(context.read<BottomNavCubit>().state,
        duration: kTabScrollDuration, curve: Curves.ease);
    // Add default message based on the active chat type
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Check if it's the first time or if there are no messages yet
      if (chatHistoryCubit.state.authorityMessages.isEmpty &&
          chatHistoryCubit.state.platformMessages.isEmpty) {
        // Add default message based on active chat
        chatHistoryCubit.addMessage(MessageRequestModel(
          role: 'assistant',
          content: AppStrings().defaultAuthorityBotMessage,
        ));
        chatHistoryCubit.state.platformMessages.add(MessageRequestModel(
          role: 'assistant',
          content: AppStrings().defaultPlatformBotMessage,
        ));
        // chatHistoryCubit.addMessage(MessageRequestModel(
        //   role: 'assistant',
        //   content: AppStrings().defaultPlatformBotMessage,
        // ));
      }
    });
    return BlocBuilder(
      bloc: context.read<BottomNavCubit>(),
      builder: (context, state) {
        return Scaffold(
          drawer: const AqaratDrawer(),
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            toolbarHeight: AppSizeH.s80,
            backgroundColor: Colors.transparent,
            leading: Builder(builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: AppSizeR.s30,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            }),
            title: SizedBox(
              height: AppSizeW.s80,
              width: AppSizeW.s226,
              child: const Image(
                image: AssetImage(ImageAssets.ministryOfMunicipalityDark),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: AppSizeR.s30,
                ),
                onPressed: () {
                  context.pushNamed(RoutesNames.aiSearch, extra: voiceCubit);
                },
              )
            ],
          ),
          backgroundColor: Theme.of(context).primaryColor,
          body: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppSizeR.s20),
                      topLeft: Radius.circular(AppSizeR.s20))),
              child: widget.child),
          bottomNavigationBar: BlocProvider.value(
            value: chatHistoryCubit,
            child: AqaratNavigationBar(
              onTap: (index) async {
                switch (index) {
                  case 0:
                    break;
                  case 1:
                    break;
                  case 2:
                    await initChatbotModule();
                    break;
                  case 3:
                    break;
                  case 4:
                    await initMortgageModule();
                    await initSellModule();
                    await initRentModule();
                    await initHomeModule();
                  // await initChatbotModule();
                  // initLoginModule();

                  default:
                    null;
                }

                context.read<BottomNavCubit>().changePage(index);
                if (index == 2) {
                  context.goNamed(
                    context.read<BottomNavCubit>().paths[index],
                    extra: RouteExtras(
                        voiceCubit: voiceCubit,
                        chatHistoryCubit: chatHistoryCubit,
                        dropdownCubit: dropdownCubit,
                        sendFeedbackBloc: sendFeedbackBloc),
                  );
                } else {
                  context.goNamed(context.read<BottomNavCubit>().paths[index]);
                }
              },
              body: Container(
                color: Colors.transparent,
              ),
              // currentPage: context.watch<BottomNavCubit>().state,
              controller: _controller,
            ),
          ),
        );
      },
    );
  }
}
