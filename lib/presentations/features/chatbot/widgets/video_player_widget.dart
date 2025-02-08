import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/presentations/features/chatbot/blocs/web_rtc_cubit/web_rtc_cubit.dart';
import 'package:ebla/presentations/features/chatbot/blocs/web_rtc_cubit/web_rtc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class VideoPlayerWidget extends StatelessWidget {
  final OfferModel? offer;
  final List<ICEServerModel> iceServers;

  const VideoPlayerWidget({
    required this.offer,
    required this.iceServers,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WebRTCCubit()..initWebRTC(offer, iceServers),
      child: BlocBuilder<WebRTCCubit, WebRTCState>(
        builder: (context, state) {
          return Stack(
            children: [
              RTCVideoView(
                state.localRenderer,
                objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
              ),
              if (state.errorMessage != null)
                Text(
                  "Error: ${state.errorMessage}",
                ),
            ],
          );
        },
      ),
    );
  }
}
