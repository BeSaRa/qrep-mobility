import 'package:ebla/presentations/features/chatbot/blocs/close_stream/close_stream_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/drobdown_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/stream_id_cubit.dart/stream_id_cubit.dart';
import 'package:ebla/presentations/features/chatbot/utility/chatbot_enums.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/taost_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AiAvatarIconWidget extends StatefulWidget {
  const AiAvatarIconWidget({
    super.key,
    required this.isAvatarExpanded,
    required this.isRecordModeActive,
  });

  final ValueNotifier<bool> isRecordModeActive;
  final ValueNotifier<bool> isAvatarExpanded;

  @override
  State<AiAvatarIconWidget> createState() => _AiAvatarIconWidgetState();
}

class _AiAvatarIconWidgetState extends State<AiAvatarIconWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownCubit, ChatTypeEnum>(
        bloc: BlocProvider.of<DropdownCubit>(context),
        builder: (context, selectedOption) {
          if (context.read<DropdownCubit>().state == ChatTypeEnum.authority) {
            return ValueListenableBuilder<bool>(
                valueListenable: widget.isAvatarExpanded,
                builder: (context, expanded, child) {
                  return BlocConsumer<CloseStreamBloc, CloseStreamState>(
                      listener: (context, closestate) {
                                              closestate.mapOrNull(
                  error: (value) {
                    //NOTE: here i make the user back to defult state of chat UI when faild to close stream
                    //because it will faild when back-end stop the stream
                    if (value.message == "Failed to close stream") {
                      widget.isAvatarExpanded.value = false;
                    } else {
                      errorToast(value.message, context);
                    }
                  },
                  done: (value) async {
                    //when close is done
                    BlocProvider.of<StreamIdCubit>(context)
                        .clearStreamId();
                    if (widget.isAvatarExpanded.value = true) {
                      widget.isAvatarExpanded.value =
                          !widget.isAvatarExpanded.value;
                      widget.isRecordModeActive.value = true;
                    }
                  },
                                              );
                                            }, builder: (context, closeState) {
                                              return closeState.maybeMap(
                    loading: (_) => Container(
                        padding: EdgeInsets.all(AppSizeW.s5),
                        width: AppSizeW.s40,
                        height: AppSizeH.s40,
                        child: const CircularProgressIndicator()),
                    orElse: () => GestureDetector(
                          onTap: () async {
                            if (expanded) {
                              // If the close icon is shown, I perform logic for closing the AI Avatar Here
                              final String? streamId = context
                                  .read<StreamIdCubit>()
                                  .state
                                  .streamId;
                              if (streamId != null) {
                                context.read<CloseStreamBloc>().add(
                                      CloseStreamEvent.closeStream(context.read<StreamIdCubit>().state.streamId!),
                                    );
                              }
                            } else {
                              widget.isAvatarExpanded.value = true;
                            }
                          },
                          child: AnimatedRotation(
                            turns: expanded
                                ? 0.5
                                : 0.0, // Rotate 180° when expanded, back when closed
                            duration: const Duration(milliseconds: 300),
                            child: Container(
                              width: AppSizeW.s40,
                              height: AppSizeH.s40,
                              padding: EdgeInsets.symmetric(horizontal: AppSizeW.s5),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                      width: 1,
                                      color: Theme.of(context).hoverColor),
                                ),
                              ),
                              child: AnimatedSwitcher(
                                duration: const Duration(
                                    milliseconds: 300),
                                transitionBuilder:
                                    (child, animation) =>
                                        ScaleTransition(
                                  scale: animation,
                                  child: child,
                                ),
                                child: expanded
                                    ? const Icon(Icons.close,
                                        key: ValueKey("closeIcon"))
                                    : Image.asset(
                                        ImageAssets.chatBot,
                                        key: const ValueKey(
                                            "avatarIcon")),
                              ),
                            ),
                          ),
                        ));
                                            });
                });
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
