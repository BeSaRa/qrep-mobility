import 'package:ebla/presentations/features/chatbot/blocs/send_answer_and_candidate_bloc/send_answer_and_candidate_bloc.dart';
import 'package:ebla/presentations/features/chatbot/widgets/video_player_widget.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class AvatarStreamWidget extends StatelessWidget {
  const AvatarStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendAnswerAndCandidateBloc, SendAnswerAndCandidateState>(
      bloc: BlocProvider.of<SendAnswerAndCandidateBloc>(context),
      builder: (context, state) {
        return state.map(initial: (value) {
          return const SizedBox();
        }, loading: (value) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width,
            child: const Center(
                child:
                    CircularProgressIndicator()
                    ),
          );
        }, error: (value) {
           return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width,
            child:
            Container(
      height: AppSizeH.s150, 
      width:  AppSizeH.s150,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height:  AppSizeH.s50,
              width: AppSizeH.s50,
              child: Lottie.asset(ImageAssets.animationError)),
     Column(
                  children: [
                    SizedBox(height: AppSizeH.s10),
                    Text(
                      value.message == ""
                  ? AppStrings().somethingWentWrong
                  : value.message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: AppSizeH.s10),
                  ],
                ),
        ],
      ),
    ),
            
          );
        }, done: (value) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: VideoPlayerWidget(),
              ),
            ],
          );
        });
      },
    );
  }
}
