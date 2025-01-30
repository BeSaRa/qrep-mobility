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
          // Simulate network request or logic to start stream
          await Future.delayed(Duration(seconds: 2)); // Simulating delay
          //emit(const StartStreamState.loading());
          String sdpComeFromBackend =
              "v=0\r\no=- 3676695386727457225 2 IN IP4 127.0.0.1\r\ns=-\r\nt=0 0\r\na=group:BUNDLE 0 1\r\na=msid-semantic: WMS 3ffe";
          StartStreamModel fakeResponse = StartStreamModel(
              data: WebRTCDataModel(
                  id: "testIdasassasas",
                  webrtcData: WebRTCDetailsModel(iceServers: [
                    ICEServerModel(
                        urls: "turn:fake.turn.server:3478",
                        username: "test",
                        credential: "test123")
// $sdpComeFromBackend
                  ], offer: OfferModel(type: "offer", sdp: '''
v=0
o=- 1372093389836534754 2 IN IP4 127.0.0.1
s=-
t=0 0
a=group:BUNDLE 0 1 2
a=extmap-allow-mixed
a=msid-semantic: WMS 8b9cf34e-1f60-4140-8bf3-af9f658171a2
m=audio 9 UDP/TLS/RTP/SAVPF 111 63 9 0 8 13 110 126
c=IN IP4 0.0.0.0
a=rtcp:9 IN IP4 0.0.0.0
a=ice-ufrag:ucQL
a=ice-pwd:blGQwhO3zUISYtWPgMg3OdUE
a=ice-options:trickle
a=fingerprint:sha-256 9B:E4:52:93:72:D3:25:3D:89:C3:90:06:2A:23:5C:FB:C9:29:45:1D:17:5F:65:6E:94:B1:9C:6F:3C:F6:46:A8
a=setup:actpass
a=mid:0
a=extmap:1 urn:ietf:params:rtp-hdrext:ssrc-audio-level
a=extmap:2 http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time
a=extmap:3 http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions-01
a=extmap:4 urn:ietf:params:rtp-hdrext:sdes:mid
a=sendrecv
a=msid:8b9cf34e-1f60-4140-8bf3-af9f658171a2 5cdbaf40-fa66-4958-aac7-daf4c88e8eea
a=rtcp-mux
a=rtcp-rsize
a=rtpmap:111 opus/48000/2
a=rtcp-fb:111 transport-cc
a=fmtp:111 minptime=10;useinbandfec=1
a=rtpmap:63 red/48000/2
a=fmtp:63 111/111
a=rtpmap:9 G722/8000
a=rtpmap:0 PCMU/8000
a=rtpmap:8 PCMA/8000
a=rtpmap:13 CN/8000
a=rtpmap:110 telephone-event/48000
a=rtpmap:126 telephone-event/8000
a=ssrc:2628972833 cname:A12YrVEoqJd7ZlMc
a=ssrc:2628972833 msid:8b9cf34e-1f60-4140-8bf3-af9f658171a2 5cdbaf40-fa66-4958-aac7-daf4c88e8eea
m=video 9 UDP/TLS/RTP/SAVPF 96 97 102 103 104 105 106 107 108 109 127 125 39 40 45 46 98 99 100 101 112 113 116 117 118
c=IN IP4 0.0.0.0
a=rtcp:9 IN IP4 0.0.0.0
a=ice-ufrag:ucQL
a=ice-pwd:blGQwhO3zUISYtWPgMg3OdUE
a=ice-options:trickle
a=fingerprint:sha-256 9B:E4:52:93:72:D3:25:3D:89:C3:90:06:2A:23:5C:FB:C9:29:45:1D:17:5F:65:6E:94:B1:9C:6F:3C:F6:46:A8
a=setup:actpass
a=mid:1
a=extmap:14 urn:ietf:params:rtp-hdrext:toffset
a=extmap:2 http://www.webrtc.org/experiments/rtp-hdrext/abs-send-time
a=extmap:13 urn:3gpp:video-orientation
a=extmap:3 http://www.ietf.org/id/draft-holmer-rmcat-transport-wide-cc-extensions-01
a=extmap:5 http://www.webrtc.org/experiments/rtp-hdrext/playout-delay
a=extmap:6 http://www.webrtc.org/experiments/rtp-hdrext/video-content-type
a=extmap:7 http://www.webrtc.org/experiments/rtp-hdrext/video-timing
a=extmap:8 http://www.webrtc.org/experiments/rtp-hdrext/color-space
a=extmap:4 urn:ietf:params:rtp-hdrext:sdes:mid
a=extmap:10 urn:ietf:params:rtp-hdrext:sdes:rtp-stream-id
a=extmap:11 urn:ietf:params:rtp-hdrext:sdes:repaired-rtp-stream-id
a=sendrecv
a=msid:8b9cf34e-1f60-4140-8bf3-af9f658171a2 49341b58-99c2-4b6d-98cc-2bd70e4446d8
a=rtcp-mux
a=rtcp-rsize
a=rtpmap:96 VP8/90000
a=rtcp-fb:96 goog-remb
a=rtcp-fb:96 transport-cc
a=rtcp-fb:96 ccm fir
a=rtcp-fb:96 nack
a=rtcp-fb:96 nack pli
a=rtpmap:97 rtx/90000
a=fmtp:97 apt=96
a=rtpmap:102 H264/90000
a=rtcp-fb:102 goog-remb
a=rtcp-fb:102 transport-cc
a=rtcp-fb:102 ccm fir
a=rtcp-fb:102 nack
a=rtcp-fb:102 nack pli
a=fmtp:102 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42001f
a=rtpmap:103 rtx/90000
a=fmtp:103 apt=102
a=rtpmap:104 H264/90000
a=rtcp-fb:104 goog-remb
a=rtcp-fb:104 transport-cc
a=rtcp-fb:104 ccm fir
a=rtcp-fb:104 nack
a=rtcp-fb:104 nack pli
a=fmtp:104 level-asymmetry-allowed=1;packetization-mode=0;profile-level-id=42001f
a=rtpmap:105 rtx/90000
a=fmtp:105 apt=104
a=rtpmap:106 H264/90000
a=rtcp-fb:106 goog-remb
a=rtcp-fb:106 transport-cc
a=rtcp-fb:106 ccm fir
a=rtcp-fb:106 nack
a=rtcp-fb:106 nack pli
a=fmtp:106 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=42e01f
a=rtpmap:107 rtx/90000
a=fmtp:107 apt=106
a=rtpmap:108 H264/90000
a=rtcp-fb:108 goog-remb
a=rtcp-fb:108 transport-cc
a=rtcp-fb:108 ccm fir
a=rtcp-fb:108 nack
a=rtcp-fb:108 nack pli
a=fmtp:108 level-asymmetry-allowed=1;packetization-mode=0;profile-level-id=42e01f
a=rtpmap:109 rtx/90000
a=fmtp:109 apt=108
a=rtpmap:127 H264/90000
a=rtcp-fb:127 goog-remb
a=rtcp-fb:127 transport-cc
a=rtcp-fb:127 ccm fir
a=rtcp-fb:127 nack
a=rtcp-fb:127 nack pli
a=fmtp:127 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=4d001f
a=rtpmap:125 rtx/90000
a=fmtp:125 apt=127
a=rtpmap:39 H264/90000
a=rtcp-fb:39 goog-remb
a=rtcp-fb:39 transport-cc
a=rtcp-fb:39 ccm fir
a=rtcp-fb:39 nack
a=rtcp-fb:39 nack pli
a=fmtp:39 level-asymmetry-allowed=1;packetization-mode=0;profile-level-id=4d001f
a=rtpmap:40 rtx/90000
a=fmtp:40 apt=39
a=rtpmap:45 AV1/90000
a=rtcp-fb:45 goog-remb
a=rtcp-fb:45 transport-cc
a=rtcp-fb:45 ccm fir
a=rtcp-fb:45 nack
a=rtcp-fb:45 nack pli
a=fmtp:45 level-idx=5;profile=0;tier=0
a=rtpmap:46 rtx/90000
a=fmtp:46 apt=45
a=rtpmap:98 VP9/90000
a=rtcp-fb:98 goog-remb
a=rtcp-fb:98 transport-cc
a=rtcp-fb:98 ccm fir
a=rtcp-fb:98 nack
a=rtcp-fb:98 nack pli
a=fmtp:98 profile-id=0
a=rtpmap:99 rtx/90000
a=fmtp:99 apt=98
a=rtpmap:100 VP9/90000
a=rtcp-fb:100 goog-remb
a=rtcp-fb:100 transport-cc
a=rtcp-fb:100 ccm fir
a=rtcp-fb:100 nack
a=rtcp-fb:100 nack pli
a=fmtp:100 profile-id=2
a=rtpmap:101 rtx/90000
a=fmtp:101 apt=100
a=rtpmap:112 H264/90000
a=rtcp-fb:112 goog-remb
a=rtcp-fb:112 transport-cc
a=rtcp-fb:112 ccm fir
a=rtcp-fb:112 nack
a=rtcp-fb:112 nack pli
a=fmtp:112 level-asymmetry-allowed=1;packetization-mode=1;profile-level-id=64001f
a=rtpmap:113 rtx/90000
a=fmtp:113 apt=112
a=rtpmap:116 red/90000
a=rtpmap:117 rtx/90000
a=fmtp:117 apt=116
a=rtpmap:118 ulpfec/90000
a=ssrc-group:FID 834903406 441151903
a=ssrc:834903406 cname:A12YrVEoqJd7ZlMc
a=ssrc:834903406 msid:8b9cf34e-1f60-4140-8bf3-af9f658171a2 49341b58-99c2-4b6d-98cc-2bd70e4446d8
a=ssrc:441151903 cname:A12YrVEoqJd7ZlMc
a=ssrc:441151903 msid:8b9cf34e-1f60-4140-8bf3-af9f658171a2 49341b58-99c2-4b6d-98cc-2bd70e4446d8
m=application 9 UDP/DTLS/SCTP webrtc-datachannel
c=IN IP4 0.0.0.0
a=ice-ufrag:ucQL
a=ice-pwd:blGQwhO3zUISYtWPgMg3OdUE
a=ice-options:trickle
a=fingerprint:sha-256 9B:E4:52:93:72:D3:25:3D:89:C3:90:06:2A:23:5C:FB:C9:29:45:1D:17:5F:65:6E:94:B1:9C:6F:3C:F6:46:A8
a=setup:actpass
a=mid:2
a=sctp-port:5000
a=max-message-size:262144

'''))));

          emit(
            state.copyWith(
              isLoading: false,
              hasError: false,
              startStreamResponse: fakeResponse,
            ),
          );
          //   final failureOrSuccess = await startStreamUsecase.execute();
          //   await failureOrSuccess.when((success) async {
          //     // print(
          //     //     'chatHistoryCubit: ${chatHistoryCubit.state.messages.length}');

          //     //emit(StartStreamState.done(response: success));
          //       emit(
          //     state.copyWith(
          //       isLoading: false,
          //       hasError: false,
          //       startStreamResponse: success,
          //     ),

          //   );
          //   //========================================Here i send the answer and candidate==================================
          //   //ZAK: أسأل عبد العزيز
          //   // final MainSendAnswerRequestModelById  sendAnswerRequest = MainSendAnswerRequestModelById (request: ,id: success.data!.id);
          //   //   add( const StartStreamEvent.sendAnswer());
          //   //   add( const StartStreamEvent.sendCandidate());
          //   }, (error) {
          //     print('Error: ${error.message}');
          //     // emit(StartStreamState.error(error.message));
          //             emit(
          //     state.copyWith(
          //       isLoading: false,
          //       hasError: true,
          //       errorMessage: error.message,
          //               sendAnswerResponse: const SendAnswerResponseModel(),
          //  sendCandidateResponse: const SendAnswerResponseModel(),
          //  startStreamResponse: const StartStreamModel(),
          //     ),
          //   );
          //   });
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
