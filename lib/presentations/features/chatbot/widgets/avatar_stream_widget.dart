import 'package:ebla/presentations/features/chatbot/blocs/send_answer_and_candidate_bloc/send_answer_and_candidate_bloc.dart';
import 'package:ebla/presentations/features/chatbot/widgets/video_player_widget.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvatarStreamWidget extends StatelessWidget {
  const AvatarStreamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("hello i am here");
    return BlocBuilder<SendAnswerAndCandidateBloc, SendAnswerAndCandidateState>(
      bloc: BlocProvider.of<SendAnswerAndCandidateBloc>(context),
      builder: (context, state) {
        return state.map(initial: (value) {
          return const SizedBox();
        }, loading: (value) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width,
            child: const Center(child: CircularProgressIndicator()),
          );
        }, error: (value) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width,
            child: ErrorGlobalWidget(
              message: value.message == ""
                  ? AppStrings().somethingWentWrong
                  : value.message,
              small: true,
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
