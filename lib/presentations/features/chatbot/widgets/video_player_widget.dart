import 'dart:typed_data';

import 'package:ebla/presentations/features/chatbot/blocs/web_rtc_cubit/web_rtc_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/web_rtc_cubit/web_rtc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  GlobalKey _videoKey = GlobalKey(); // Unique key for capturing the video frame

  @override
  Widget build(BuildContext context) {
    WebRTCCubit webRTCCubit = BlocProvider.of<WebRTCCubit>(context);
    _videoKey = webRTCCubit.videoKey;
    return BlocBuilder<WebRTCCubit, WebRTCState>(
      bloc: webRTCCubit,
      // buildWhen: (previous, current) =>
      //     // previous.localRenderer != current.localRenderer ||
      //     previous.remoteRenderer != current.remoteRenderer,
      builder: (context, state) {
        return Stack(
          children: [
            if (state.isConnectionReady)
              RepaintBoundary(
                key: _videoKey,
                child: state.isPlaying || state.lastFrame == null
                    ?
                    // Video container with fade transition
                    AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: state.isMiniScreen ? 0 : 1, // Fade effect
                        child: RTCVideoView(
                          state.remoteRenderer,
                          objectFit:
                              RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                          mirror: true,
                        ),
                      )
                    : Image.memory(
                        Uint8List.fromList(state.lastFrame!),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return const Text("Failed to load frame");
                        },
                      ),
              )
            else
              const Center(child: CircularProgressIndicator()),
            if (state.errorMessage != null)
              Text(
                "Error: ${state.errorMessage}",
              ),
          ],
        );
      },
    );
  }
}
