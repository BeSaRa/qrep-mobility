import 'package:ebla/presentations/features/chatbot/blocs/web_rtc_cubit/web_rtc_state.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class MiniVideoPlayerWidget extends StatelessWidget {
const MiniVideoPlayerWidget({super.key, required this.state});
  final WebRTCState state;
  @override
  Widget build(BuildContext context) {
    return     Container(
      width: AppSizeW.s150,
      height: AppSizeH.s200,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.5),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: RTCVideoView(
        state.remoteRenderer,
        objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
        mirror: true,
      ),
    );
  }
}