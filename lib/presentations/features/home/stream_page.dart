import 'dart:convert';
import 'dart:developer';

import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/domain/models/requests/chatbot_requests/chatbot_request_model.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/send_answer_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/send_candidate_usecase.dart';
import 'package:ebla/domain/usecases/chatbot_usecase/start_stream_usecase.dart';
import 'package:ebla/presentations/features/chatbot/blocs/close_stream/close_stream_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../chatbot/blocs/stream_id_cubit.dart/stream_id_cubit.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  late final WebViewController _controller;
  late final CloseStreamBloc _closeStreamBloc;
  String _webRtcId = '';

  @override
  void initState() {
    super.initState();
    _initializeWebViewController();
    _closeStreamBloc = instance<CloseStreamBloc>();
    // Auto-start the stream when the page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StreamBloc>().add(StartStreamRequested());
    });
  }

  void _initializeWebViewController() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..addJavaScriptChannel(
        'WebRTCBridge',
        onMessageReceived: (JavaScriptMessage message) {
          _handleWebViewMessage(message);
        },
      );
  }

  void _handleWebViewMessage(JavaScriptMessage message) {
    final data = jsonDecode(message.message);
    log('Message from WebView: $data');

    final bloc = context.read<StreamBloc>();

    if (data['type'] == 'answer') {
      bloc.add(SendAnswerToBackend(
        streamId: _webRtcId,
        sdp: data['sdp'],
        type: data['type'],
      ));
    } else if (data['type'] == 'candidate') {
      bloc.add(SendCandidateToBackend(
        streamId: _webRtcId,
        candidate: data['candidate'],
        sdpMid: data['sdpMid'],
        sdpMLineIndex: data['sdpMLineIndex'],
      ));
    } else if (data['type'] == 'error') {
      bloc.add(StreamFailed(data['message']));
    }
  }

// Add this method to build the close button
  Widget _buildCloseButton() {
    return Positioned(
      top: 50,
      right: 20,
      child: BlocListener<CloseStreamBloc, CloseStreamState>(
        bloc: _closeStreamBloc,
        listener: (context, state) {
          state.whenOrNull(
            done: (response) {
              Navigator.of(context).pop();
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            },
          );
        },
        child: IconButton(
          icon: const Icon(Icons.close, color: Colors.white, size: 30),
          onPressed: () {
            if (_webRtcId.isNotEmpty) {
              _closeStreamBloc.add(CloseStreamEvent.closeStream(_webRtcId));
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocConsumer<StreamBloc, StreamState>(
            listener: (context, state) {
              if (state is StreamError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${state.message}')),
                );
              }
            },
            builder: (context, state) {
              if (state is StreamLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is StreamStarted) {
                _webRtcId = state.webRtcData.data?.id ?? '';
                //1- save the ID in cubit to use it when i close the stream
                BlocProvider.of<StreamIdCubit>(context)
                    .setStreamId(state.webRtcData.data?.id ?? "");
                log("zak ${state.webRtcData.data?.id}");
                log("zak2 ${BlocProvider.of<StreamIdCubit>(context).state.streamId}");
                return _buildWebView(state.webRtcData);
              } else if (state is StreamError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${state.message}'),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<StreamBloc>()
                              .add(StartStreamRequested());
                        },
                        child: const Text("Retry Stream"),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          if (_webRtcId.isNotEmpty) _buildCloseButton(),
        ],
      ),
    );
  }

  Widget _buildStartButton() {
    return ElevatedButton(
      onPressed: () {
        context.read<StreamBloc>().add(StartStreamRequested());
      },
      child: const Text("Start Stream"),
    );
  }

  Widget _buildWebView(StartStreamModel webRtcData) {
    final offerModel = webRtcData.data?.webrtcData?.offer;
    final iceServers = webRtcData.data?.webrtcData?.iceServers ?? [];

    RTCSessionDescription? rtcOffer;
    if (offerModel != null) {
      rtcOffer = RTCSessionDescription(
        offerModel.sdp ?? '',
        offerModel.type ?? 'offer',
      );
    }
    return FutureBuilder(
      future: _controller.loadHtmlString(_buildHtml(rtcOffer, iceServers)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return WebViewWidget(controller: _controller);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  String _buildHtml(
      RTCSessionDescription? offer, List<ICEServerModel> iceServers) {
    final escapedSdp =
        offer?.sdp?.replaceAll('\r\n', '\\r\\n').replaceAll('\n', '\\n') ?? '';

    return '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>WebRTC Stream</title>
  <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
  <style>
    #remoteVideo {
      width: 100%;
      height: 100%;
      background-color: #000;
      object-fit: contain;
    }
    body {
      margin: 0;
      padding: 0;
      background-color: #000;
      overflow: hidden;
    }
    #status {
      position: absolute;
      top: 10px;
      left: 10px;
      color: white;
      background: rgba(0,0,0,0.5);
      padding: 5px;
      z-index: 100;
    }
    #loader {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      color: white;
    }
  </style>
</head>
<body>
  <div id="status">Initializing connection...</div>
  <div id="loader">Loading video stream...</div>
  <video id="remoteVideo" autoplay playsinline></video>

  <script>
    let peerConnection;
    const remoteVideo = document.getElementById('remoteVideo');
    const statusDiv = document.getElementById('status');
    const loaderDiv = document.getElementById('loader');
    const bridge = WebRTCBridge;

    function updateStatus(message) {
      statusDiv.textContent = message;
    }

    function showLoader(show) {
      loaderDiv.style.display = show ? 'block' : 'none';
    }

    function handleError(error) {
      console.error('WebRTC Error:', error);
      updateStatus('Error: ' + error.message);
      bridge.postMessage(JSON.stringify({
        type: 'error',
        message: error.message
      }));
      showLoader(false);
    }

    function sendToFlutter(message) {
      bridge.postMessage(JSON.stringify(message));
    }

    async function initializeWebRTC() {
      try {
        updateStatus('Initializing WebRTC...');
        showLoader(true);
        
        const configuration = {
          iceServers: ${jsonEncode(iceServers)},
          iceTransportPolicy: 'relay'
        };

        peerConnection = new RTCPeerConnection(configuration);
        updateStatus('PeerConnection created');

        // Handle incoming tracks
        peerConnection.ontrack = (event) => {
          updateStatus('Received media stream');
          const stream = event.streams[0] || new MediaStream();
          if (event.track) stream.addTrack(event.track);
            // Log the tracks we received
  console.log('zak Received tracks:', stream.getTracks());
  stream.getAudioTracks().forEach(track => {
    console.log('zak Audio track:', track);
  });
          remoteVideo.srcObject = stream;
          //zak
//           remoteVideo.onloadedmetadata = () => {
//   updateStatus('Stream playing');
//   const playPromise = remoteVideo.play();
  
//   if (playPromise !== undefined) {
//     playPromise.catch(error => {
//       if (error.name === 'NotAllowedError') {
//         // Autoplay was prevented, mute and try again
//         remoteVideo.muted = true;
//         remoteVideo.play().catch(handleError);
//       } else {
//         handleError(error);
//       }
//     });
//   }
// };
remoteVideo.onloadedmetadata = () => {
  updateStatus('Stream playing');
  const playPromise = remoteVideo.play();
  
  if (playPromise !== undefined) {
    playPromise.catch(error => {
      if (error.name === 'NotAllowedError') {
        // First try with muted audio
        remoteVideo.muted = true;
        remoteVideo.play()
          .then(() => {
            // After successful play, try unmuting (requires user interaction)

            const unmuteButton = document.createElement('button');
            unmuteButton.textContent = 'Unmute Audio';
            unmuteButton.style.position = 'absolute';
            unmuteButton.style.top = '20px';
            unmuteButton.style.right = '50px';
            unmuteButton.style.transform = 'translateX(-50%)';
            unmuteButton.style.zIndex = '100';
            unmuteButton.onclick = () => {
              remoteVideo.muted = false;
              unmuteButton.remove();
            };
            
            document.body.appendChild(unmuteButton);
            
          })
          .catch(handleError);
      } else {
        handleError(error);
      }
    });
  }
};
        };

        // Handle ICE candidates
        peerConnection.onicecandidate = (event) => {
          if (event.candidate) {
            updateStatus('New ICE candidate');
            sendToFlutter({
              type: 'candidate',
              candidate: event.candidate.candidate,
              sdpMid: event.candidate.sdpMid,
              sdpMLineIndex: event.candidate.sdpMLineIndex
            });
          }
        };

        peerConnection.oniceconnectionstatechange = () => {
          updateStatus('ICE state: ' + peerConnection.iceConnectionState);
          if (peerConnection.iceConnectionState === 'failed') {
            handleError(new Error('ICE Connection failed'));
          }
        };

        peerConnection.onconnectionstatechange = () => {
          updateStatus('Connection state: ' + peerConnection.connectionState);
        };

        // Set the remote description from the offer
        const offer = {
          sdp: "$escapedSdp",
          type: "${offer?.type}"
        };
        
        updateStatus('Setting remote description');
        await peerConnection.setRemoteDescription(new RTCSessionDescription(offer));
        
        updateStatus('Creating answer');
        const answer = await peerConnection.createAnswer();
        
        updateStatus('Setting local description');
        await peerConnection.setLocalDescription(answer);
        
        updateStatus('Sending answer to Flutter');
        sendToFlutter({
          type: 'answer',
          sdp: answer.sdp,
          type: answer.type
        });

      } catch (error) {
        handleError(error);
      }
    }

    // Initialize when page loads
    document.addEventListener('DOMContentLoaded', initializeWebRTC);

    // Cleanup on page unload
    window.addEventListener('beforeunload', () => {
      if (peerConnection) {
        peerConnection.close();
      }
    });
  </script>
</body>
</html>
''';
  }
}

// BLoC Events
abstract class StreamEvent {}

class StartStreamRequested extends StreamEvent {}

class SendAnswerToBackend extends StreamEvent {
  final String streamId;
  final String sdp;
  final String type;

  SendAnswerToBackend({
    required this.streamId,
    required this.sdp,
    required this.type,
  });
}

class SendCandidateToBackend extends StreamEvent {
  final String streamId;
  final String candidate;
  final String sdpMid;
  final int sdpMLineIndex;

  SendCandidateToBackend({
    required this.streamId,
    required this.candidate,
    required this.sdpMid,
    required this.sdpMLineIndex,
  });
}

class StreamFailed extends StreamEvent {
  final String message;
  StreamFailed(this.message);
}

// BLoC States
abstract class StreamState {}

class StreamInitial extends StreamState {}

class StreamLoading extends StreamState {}

class StreamStarted extends StreamState {
  final StartStreamModel webRtcData;
  StreamStarted(this.webRtcData);
}

class StreamError extends StreamState {
  final String message;
  StreamError(this.message);
}

// BLoC Logic
class StreamBloc extends Bloc<StreamEvent, StreamState> {
  final StartStreamUsecase startStreamUsecase;
  final SendAnswerUsecase sendAnswerUsecase;
  final SendCandidateUsecase sendCandidateUsecase;

  StreamBloc({
    required this.startStreamUsecase,
    required this.sendAnswerUsecase,
    required this.sendCandidateUsecase,
  }) : super(StreamInitial()) {
    on<StartStreamRequested>(_onStartStream);
    on<SendAnswerToBackend>(_onSendAnswerToBackend);
    on<SendCandidateToBackend>(_onSendCandidateToBackend);
    on<StreamFailed>(_onStreamFailed);
  }

  Future<void> _onStartStream(
    StartStreamRequested event,
    Emitter<StreamState> emit,
  ) async {
    emit(StreamLoading());

    try {
      final result = await startStreamUsecase.execute();
      StartStreamModel startStreamModel = const StartStreamModel();

      await result.when((success) async {
        startStreamModel = success;
      }, (error) {
        throw Exception(error.message ?? "Start stream failed");
      });

      emit(StreamStarted(startStreamModel));
    } catch (e) {
      emit(StreamError(e.toString()));
    }
  }

  Future<void> _onSendAnswerToBackend(
    SendAnswerToBackend event,
    Emitter<StreamState> emit,
  ) async {
    try {
      final sendAnswerResult =
          await sendAnswerUsecase.execute(MainSendAnswerRequestModelById(
        id: event.streamId,
        request: MainSendAnswerRequestModel(
          answer: SendAnswerRequestModel(
            sdp: event.sdp,
            type: event.type,
          ),
        ),
      ));

      sendAnswerResult.when(
        (success) => log("Answer sent successfully"),
        (error) => throw Exception(error.message ?? "Send answer failed"),
      );
    } catch (e) {
      emit(StreamError('Failed to send answer: ${e.toString()}'));
    }
  }

  Future<void> _onSendCandidateToBackend(
    SendCandidateToBackend event,
    Emitter<StreamState> emit,
  ) async {
    try {
      final sendCandidateResult =
          await sendCandidateUsecase.execute(MainSendCandidateRequestModelById(
        id: event.streamId,
        request: MainSendCandidateRequestModel(
          candidate: SendCandidateRequestModel(
            candidate: event.candidate,
            sdpMid: event.sdpMid,
            sdpMLineIndex: event.sdpMLineIndex,
          ),
        ),
      ));

      sendCandidateResult.when(
        (success) => log("Candidate sent successfully"),
        (error) => log("Error sending candidate: ${error.message}"),
      );
    } catch (e) {
      log('Failed to send candidate: ${e.toString()}');
    }
  }

  void _onStreamFailed(StreamFailed event, Emitter<StreamState> emit) {
    emit(StreamError(event.message));
  }
}
//zak1
