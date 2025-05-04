import 'package:ebla/presentations/features/chatbot/blocs/web_rtc_cubit/web_rtc_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/web_rtc_cubit/web_rtc_state.dart';
import 'package:ebla/presentations/features/chatbot/widgets/mini_video_player_widget.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MiniScreenWidget extends StatelessWidget {
  const MiniScreenWidget({
    super.key,
    required this.isAvatarExpanded,
  });

  final ValueNotifier<bool> isAvatarExpanded;

  @override
  Widget build(BuildContext context) {
    final WebRTCCubit webRTCCubit = BlocProvider.of<WebRTCCubit>(context);
    return ValueListenableBuilder<bool>(
        valueListenable: isAvatarExpanded,
        builder: (context, expanded, child) {
          return BlocBuilder<WebRTCCubit, WebRTCState>(
              bloc: webRTCCubit,
              builder: (context, state) {
                if (state.isMiniScreen && expanded
                    // &&

                    // state.remoteRenderer.srcObject != null
                    // // NOTE: expanded is for hide the mini screen if user close stream and it's true.
                    ) {
                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    left: state.isMiniScreen
                        ? state.miniScreenPosition.dx
                        : AppSizeW.s0,
                    top: state.isMiniScreen
                        ? state.miniScreenPosition.dy
                        : AppSizeH.s0,
                    // left: state.isMiniScreen ? miniScreenPosition.dx : 0,
                    // top: state.isMiniScreen ? miniScreenPosition.dy : 0,
                    width: state.isMiniScreen
                        ? AppSizeW.s150
                        : MediaQuery.of(context).size.width,
                    height: state.isMiniScreen
                        ? AppSizeH.s200
                        : MediaQuery.of(context).size.height,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: state.isMiniScreen ? 1 : 0, // Fade effect
                      child: Stack(
                        children: [
                          Draggable(
                            feedback: MiniVideoPlayerWidget(state: state),
                            childWhenDragging:
                                Container(), // Hide original while dragging
                            onDragEnd: (details) {
                              final screenSize = MediaQuery.of(context).size;
                              final dx = details.offset.dx;
                              final dy = details.offset.dy;

                              // Calculate closest corner
                              final topLeft = Offset(AppSizeW.s0, AppSizeH.s0);
                              final topRight = Offset(
                                  screenSize.width - AppSizeW.s150,
                                  AppSizeH.s0);
                              final bottomLeft = Offset(AppSizeW.s0,
                                  screenSize.height - screenSize.height * 0.4);
                              final bottomRight = Offset(
                                  screenSize.width - AppSizeW.s150,
                                  screenSize.height - screenSize.height * 0.4);

                              List<Offset> corners = [
                                topLeft,
                                topRight,
                                bottomLeft,
                                bottomRight
                              ];

                              // Find the closest corner
                              Offset nearestCorner = corners.reduce((a, b) =>
                                  (dx - a.dx).abs() + (dy - a.dy).abs() <
                                          (dx - b.dx).abs() + (dy - b.dy).abs()
                                      ? a
                                      : b);

                              // Animate position update
                              webRTCCubit
                                  .updateMiniScreenPosition(nearestCorner);
                              // miniScreenPosition = nearestCorner;
                            },

                            child: MiniVideoPlayerWidget(state: state),
                          ),
                          Positioned(
                            bottom: 0,
                            top: 0,
                            right: 0,
                            left: 0,
                            child: GestureDetector(
                              onTap: () {
                                webRTCCubit.toggleMiniScreen();
                              },
                              child: Icon(
                                state.isMiniScreen
                                    ? Icons.fullscreen
                                    : Icons.fit_screen_sharp,
                                color: Colors.white,
                                size: AppSizeW.s35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              });
        });
  }
}
