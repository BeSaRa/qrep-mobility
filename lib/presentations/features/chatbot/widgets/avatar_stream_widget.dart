import 'package:ebla/presentations/features/chatbot/blocs/start_stream_bloc/start_stream_bloc.dart';
import 'package:ebla/presentations/features/chatbot/widgets/video_player_widget.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvatarStreamWidget extends StatelessWidget {
  const AvatarStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartStreamBloc, StartStreamState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state.isLoading)
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).width,
                child: const Center(child: CircularProgressIndicator()),
              ),
            if (state.hasError)
              ErrorGlobalWidget(
                message: state.errorMessage == ""
                    ? AppStrings().somethingWentWrong
                    : state.errorMessage,
                small: true,
              ),
            if (state.startStreamResponse.data?.webrtcData != null)
              Expanded(
                child: Container(
                  // width: MediaQuery.sizeOf(context).width,
                  // height: MediaQuery.sizeOf(context).height,
                  // margin: EdgeInsets.symmetric(horizontal: AppSizeW.s20),
                  decoration: BoxDecoration(
                    // border: Border.all(width: AppSizeW.s10),
                    borderRadius: BorderRadius.circular(AppSizeR.s10),
                  ),
                  child: VideoPlayerWidget(
                    offer: state.startStreamResponse.data!.webrtcData!.offer,
                    iceServers:
                        state.startStreamResponse.data!.webrtcData!.iceServers,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
