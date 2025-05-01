import 'package:ebla/presentations/features/chatbot/blocs/drobdown_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/messages_history_bloc/chat_history_cubit.dart';
import 'package:ebla/presentations/features/chatbot/utility/chatbot_enums.dart';
import 'package:ebla/presentations/features/chatbot/widgets/check_box_widget.dart';
import 'package:ebla/presentations/resources/color_manager.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class DropDownMenuButtonWidget extends StatelessWidget {
  const DropDownMenuButtonWidget({
    super.key,
    required this.isAvatarExpanded,
    // required this.streamIdCubit,
    // required this.closeStreamBloc,
    // required this.webRTCCubit,
    required this.scrollController,
  });

  final ValueNotifier<bool> isAvatarExpanded;
  // final StreamIdCubit streamIdCubit;
  // final CloseStreamBloc closeStreamBloc;
  // final WebRTCCubit? webRTCCubit;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: isAvatarExpanded,
        builder: (context, expanded, child) {
          return expanded
              ? const SizedBox.shrink()
              : Align(
                  alignment: Alignment.topLeft,
                  child: Builder(builder: (context) {
                    return PopupMenuButton<int>(
                      icon: Icon(
                        Icons.more_vert,
                        color: ColorManager.primary,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizeR.s10),
                      ),
                      color: Theme.of(context).cardTheme.color,
                      shadowColor: ColorManager.primary,
                      itemBuilder: (context) => [
                        PopupMenuItem<int>(
                          value: 0,
                          child: MultiBlocProvider(
                            providers: [
                              BlocProvider.value(
                                value: BlocProvider.of<DropdownCubit>(context),
                              ),
                              BlocProvider.value(
                                value:
                                    BlocProvider.of<ChatHistoryCubit>(context),
                              ),
                            ],
                            child: BlocBuilder<DropdownCubit, ChatTypeEnum>(
                              builder: (context, selectedOption) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CheckBoxWidget(
                                      onPlatformTapAndAvatarIsOpen: () async {
                                        // //close stream if it's working:

                                        // final String? streamId =
                                        //     streamIdCubit.state.streamId;
                                        // isAvatarExpanded.value = false;
                                        // if (streamId != null) {
                                        //   closeStreamBloc.add(CloseStreamEvent
                                        //       .closeStream(
                                        //           //here i pass the streamID
                                        //           streamIdCubit
                                        //               .state.streamId!));
                                        //   streamIdCubit.clearStreamId();
                                        // }
                                        // if (webRTCCubit != null) {
                                        //   //clear the webrt Cubit
                                        //   await webRTCCubit!
                                        //       .closeStreamCubit();
                                        //   await webRTCCubit!.close();
                                        //   webRTCCubit == null;
                                        // }
                                      },
                                      scrollController: scrollController,
                                      text: AppStrings().moreTitle,
                                      value:
                                          ChatTypeEnum.qatarRealEstatePlatform,
                                      isChecked: selectedOption ==
                                          ChatTypeEnum.qatarRealEstatePlatform,
                                    ),
                                    CheckBoxWidget(
                                      onPlatformTapAndAvatarIsOpen: null,
                                      scrollController: scrollController,
                                      text: AppStrings()
                                          .realEstateRegulatoryAuthority,
                                      value: ChatTypeEnum.authority,
                                      isChecked: selectedOption ==
                                          ChatTypeEnum.authority,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                );
        });
  }
}

