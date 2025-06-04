// import 'package:ebla/presentations/resources/assets_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ChatViewTest extends StatefulWidget {
//   const ChatViewTest({super.key});

//   @override
//   State<ChatViewTest> createState() => _ChatViewTestState();
// }

// class _ChatViewTestState extends State<ChatViewTest> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           //================= 1 ================
//           // Background Image
//           Opacity(
//             opacity: 0.1,
//             child: Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(ImageAssets.logoPng),
//                 ),
//               ),
//             ),
//           ),
//           //================= 2 ================
//           //Ai Avatar
//           //================= 3 ================
//           ValueListenableBuilder<bool>(
//               valueListenable: isAvatarExpanded,
//               builder: (context, isAvatarPressed, child) {
//                 return Positioned(
//                   bottom: !isAvatarPressed ? null : 0,
//                   left: !isAvatarPressed ? null : 0,
//                   right: !isAvatarPressed ? null : 0,
//                   child: MultiBlocProvider(
//                     providers: [
//                       BlocProvider<ChatHistoryCubit>.value(
//                           value: BlocProvider.of<ChatHistoryCubit>(context)),
//                       BlocProvider.value(value: chatBotBloc),
//                       BlocProvider.value(value: startStreamBloc),
//                       BlocProvider.value(value: closeStreamBloc),
//                       BlocProvider.value(
//                           value: BlocProvider.of<VoiceCubit>(context)),
//                       BlocProvider.value(
//                           value: BlocProvider.of<DropdownCubit>(context)),
//                       BlocProvider.value(value: streamIdCubit),
//                       BlocProvider.value(value: sendAnswerAndCandidateBloc),
//                       BlocProvider<SendFeedbackBloc>.value(
//                           value: BlocProvider.of<SendFeedbackBloc>(context)),
//                       //zak
//                       BlocProvider(
//                         create: (context) => StreamBloc(
//                           startStreamUsecase: instance<StartStreamUsecase>(),
//                           sendAnswerUsecase: instance<SendAnswerUsecase>(),
//                           sendCandidateUsecase:
//                               instance<SendCandidateUsecase>(),
//                         ),
//                       )
//                       // BlocProvider.value(value: webRTCCubit),
//                     ],
//                     child: BlocConsumer<ChatBotBloc, ChatBotState>(
//                         listener: (context, sendState) {
//                           sendState.map(
//                               initial: (val) {},
//                               loading: (val) {
//                                 isMessageSending = true;
//                               },
//                               done: (val) {
//                                 //----- if i'm in authority-----
//                                 if (val.response != null) {
//                                   context.read<ChatHistoryCubit>().addMessage(
//                                       MessageRequestModel(
//                                           role: 'assistant',
//                                           contextData: val
//                                               .response!.message.contextModel,
//                                           content:
//                                               val.response!.message.content,
//                                           //i will add the conv id for thefeedback
//                                           authorityConvId: val.response!.message
//                                               .conversationId));
//                                 }
//                                 //----- if i'm in platform-----
//                                 else {
//                                   context
//                                       .read<ChatHistoryCubit>()
//                                       .addMessage(MessageRequestModel(
//                                         role: 'assistant',
//                                         content: val.platformResponse,
//                                       ));
//                                 }
//                                 isMessageSending = false;
//                               },
//                               error: (val) {
//                                 if (mounted) {
//                                   errorToast(
//                                       AppStrings().defaultError, context);
//                                 }
//                                 isMessageSending = false;
//                               });
//                         },
//                         bloc: chatBotBloc,
//                         builder: (context, sendState) {
//                           return Column(
//                             children: <Widget>[
//                               if (!isAvatarPressed)
//                                 Flexible(
//                                     child: Stack(
//                                   children: [
//                                     ChatMessagesListWidget(
//                                       scrollController: scrollController,
//                                       isSending: isMessageSending,
//                                       isAvatarPressed: isAvatarPressed,
//                                     ),
//                                     Positioned(
//                                       bottom: AppSizeH.s0,
//                                       right: AppSizeW.s15,
//                                       child: ValueListenableBuilder<bool>(
//                                         valueListenable: showScrollDownButton,
//                                         builder: (context, visible, _) {
//                                           return AnimatedSwitcher(
//                                             duration: const Duration(
//                                                 milliseconds: 300),
//                                             transitionBuilder:
//                                                 (child, animation) {
//                                               return FadeTransition(
//                                                   opacity: animation,
//                                                   child: child);
//                                             },
//                                             child: visible
//                                                 ? GestureDetector(
//                                                     key: const ValueKey(
//                                                         'visible'),
//                                                     onTap: () {
//                                                       if (scrollController
//                                                           .hasClients) {
//                                                         // setState(() {
//                                                         scrollController
//                                                             .animateTo(
//                                                           scrollController
//                                                                   .position
//                                                                   .maxScrollExtent +
//                                                               AppSizeH.s30,
//                                                           duration:
//                                                               const Duration(
//                                                                   milliseconds:
//                                                                       300),
//                                                           curve: Curves.easeOut,
//                                                         );
//                                                         // });
//                                                       }
//                                                     },
//                                                     child: Container(
//                                                       padding: EdgeInsets.all(
//                                                           AppSizeW.s5),
//                                                       decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(
//                                                                     AppSizeR
//                                                                         .s100),
//                                                         color: ColorManager
//                                                             .greyCloud,
//                                                       ),
//                                                       child: Icon(
//                                                         Icons
//                                                             .arrow_downward_outlined,
//                                                         color:
//                                                             ColorManager.white,
//                                                       ),
//                                                     ),
//                                                   )
//                                                 : const SizedBox.shrink(
//                                                     key: ValueKey('hidden')),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 )),

//                               //zak
//                               //===================================
//                               if (isAvatarPressed)
//                                 SizedBox(
//                                   height:
//                                       MediaQuery.sizeOf(context).height / 1.6,
//                                   child: ChatMessagesListWidget(
//                                     scrollController: scrollController,
//                                     isSending: isMessageSending,
//                                     isAvatarPressed: isAvatarPressed,
//                                   ),
//                                 ),
//                               if (!isAvatarPressed)
//                                 //===================================
//                                 // if (isAvatarPressed)
//                                 //   BlocConsumer<WebRTCCubit, WebRTCState>(
//                                 //       listener: (context, webRtcState) {
//                                 //         if (webRtcState.rTCPeerConnectionState ==
//                                 //             RTCPeerConnectionState
//                                 //                 .RTCPeerConnectionStateFailed) {
//                                 //           //============================ Fix White Screen =============================
//                                 //           // ----------------------------------- Close Stream From Front-end --------------------------

//                                 //           isAvatarExpanded.value = false;
//                                 //           //here i close the webRTCCubit after closing done success to avoid leak in memory
//                                 //           //I add this because:
//                                 //           //1-  when timer is done from back-end so this i hundle in IF
//                                 //           //2- when i open the stream but i have a faild peer connection, so this i hundle in ELSE
//                                 //           if (webRtcState.elapsedTime > 60) {
//                                 //             errorToast(
//                                 //                 AppStrings().avatarSessionExpired,
//                                 //                 context);
//                                 //           } else {
//                                 //             errorToast(
//                                 //                 AppStrings().somethingWentWrong,
//                                 //                 context);
//                                 //           }
//                                 //           // ----------------------------------- Close Stream From Back-end --------------------------
//                                 //           final String? streamId =
//                                 //               BlocProvider.of<StreamIdCubit>(
//                                 //                       context)
//                                 //                   .state
//                                 //                   .streamId;
//                                 //           if (streamId != null) {
//                                 //             //
//                                 //             closeStreamBloc.add(
//                                 //                 CloseStreamEvent.closeStream(
//                                 //                     //here i pass the streamID
//                                 //                     streamIdCubit
//                                 //                         .state.streamId!));
//                                 //             //here i clear the state of startstream to make sure that i don't use the old sdp and data
//                                 //             context.read<StartStreamBloc>().add(
//                                 //                 const StartStreamEvent
//                                 //                     .clearState());
//                                 //             //I close the avatar and dispose the camera renderer
//                                 //             if (webRTCCubit != null) {
//                                 //               webRTCCubit!.closeStreamCubit();
//                                 //               webRTCCubit!.close();
//                                 //               webRTCCubit == null;
//                                 //             }
//                                 //             BlocProvider.of<StreamIdCubit>(
//                                 //                     context)
//                                 //                 .clearStreamId();
//                                 //           }
//                                 //           //=========================================================
//                                 //         }
//                                 //       },
//                                 //       bloc: webRTCCubit,
//                                 //       builder: (context, state) {
//                                 //         return state.rTCPeerConnectionState ==
//                                 //                 RTCPeerConnectionState
//                                 //                     .RTCPeerConnectionStateConnecting
//                                 //             ? Container(
//                                 //                 padding:
//                                 //                     EdgeInsets.all(AppSizeW.s5),
//                                 //                 width: AppSizeW.s40,
//                                 //                 height: AppSizeH.s40,
//                                 //                 child:
//                                 //                     const CircularProgressIndicator())
//                                 //             : SizedBox(
//                                 //                 height: state.isMiniScreen ==
//                                 //                         false
//                                 //                     ? MediaQuery.sizeOf(context)
//                                 //                             .height /
//                                 //                         5
//                                 //                     : MediaQuery.sizeOf(context)
//                                 //                             .height /
//                                 //                         1.6,
//                                 //                 child: ChatMessagesListWidget(
//                                 //                   scrollController:
//                                 //                       scrollController,
//                                 //                   isSending: isMessageSending,
//                                 //                   isAvatarPressed:
//                                 //                       isAvatarPressed,
//                                 //                 ),
//                                 //               );
//                                 //       }),
//                                 sendState.maybeMap(
//                                   loading: (value) => const SizedBox.shrink(),
//                                   orElse: () {
//                                     return FAQListWidget(
//                                         scrollController: scrollController);
//                                   },
//                                 ),
//                               BlocBuilder<VoiceCubit, VoiceState>(
//                                   builder: (context, voiceState) {
//                                 return ValueListenableBuilder<bool>(
//                                     valueListenable: isRecordMode,
//                                     builder:
//                                         (context, isRecordModeEnabled, child) {
//                                       return Padding(
//                                         padding: EdgeInsets.all(AppSizeW.s8),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               context.locale == ARABIC_LOCAL
//                                                   ? CrossAxisAlignment.end
//                                                   : CrossAxisAlignment.start,
//                                           children: [
//                                             HoldMessageWidget(
//                                                 showHoldMessage:
//                                                     showHoldMessage),
//                                             Row(
//                                               //
//                                               mainAxisAlignment:
//                                                   !isRecordModeEnabled
//                                                       ? MainAxisAlignment.start
//                                                       : MainAxisAlignment
//                                                           .spaceEvenly,

//                                               textDirection:
//                                                   ui.TextDirection.ltr,
//                                               children: <Widget>[
//                                                 /*========================For Ai Avatar========================= */
//                                                 voiceState.isListening &&
//                                                         isAvatarPressed
//                                                     ? SizedBox(
//                                                         width: AppSizeW.s40,
//                                                         height: AppSizeH.s40,
//                                                         child: Lottie.asset(
//                                                           ImageAssets
//                                                               .chatBotRecordingIndecetor,
//                                                           delegates:
//                                                               LottieDelegates(
//                                                             values: [
//                                                               ValueDelegate
//                                                                   .color(
//                                                                 const ['**'],
//                                                                 value:
//                                                                     ColorManager
//                                                                         .primary,
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       )
//                                                     :
//                                                     //zak
//                                                     BlocProvider.value(
//                                                         value: BlocProvider.of<
//                                                                 StreamBloc>(
//                                                             context),
//                                                         child:
//                                                             AiAvatarIconWidget(
//                                                           isRecordModeActive:
//                                                               isRecordMode,
//                                                           // startAvatarTimer:
//                                                           //     startOrResetAvatarTimer,
//                                                           onWebRTCCubitCreated:
//                                                               (WebRTCCubit?
//                                                                   newCubit) async {
//                                                             //I close the avatar and dispose the camera renderer
//                                                             if (newCubit ==
//                                                                     null &&
//                                                                 webRTCCubit !=
//                                                                     null) {
//                                                               await webRTCCubit!
//                                                                   .closeStreamCubit();
//                                                               await webRTCCubit!
//                                                                   .close();
//                                                               webRTCCubit ==
//                                                                   null;
//                                                             } else {
//                                                               //I Start the avatar
//                                                               webRTCCubit =
//                                                                   newCubit;
//                                                             }
//                                                           },
//                                                           isAvatarExpanded:
//                                                               isAvatarExpanded,
//                                                         ),
//                                                       ),
//                                                 SizedBox(
//                                                   width: AppSizeW.s5,
//                                                 ),
//                                                 /*========================For record========================= */
//                                                 // hhere make widget
//                                                 BlocConsumer<VoiceCubit,
//                                                         VoiceState>(
//                                                     listener:
//                                                         (context, voiceState) {
//                                                       if (!voiceState
//                                                               .isListening &&
//                                                           voiceState.text
//                                                               .isNotEmpty &&
//                                                           isAvatarPressed) {
//                                                         showHoldMessage.value =
//                                                             false;
//                                                       }
//                                                       //------------------- send message via record-------------------\
//                                                       final message =
//                                                           voiceState.text;
//                                                       if (!voiceState
//                                                               .isListening &&
//                                                           message.isNotEmpty &&
//                                                           isAvatarPressed) {
//                                                         //--------------
//                                                         //to make the data shown dirctly when message send
//                                                         WidgetsBinding.instance
//                                                             .addPostFrameCallback(
//                                                                 (_) {
//                                                           if (scrollController
//                                                               .hasClients) {
//                                                             scrollController
//                                                                 .animateTo(
//                                                               scrollController
//                                                                       .position
//                                                                       .maxScrollExtent +
//                                                                   AppSizeH.s30,
//                                                               duration:
//                                                                   const Duration(
//                                                                       milliseconds:
//                                                                           300),
//                                                               curve: Curves
//                                                                   .easeOut,
//                                                             );
//                                                           }
//                                                         });

//                                                         //--------------
//                                                         final chatState = context
//                                                             .read<
//                                                                 ChatHistoryCubit>()
//                                                             .state;
//                                                         final userMessage =
//                                                             MessageRequestModel(
//                                                                 content:
//                                                                     message,
//                                                                 role: 'user');
//                                                         context
//                                                             .read<
//                                                                 ChatHistoryCubit>()
//                                                             .addMessage(
//                                                                 userMessage);
//                                                         if (chatState
//                                                                     .activeChat ==
//                                                                 ChatTypeEnum
//                                                                     .authority &&
//                                                             webRTCCubit !=
//                                                                 null) {
//                                                           // Send the user's message as a ChatMessage instance
//                                                           // chatBotBloc.add(

//                                                           chatBotBloc.add(SendMessageEvent.started(
//                                                               ChatbotRequestModel(
//                                                                   streamId:
//                                                                       //===== NOTE: Here I send the stream id as null when i make a pause to te webRTC and user send message =======
//                                                                       !webRTCCubit!
//                                                                               .state
//                                                                               .isPlaying
//                                                                           ? null
//                                                                           : streamIdCubit
//                                                                               .state
//                                                                               .streamId,
//                                                                   messages: context
//                                                                       .read<
//                                                                           ChatHistoryCubit>()
//                                                                       .state
//                                                                       .authorityMessages)));
//                                                         }
//                                                         _controller.clear();
//                                                         context
//                                                             .read<VoiceCubit>()
//                                                             .clearText();
//                                                         // if (isAvatarPressed) {
//                                                         //   startOrResetAvatarTimer();
//                                                         // }
//                                                       }
//                                                       //---------------------------------------------------------------
//                                                     },
//                                                     bloc: BlocProvider.of<
//                                                         VoiceCubit>(context),
//                                                     builder:
//                                                         (context, voiceState) {
//                                                       return GestureDetector(
//                                                         onLongPressStart:
//                                                             isAvatarPressed
//                                                                 ? (_) async {
//                                                                     // await webRTCCubit
//                                                                     //     ?.startRecording();
//                                                                     final can =
//                                                                         await Haptics
//                                                                             .canVibrate();
//                                                                     if (!can) {
//                                                                       return;
//                                                                     }

//                                                                     await Haptics.vibrate(
//                                                                         HapticsType
//                                                                             .heavy);
//                                                                     // _wasLongPressed =
//                                                                     //     true;
//                                                                     // Start recording when pressed
//                                                                     await webRTCCubit
//                                                                         ?.togglePlayPause();
//                                                                     context
//                                                                         .read<
//                                                                             VoiceCubit>()
//                                                                         .checkAndRequestPermissionToStart();
//                                                                   }
//                                                                 : null,
//                                                         onLongPressEnd:
//                                                             isAvatarPressed
//                                                                 ? (_) async {
//                                                                     print(
//                                                                         "end pressed called");

//                                                                     try {
//                                                                       /// 1️⃣ Await speech recognition stop
//                                                                       await context
//                                                                           .read<
//                                                                               VoiceCubit>()
//                                                                           .stopListening();

//                                                                       await webRTCCubit
//                                                                           ?.togglePlayPause();

//                                                                       /// 3️⃣ Short delay (optional - can tweak)
//                                                                       await Future.delayed(const Duration(
//                                                                           milliseconds:
//                                                                               300));

//                                                                       /// 4️⃣ Force audio to play after recording ends
//                                                                       ///
//                                                                       await webRTCCubit
//                                                                           ?.forceAudioPlaybackAfterGesture();
//                                                                     } catch (e) {
//                                                                       print(
//                                                                           "⚠️ Error during audio release sequence: $e");
//                                                                     }

//                                                                     showHoldMessage
//                                                                             .value =
//                                                                         false;
//                                                                   }
//                                                                 : null,
//                                                         onTap: isAvatarPressed
//                                                             ? () {
//                                                                 showHoldHint();
//                                                               }
//                                                             : () async {
//                                                                 // await webRTCCubit
//                                                                 //     ?.forceAudioPlaybackAfterGesture();
//                                                                 final can =
//                                                                     await Haptics
//                                                                         .canVibrate();
//                                                                 if (!can) {
//                                                                   return;
//                                                                 }
//                                                                 await Haptics.vibrate(
//                                                                     HapticsType
//                                                                         .heavy);
//                                                                 if (voiceState
//                                                                     .isListening) {
//                                                                   context
//                                                                       .read<
//                                                                           VoiceCubit>()
//                                                                       .stopListening();
//                                                                 } else {
//                                                                   context
//                                                                       .read<
//                                                                           VoiceCubit>()
//                                                                       .checkAndRequestPermissionToStart();
//                                                                   // .startListening();
//                                                                 }
//                                                               },
//                                                         child: isAvatarPressed
//                                                             ? isRecordModeEnabled
//                                                                 ? AnimatedContainer(
//                                                                     duration: const Duration(
//                                                                         milliseconds:
//                                                                             200),
//                                                                     decoration:
//                                                                         BoxDecoration(
//                                                                             boxShadow: [
//                                                                           BoxShadow(
//                                                                             blurStyle:
//                                                                                 BlurStyle.outer,
//                                                                             color:
//                                                                                 ColorManager.primary.withValues(alpha: .7),
//                                                                             blurRadius:
//                                                                                 30,
//                                                                             spreadRadius:
//                                                                                 1,
//                                                                           ),
//                                                                         ],
//                                                                             gradient:
//                                                                                 LinearGradient(
//                                                                               colors: [
//                                                                                 ColorManager.primary,
//                                                                                 ColorManager.primary.withValues(alpha: .7),
//                                                                               ],
//                                                                               begin: Alignment.topLeft,
//                                                                               end: Alignment.bottomRight,
//                                                                             ),
//                                                                             color: voiceState.isListening
//                                                                                 ? ColorManager.primary.withValues(
//                                                                                     alpha:
//                                                                                         0.3)
//                                                                                 : Theme.of(context)
//                                                                                     .primaryColor,
//                                                                             borderRadius: BorderRadius.circular(AppSizeR
//                                                                                 .s100)),
//                                                                     height:
//                                                                         AppSizeH
//                                                                             .s60,
//                                                                     width: AppSizeH
//                                                                         .s120,
//                                                                     child: Icon(
//                                                                       Icons
//                                                                           .mic_none,
//                                                                       color: ColorManager
//                                                                           .white,
//                                                                     ))
//                                                                 : const SizedBox
//                                                                     .shrink()
//                                                             :
//                                                             //we will see this widget when the avatar is not enabled
//                                                             voiceState
//                                                                     .isListening
//                                                                 ? SizedBox(
//                                                                     height:
//                                                                         AppSizeH
//                                                                             .s40,
//                                                                     width: AppSizeH
//                                                                         .s40,
//                                                                     child: Lottie.asset(
//                                                                         ImageAssets.chatBotRecordingIndecetor))
//                                                                 : const Icon(Icons.mic_none),
//                                                       );
//                                                     }),

//                                                 SizedBox(
//                                                   width: isRecordModeEnabled
//                                                       ? AppSizeW.s0
//                                                       : AppSizeW.s5,
//                                                 ),
//                                                 if (isAvatarPressed)
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       isRecordMode.value =
//                                                           !isRecordMode.value;
//                                                     },
//                                                     child: ValueListenableBuilder<
//                                                             bool>(
//                                                         valueListenable:
//                                                             isRecordMode,
//                                                         builder: (context,
//                                                             isRecordModeEnabled,
//                                                             child) {
//                                                           return Container(
//                                                             width: AppSizeW.s40,
//                                                             height:
//                                                                 AppSizeH.s40,
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius.circular(
//                                                                         AppSizeR
//                                                                             .s5),
//                                                                 color: ColorManager
//                                                                     .lightSilver
//                                                                     .withValues(
//                                                                         alpha:
//                                                                             .3)),
//                                                             child: isRecordModeEnabled
//                                                                 ? const Icon(Icons
//                                                                     .keyboard)
//                                                                 : const Icon(Icons
//                                                                     .mic_none),
//                                                           );
//                                                         }),
//                                                   ),
//                                                 SizedBox(
//                                                   width: isRecordModeEnabled
//                                                       ? AppSizeW.s0
//                                                       : AppSizeW.s5,
//                                                 ),
//                                                 /*========================TextFaild========================= */
//                                                 if (!isRecordModeEnabled ||
//                                                     !isAvatarPressed)
//                                                   // if (false)
//                                                   Expanded(
//                                                     child:
//                                                         BlocBuilder<VoiceCubit,
//                                                                 VoiceState>(
//                                                             bloc: BlocProvider
//                                                                 .of<VoiceCubit>(
//                                                                     context),
//                                                             builder: (context,
//                                                                 voiceState) {
//                                                               WidgetsBinding
//                                                                   .instance
//                                                                   .addPostFrameCallback(
//                                                                       (_) {
//                                                                 if (_controller
//                                                                         .text !=
//                                                                     voiceState
//                                                                         .text) {
//                                                                   _controller
//                                                                           .text =
//                                                                       voiceState
//                                                                           .text;
//                                                                 }
//                                                               });

//                                                               return ReraTextFaild(
//                                                                 onChange:
//                                                                     (p0) {},
//                                                                 controller:
//                                                                     _controller,
//                                                                 readOnly: false,
//                                                                 enabled: true,
//                                                                 suffixIcon:
//                                                                     GestureDetector(
//                                                                         onTap:
//                                                                             () {
//                                                                           //--------------
//                                                                           final chatState = context
//                                                                               .read<ChatHistoryCubit>()
//                                                                               .state;
//                                                                           //-------------------- authority clear button ------------------------
//                                                                           if (chatState.activeChat ==
//                                                                               ChatTypeEnum.authority) {
//                                                                             chatState.authorityMessages.clear();
//                                                                             context.read<ChatHistoryCubit>().addMessage(MessageRequestModel(
//                                                                                   role: 'assistant',
//                                                                                   content: AppStrings().defaultAuthorityBotMessage,
//                                                                                 ));
//                                                                           }
//                                                                           //-------------------- Platform clear button ------------------------
//                                                                           else {
//                                                                             chatState.platformMessages.clear();
//                                                                             context.read<ChatHistoryCubit>().addMessage(MessageRequestModel(
//                                                                                   role: 'assistant',
//                                                                                   content: AppStrings().defaultPlatformBotMessage,
//                                                                                 ));
//                                                                           }
//                                                                         },
//                                                                         child:
//                                                                             Icon(
//                                                                           Icons
//                                                                               .refresh_rounded,
//                                                                           color:
//                                                                               Theme.of(context).primaryColor,
//                                                                         )),
//                                                                 hint: AppStrings()
//                                                                     .writeUourMessage,
//                                                               );
//                                                             }),
//                                                   ),
//                                                 /*======================== Send button ========================= */

//                                                 /*========================TextFaild button if avatar pressed ========================= */

//                                                 if (!isRecordModeEnabled ||
//                                                     !isAvatarPressed)
//                                                   BlocProvider<
//                                                       WebRTCCubit>.value(
//                                                     value: webRTCCubit ??
//                                                         WebRTCCubit(),
//                                                     child:
//                                                         ValueListenableBuilder<
//                                                                 bool>(
//                                                             valueListenable:
//                                                                 isSendEnabled,
//                                                             builder: (context,
//                                                                 enabled,
//                                                                 child) {
//                                                               return SendButtonWidget(
//                                                                 isAvatarShown:
//                                                                     isAvatarPressed,
//                                                                 scrollController:
//                                                                     scrollController,
//                                                                 enabled:
//                                                                     enabled,
//                                                                 controller:
//                                                                     _controller,
//                                                               );
//                                                             }),
//                                                   ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       );
//                                     });
//                               }),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   top: isAvatarPressed
//                                       ? AppSizeH.s20
//                                       : AppSizeH.s0,
//                                   bottom: AppSizeH.s20,
//                                   right: AppSizeW.s15,
//                                   left: AppSizeW.s15,
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Text("${AppStrings().note}: ",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .titleSmall),
//                                     Flexible(
//                                       child: Text(AppStrings().aiNote,
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .headlineMedium),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }),
//                   ),
//                 );
//               }),
//         ],
//       ),
//     );
//   }
// }