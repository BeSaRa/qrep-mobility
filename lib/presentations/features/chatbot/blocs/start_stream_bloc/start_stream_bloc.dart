import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/close_stream_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/send_answer_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/send_candidate_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/start_stream_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_stream_bloc.freezed.dart';
part 'start_stream_state.dart';
part 'start_stream_event.dart';

class StartStreamBloc extends Bloc<StartStreamEvent, StartStreamState> {
  final StartStreamUsecase startStreamUsecase;
  final SendAnswerUsecase sendAnswerUsecase;
  final SendCandidateUsecase sendCandidateUsecase;
  final CloseStreamUsecase closeStreamUsecase;
  // final ChatHistoryCubit chatHistoryCubit;

  StartStreamBloc(
    this.startStreamUsecase,
    this.sendAnswerUsecase,
    this.sendCandidateUsecase,
    this.closeStreamUsecase,
    //  this.chatHistoryCubit
  ) : super(const StartStreamState.initial()) {
    on<StartStreamEvent>((StartStreamEvent event, emit) async {
      await event.map(
        started: (value) async {
          emit(state.copyWith(
            isLoading: true,
            hasError: false,
            sendAnswerResponse: const SendAnswerResponseModel(),
            sendCandidateResponse: const SendAnswerResponseModel(),
            startStreamResponse: const StartStreamModel(),
          ));
          // // Simulate network request or logic to start stream
          // await Future.delayed(const Duration(seconds: 2)); 
          //emit(const StartStreamState.loading());
//           String sdpComeFromBackend =
//               "v=0\r\no=- 3676695386727457225 2 IN IP4 127.0.0.1\r\ns=-\r\nt=0 0\r\na=group:BUNDLE 0 1\r\na=msid-semantic: WMS 3ffe";
//           StartStreamModel fakeResponse = StartStreamModel(
//               data: WebRTCDataModel(
//                   id: "testIdasassasas",
//                   webrtcData: WebRTCDetailsModel(
//                       iceServers: [
//                         ICEServerModel(
//                             urls: "turn:fake.turn.server:3478",
//                             username: "test",
//                             credential: "test123")
// // $sdpComeFromBackend
//                       ],
//                       offer: OfferModel(
//                           type: "offer",
//                           sdp:
//                               '''v=0\no=- 1372093389836534754 2 IN IP4 127.0.0.1\ns=-\nt=0 0\na=group:BUNDLE 0 1 2\na=extmap-allow-mixed\na=msid-semantic: WMS 8b9cf34e-1f60-4140-8bf3-af9f658171a2\nm=audio 9 UDP/TLS/RTP/SAVPF 111 63 9 0 8 13 110 126\nc=IN IP4 0.0.0.0\na=rtcp:9 IN IP4 0.0.0.0\na=ice-ufrag:ucQL\na=ice-pwd:blGQwhO3zUISYtWPgMg3OdUE\na=ice-options:trickle\na=fingerprint:sha-256 9B:E4:52:93:72:D3:25:3D:89:C3:90:06:2A:23:5C:FB:C9:29:45:1D:17:5F:65:6E:94:B1:9C:6F:3C:F6:46:A8\na=setup:actpass\na=mid:0\na=extmap:1 urn:ietf:params:rtp-hdrext:ssrc-audio-level\na=extmap:2 http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time\na=extmap:3 http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions-01\na=extmap:4 urn:ietf:params:rtp-hdrext:sdes:mid\na=sendrecv\na=msid:8b9cf34e-1f60-4140-8bf3-af9f658171a2 5cdbaf40-fa66-4958-aac7-daf4c88e8eea\na=rtcp-mux\na=rtcp-rsize\na=rtpmap:111 opus/48000/2\na=rtcp-fb:111 transport-cc\na=fmtp:111 minptime=10;useinbandfec=1\na=rtpmap:63 red/48000/2\na=fmtp:63 111/111\na=rtpmap:9 G722/8000\na=rtpmap:0 PCMU/8000\na=rtpmap:8 PCMA/8000\na=rtpmap:13 CN/8000\na=rtpmap:110 telephone-event/48000\na=rtpmap:126 telephone-event/8000\na=ssrc:2628972833 cname:A12YrVEoqJd7ZlMc\na=ssrc:2628972833 msid:8b9cf34e-1f60-4140-8bf3-af9f658171a2 5cdbaf40-fa66-4958-aac7-daf4c88e8eea\nm=video 9 UDP/TLS/RTP/SAVPF 96 97 102 103 104 105 106 107 108 109 127 125 39 40 45 46 98 99 100 101 112 113 116 117 118\nc=IN IP4 0.0.0.0\na=rtcp:9 IN IP4 0.0.0.0\na=ice-ufrag:ucQL\na=ice-pwd:blGQwhO3zUISYtWPgMg3OdUE\na=ice-options:trickle\na=fingerprint:sha-256 9B:E4:52:93:72:D3:25:3D:89:C3:90:06:2A:23:5C:FB:C9:29:45:1D:17:5F:65:6E:94:B1:9C:6F:3C:F6:46:A8\na=setup:actpass\na=mid:1\na=extmap:14 urn:ietf:params:rtp-hdrext:toffset\na=extmap:2 http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time\na=extmap:13 urn:3gpp:video-orientation\na=extmap:3 http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions-01\na=extmap:5 http://www.webrtc.org/experiments/rtp-hdrext/playout-delay\na=extmap:6 http://www.webrtc.org/experiments/rtp-hdrext/video-content-type\na=extmap:7 http://www.webrtc.org/experiments/rtp-hdrext/video-timing\na=extmap:8 http://www.webrtc.org/experiments/rtp-hdrext/color-space\na=extmap:4 urn:ietf:params:rtp-hdrext:sdes:mid\na=extmap:10 urn:ietf:params:rtp-hdrext:sdes:rtp-stream-id\na=extmap:11 urn:ietf:params:rtp-hdrext:sdes:repaired-rtp-stream-id\na=sendrecv\na=msid:8b9cf34e-1f60-4140-8bf3-af9f658171a2 49341b58-99c2-4b6d-98cc-2bd70e4446d8\na=rtcp-mux\na=rtcp-rsize\na=rtpmap:96 VP8/90000\na=rtcp-fb:96 goog-remb\na=rtcp-fb:96 transport-cc\na=rtcp-fb:96 ccm fir\na=rtcp-fb:96 nack\na=rtcp-fb:96 nack pli\na=rtpmap:97 rtx/90000\na=fmtp:97 apt=96\na=rtpmap:102 H264/90000\na=rtcp-fb:102 goog-remb\na=rtcp-fb:102 transport-cc\na=rtcp-fb:102 ccm fir\na=rtcp-fb:102 nack\na=rtcp-fb:102 nack pli\na=fmtp:102 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42001f\na=rtpmap:103 rtx/90000\na=fmtp:103 apt=102\na=rtpmap:104 H264/90000\na=rtcp-fb:104 goog-remb\na=rtcp-fb:104 transport-cc\na=rtcp-fb:104 ccm fir\na=rtcp-fb:104 nack\na=rtcp-fb:104 nack pli\na=fmtp:104 level-asymmetry-allowed=1;packetization-mode=0;profile-level-id=42001f\na=rtpmap:105 rtx/90000\na=fmtp:105 apt=104\na=rtpmap:106 H264/90000\na=rtcp-fb:106 goog-remb\na=rtcp-fb:106 transport-cc\na=rtcp-fb:106 ccm fir\na=rtcp-fb:106 nack\na=rtcp-fb:106 nack pli\na=fmtp:106 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f\na=rtpmap:107 rtx/90000\na=fmtp:107 apt=106\na=rtpmap:108 H264/90000\na=rtcp-fb:108 goog-remb\na=rtcp-fb:108 transport-cc\na=rtcp-fb:108 ccm fir\na=rtcp-fb:108 nack\na=rtcp-fb:108 nack pli\na=fmtp:108 level-asymmetry-allowed=1;packetization-mode=0;profile-level-id=42e01f\na=rtpmap:109 rtx/90000\na=fmtp:109 apt=108\na=rtpmap:127 H264/90000\na=rtcp-fb:127 goog-remb\na=rtcp-fb:127 transport-cc\na=rtcp-fb:127 ccm fir\na=rtcp-fb:127 nack\na=rtcp-fb:127 nack pli\na=fmtp:127 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=4d001f\na=rtpmap:125 rtx/90000\na=fmtp:125 apt=127\na=rtpmap:39 H264/90000\na=rtcp-fb:39 goog-remb\na=rtcp-fb:39 transport-cc\na=rtcp-fb:39 ccm fir\na=rtcp-fb:39 nack\na=rtcp-fb:39 nack pli\na=fmtp:39 level-asymmetry-allowed=1;packetization-mode=0;profile-level-id=4d001f\na=rtpmap:40 rtx/90000\na=fmtp:40 apt=39\na=rtpmap:45 AV1/90000\na=rtcp-fb:45 goog-remb\na=rtcp-fb:45 transport-cc\na=rtcp-fb:45 ccm fir\na=rtcp-fb:45 nack\na=rtcp-fb:45 nack pli\na=fmtp:45 level-idx=5;profile=0;tier=0\na=rtpmap:46 rtx/90000\na=fmtp:46 apt=45\na=rtpmap:98 VP9/90000\na=rtcp-fb:98 goog-remb\na=rtcp-fb:98 transport-cc\na=rtcp-fb:98 ccm fir\na=rtcp-fb:98 nack\na=rtcp-fb:98 nack pli\na=fmtp:98 profile-id=0\na=rtpmap:99 rtx/90000\na=fmtp:99 apt=98\na=rtpmap:100 VP9/90000\na=rtcp-fb:100 goog-remb\na=rtcp-fb:100 transport-cc\na=rtcp-fb:100 ccm fir\na=rtcp-fb:100 nack\na=rtcp-fb:100 nack pli\na=fmtp:100 profile-id=2\na=rtpmap:101 rtx/90000\na=fmtp:101 apt=100\na=rtpmap:112 H264/90000\na=rtcp-fb:112 goog-remb\na=rtcp-fb:112 transport-cc\na=rtcp-fb:112 ccm fir\na=rtcp-fb:112 nack\na=rtcp-fb:112 nack pli\na=fmtp:112 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=64001f\na=rtpmap:113 rtx/90000\na=fmtp:113 apt=112\na=rtpmap:116 red/90000\na=rtpmap:117 rtx/90000\na=fmtp:117 apt=116\na=rtpmap:118 ulpfec/90000\na=ssrc-group:FID 834903406 441151903\na=ssrc:834903406 cname:A12YrVEoqJd7ZlMc\na=ssrc:834903406 msid:8b9cf34e-1f60-4140-8bf3-af9f658171a2 49341b58-99c2-4b6d-98cc-2bd70e4446d8\na=ssrc:441151903 cname:A12YrVEoqJd7ZlMc\na=ssrc:441151903 msid:8b9cf34e-1f60-4140-8bf3-af9f658171a2 49341b58-99c2-4b6d-98cc-2bd70e4446d8\nm=application 9 UDP/DTLS/SCTP webrtc-datachannel\nc=IN IP4 0.0.0.0\na=ice-ufrag:ucQL\na=ice-pwd:blGQwhO3zUISYtWPgMg3OdUE\na=ice-options:trickle\na=fingerprint:sha-256 9B:E4:52:93:72:D3:25:3D:89:C3:90:06:2A:23:5C:FB:C9:29:45:1D:17:5F:65:6E:94:B1:9C:6F:3C:F6:46:A8\na=setup:actpass\na=mid:2\na=sctp-port:5000\na=max-message-size:262144'''))));

          // emit(
          //   state.copyWith(
          //     isLoading: false,
          //     hasError: false,
          //     startStreamResponse: fakeResponse,
          //   ),
          // );
            final failureOrSuccess = await startStreamUsecase.execute();
            await failureOrSuccess.when((success) async {
              // print(
              //     'chatHistoryCubit: ${chatHistoryCubit.state.messages.length}');

              //emit(StartStreamState.done(response: success));
                emit(
              state.copyWith(
                isLoading: false,
                hasError: false,
                startStreamResponse: success,
              ),

            );
            //========================================Here i send the answer and candidate==================================
            // final MainSendAnswerRequestModelById  sendAnswerRequest = MainSendAnswerRequestModelById (request: MainSendAnswerRequestModel() ,id: success.data!.id);
            //   add( const StartStreamEvent.sendAnswer());
            //   add( const StartStreamEvent.sendCandidate());
            }, (error) {
              print('Error: ${error.message}');
              // emit(StartStreamState.error(error.message));
                      emit(
              state.copyWith(
                isLoading: false,
                hasError: true,
                errorMessage: error.message,
                        sendAnswerResponse: const SendAnswerResponseModel(),
           sendCandidateResponse: const SendAnswerResponseModel(),
           startStreamResponse: const StartStreamModel(),
              ),
            );
            });
        },
        sendAnswer: (value) async {
          emit(state.copyWith(
            isLoading: true,
            hasError: false,
            sendAnswerResponse: const SendAnswerResponseModel(),
            sendCandidateResponse: const SendAnswerResponseModel(),
            startStreamResponse: const StartStreamModel(),
          ));
          // //emit(const StartStreamState.loading());
          // final requestBody = value.request;
          // final failureOrSuccess = await sendAnswerUsecase.execute(requestBody);
          // await failureOrSuccess.when((success) async {
          //   // print(
          //   //     'chatHistoryCubit: ${chatHistoryCubit.state.messages.length}');

          //   //emit(StartStreamState.done(response: success));
          //   emit(
          //     state.copyWith(
          //       isLoading: false,
          //       hasError: false,
          //       sendAnswerResponse: success,
          //     ),
          //   );
          // }, (error) {
          //   print('Error: ${error.message}');
          //   // emit(StartStreamState.error(error.message));
          //   emit(
          //     state.copyWith(
          //       isLoading: false,
          //       hasError: true,
          //       errorMessage: error.message,
          //       sendAnswerResponse: const SendAnswerResponseModel(),
          //       sendCandidateResponse: const SendAnswerResponseModel(),
          //       startStreamResponse: const StartStreamModel(),
          //     ),
          //   );
          // });
        },
        sendCandidate: (value) async {
          //   emit(state.copyWith(
          //     isLoading: true,
          //     hasError: false,
          //     sendAnswerResponse: const SendAnswerResponseModel(),
          //     sendCandidateResponse: const SendAnswerResponseModel(),
          //     startStreamResponse: const StartStreamModel(),
          //   ));
          //   //emit(const StartStreamState.loading());
          //   final requestBody = value.request;
          //   final failureOrSuccess =
          //       await sendCandidateUsecase.execute(requestBody);
          //   await failureOrSuccess.when((success) async {
          //     // print(
          //     //     'chatHistoryCubit: ${chatHistoryCubit.state.messages.length}');

          //     //emit(StartStreamState.done(response: success));
          //     emit(
          //       state.copyWith(
          //         isLoading: false,
          //         hasError: false,
          //         sendCandidateResponse: success,
          //       ),
          //     );
          //   }, (error) {
          //     print('Error: ${error.message}');
          //     // emit(StartStreamState.error(error.message));
          //     emit(
          //       state.copyWith(
          //         isLoading: false,
          //         hasError: true,
          //         errorMessage: error.message,
          //         sendAnswerResponse: const SendAnswerResponseModel(),
          //         sendCandidateResponse: const SendAnswerResponseModel(),
          //         startStreamResponse: const StartStreamModel(),
          //       ),
          //     );
          //   });
        },
        // closeStream: (value) async {
        //   emit(state.copyWith(
        //     isLoading: true,
        //     hasError: false,
        //     sendAnswerResponse: const SendAnswerResponseModel(),
        //     sendCandidateResponse: const SendAnswerResponseModel(),
        //     startStreamResponse: const StartStreamModel(),
        //     closeStreamResponse: const SendAnswerResponseModel(),
        //   ));

        //   final failureOrSuccess = await closeStreamUsecase.execute(value.id);
        //   print('chatHistoryCubit: ${failureOrSuccess}');
        //   await failureOrSuccess.when((success) async {
        //     //emit(StartStreamState.done(response: success));
        //     emit(
        //       state.copyWith(
        //         isLoading: false,
        //         hasError: false,
        //         closeStreamResponse: success,
        //       ),
        //     );
        //   }, (error) {
        //     print('Error: ${error.message}');
        //     // emit(StartStreamState.error(error.message));
        //     emit(
        //       state.copyWith(
        //         isLoading: false,
        //         hasError: true,
        //         errorMessage: error.message,
        //         sendAnswerResponse: const SendAnswerResponseModel(),
        //         sendCandidateResponse: const SendAnswerResponseModel(),
        //         startStreamResponse: const StartStreamModel(),
        //         closeStreamResponse: const SendAnswerResponseModel(),
        //       ),
        //     );
        //   });
        // },
      );
    });
  }
}
