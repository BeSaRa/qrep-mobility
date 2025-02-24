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
  @override
  Widget build(BuildContext context) {
    WebRTCCubit webRTCCubit = BlocProvider.of<WebRTCCubit>(context);
    return BlocBuilder<WebRTCCubit, WebRTCState>(
      bloc: webRTCCubit,
      buildWhen: (previous, current) =>
          previous.localRenderer != current.localRenderer ||
          previous.remoteRenderer != current.remoteRenderer,
      builder: (context, state) {
        return Stack(
          children: [
            RTCVideoView(
              state.remoteRenderer.srcObject != null
                  ? state.remoteRenderer
                  : state.localRenderer,
              objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
              mirror: true,
            ),
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
