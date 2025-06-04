// ignore_for_file: unnecessary_null_comparison
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/presentations/features/chatbot/blocs/web_rtc_cubit/web_rtc_state.dart';
import 'package:ebla/presentations/resources/resources.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'dart:ui' as ui;

class WebRTCCubit extends Cubit<WebRTCState> {
  Timer? _internalVideoTimer;
  final GlobalKey videoKey = GlobalKey(); // Key for capturing frame
  WebRTCCubit()
      : super(WebRTCState(
          // localRenderer: RTCVideoRenderer(),
          peerConnections: {},
          remoteRenderer: RTCVideoRenderer(),
          isMuted: false,
          isMiniScreen: false,
          miniScreenPosition: Offset(AppSizeW.s250, AppSizeH.s50),
        ));

  Future<void> _initializeRenderer() async {
    try {
      await state.remoteRenderer.initialize();
      emit(state.copyWith(isRendererReady: true));
      log("RTCVideoRenderer initialized successfully.");
    } catch (e) {
      log("Renderer initialization error: $e");
      emit(state.copyWith(errorMessage: "Renderer initialization failed"));
    }
  }

//------------------- Audio Actions in video ------------------
  void toggleMute() {
    bool newMuteState = !state.isMuted;

    // Mute/unmute all audio tracks
    state.remoteRenderer.srcObject?.getAudioTracks().forEach((track) {
      print("Track state: ${track.label}, enabled: ${track.enabled}");
      track.enabled = !newMuteState;
    });

    emit(state.copyWith(isMuted: newMuteState));
  }

//------------------- miniscreen Actions in video ------------------
  void toggleMiniScreen() {
    emit(state.copyWith(
      isMiniScreen: !state.isMiniScreen,
    ));
  }

  void updateMiniScreenPosition(Offset newPosition) {
    emit(state.copyWith(miniScreenPosition: newPosition));
  }

//------------------- Pause Action in video ------------------
  Future<void> togglePlayPause() async {
    emit(state.copyWith(isPlaying: !state.isPlaying));
    Uint8List? lastFrame;
    if (!state.isPlaying) {
      // Capture last frame before pausing
      lastFrame = await _captureLastFrame();

      emit(state.copyWith(lastFrame: lastFrame));
      log("last frame 1}: ${state.lastFrame}");
    } else {
      state.lastFrame = null;
      emit(state.copyWith(lastFrame: state.lastFrame));
      log("last frame 2}: ${state.lastFrame}");
    }

    // for (var track in state.remoteRenderer.srcObject!.getVideoTracks()) {
    //   track.enabled = state.isPlaying; // Prevent black screen
    // }
    // Mute/unmute all audio tracks when i pressed pause
    state.remoteRenderer.srcObject?.getAudioTracks().forEach((track) {
      print("Track state: ${track.label}, enabled: ${track.enabled}");
      track.enabled = state.isPlaying;
    });
    if (state.isPlaying) {
    } else {
      _stopTimer();
    }
  }

  Future<Uint8List?> _captureLastFrame() async {
    try {
      RenderRepaintBoundary? boundary =
          videoKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) return null;

      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      return null;
    }
  }

  void startTimer() {
    _internalVideoTimer?.cancel();
    _internalVideoTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.rTCPeerConnectionState ==
          RTCPeerConnectionState.RTCPeerConnectionStateFailed) {
        _stopTimer();
        emit(state.copyWith(isComplete: true));
      } else if (state.elapsedTime < 0) {
        ///NOTE:
        ///here: it's the timer in the UI
        _stopTimer();
        emit(state.copyWith(isComplete: true));
      } else {
        log(state.elapsedTime.toString());
        emit(state.copyWith(elapsedTime: state.elapsedTime + 1));
      }
    });
  }

  void _stopTimer() {
    _internalVideoTimer?.cancel();
  }

  @override
  Future<void> close() {
    _internalVideoTimer?.cancel();
    return super.close();
  }

//------------------- End Actions in video ------------------

  Future<void> closeStreamCubit() async {
    for (RTCPeerConnection element in state.peerConnections.values) {
      // Close the connection
      element.close();
    }

    state.peerConnections.clear();
    state.remoteRenderer.srcObject?.getTracks().forEach((track) async {
      track.stop();
      track.enabled = false;
    });
    try {
      // state.remoteRenderer.srcObject = null;
      await state.remoteRenderer.dispose();
      //Important Note: the next line is for hide miniscreen if user closed avatar and the screen is mini
      if (state.isMiniScreen == true) {
        toggleMiniScreen();
      }
    } catch (e) {
      log("Error disposing renderer: $e");
    }
    state.isRendererReady = false;
//=============================================================
    await resetAudioMode();
//=============================================================
    log("closed from webRtc Cubit");
  }

  static const platform = MethodChannel('com.eblacorp.qrep/audio');

  // Call native code to reset the audio mode
  Future<void> resetAudioMode() async {
    try {
      await platform.invokeMethod('resetAudioMode');
    } on PlatformException catch (e) {
      log("Failed to reset audio mode: '${e.message}'.");
    } on MissingPluginException catch (e) {
      log("Error: MissingPluginException. $e");
    }
  }
  Future<void> initWebRTC(
      OfferModel? offer, List<ICEServerModel> iceServers) async {
    try {
      emit(state.copyWith(isConnectionReady: false));

      if (!state.isRendererReady) {
        await _initializeRenderer();
      }
      // Ensure initialization runs on UI thread
      WidgetsBinding.instance.addPostFrameCallback((_) async {});

      if (offer == null || offer.sdp.isEmpty) {
        throw "Offer is null or empty, cannot set remote description.";
      }

      String peerId =
          offer.sdp.hashCode.toString(); // Unique ID for each connection

      if (state.peerConnections.containsKey(peerId)) {
        log("Peer connection for this offer already exists.");
        return;
      }
//========================1- Request media permissions========================
      // MediaStream localStream = await navigator.mediaDevices.getUserMedia({
      //   'video': true,
      //   'audio': true,
      // });

      // log("Local stream initialized: ${localStream.getVideoTracks().length} video tracks");

//======================== 2- Create a new PeerConnection ========================
      // Convert ICEServerModel list to Map format for WebRTC
      List<Map<String, dynamic>> iceServersList = iceServers.map((server) {
        log("iceServers urls:${server.urls}");
        log("iceServers username:${server.username}");
        log("iceServers credential:${server.credential}");
        return {
          'urls': server.urls,
          if (server.username != null && server.username.isNotEmpty)
            'username': server.username,
          if (server.credential != null && server.credential.isNotEmpty)
            'credential': server.credential,
        };
      }).toList();

      RTCPeerConnection peerConnection = await createPeerConnection(
        {
          'iceServers': iceServersList,
          'iceTransportPolicy': 'relay',
        },
      );
      //-------------  just for debug ----------------
      peerConnection.onConnectionState = (RTCPeerConnectionState state1) {
        if (state1 != RTCPeerConnectionState.RTCPeerConnectionStateClosed) {
          emit(state.copyWith(rTCPeerConnectionState: state1));
        }

        log("PeerConnection State: $state1");
      };

      peerConnection.onSignalingState = (RTCSignalingState state) {
        log("Signaling State: $state");
      };
      peerConnection.onIceGatheringState = (RTCIceGatheringState state) {
        log("ICE Gathering State: $state");
      };
//=====================================================================================
      peerConnection.onTrack = (event) async {
        print('🔈 onTrack kind=${event.track.kind}');
        if (Platform.isAndroid) {
          if (!state.isRendererReady) {
            await _initializeRenderer();
          }
          if (state.remoteRenderer.srcObject != event.streams[0]) {
            state.remoteRenderer.srcObject = event.streams[0];
            emit(state.copyWith(remoteRenderer: state.remoteRenderer));
          }
        }
        if (Platform.isIOS) {
          if (!state.isRendererReady) {
            log("Renderer not ready - initializing...");
            await _initializeRenderer();
          }

          // Call the native audio activation
          final result = await platform.invokeMethod('forceAudioPlayback');
          print("🧨 forceAudioPlayback result: $result");

          if (state.remoteRenderer.srcObject == null) {
            state.remoteRenderer.srcObject = event.streams.first;
            print("🔊 Initial media stream assigned");
          } else {
            print("🔄 Adding track to existing stream");
            state.remoteRenderer.srcObject?.addTrack(event.track);
          }
          emit(state.copyWith(remoteRenderer: state.remoteRenderer));
        }
      };
      //============================== Candidate ===========================
      await peerConnection.setRemoteDescription(
        RTCSessionDescription(offer.sdp, offer.type),
      );
      print("📨 Received Offer SDP:\n${offer.sdp}");

//NOTE: I did this completer to make sure that the candidates initilize succesfully
      // peerConnection.onIceCandidate = (RTCIceCandidate candidate) async {
      //   emit(state.copyWith(
      //     candidates: List.from(state.candidates)..add(candidate),
      //   ));
      // };
      final completer = Completer<void>();
      int candidateCount = 0;

      peerConnection.onIceCandidate = (RTCIceCandidate candidate) async {
        print('❄️ Local ICE candidate: ${candidate.candidate}');
        emit(state.copyWith(
          candidates: List.from(state.candidates)..add(candidate),
        ));
        peerConnection.onIceConnectionState = (state) {
          print('❄️ ICE connection state: $state');
        };

        candidateCount++;
        // Consider connection ready after receiving at least X candidates
        if (candidateCount >= 2 && !completer.isCompleted) {
          completer.complete();
        }
      };
      //============================== Answer ===========================
      RTCSessionDescription finalAnswer = await peerConnection.createAnswer({
        'offerToReceiveAudio': true,
        'offerToReceiveVideo': true,
      });
      await peerConnection.setLocalDescription(finalAnswer);

      // Update state with the final answer
      emit(state.copyWith(answer: finalAnswer));
      print('answerWebRtcCubit ${finalAnswer.sdp}');
      print('answerWebRtcCubit.type ${finalAnswer.type}');
      print('offerWebRtc: ${offer.sdp}');
      print('offerWebRtc.type: ${offer.type}');

      //================================================

      // Store the peer connection
      final newPeerConnections =
          Map<String, RTCPeerConnection>.from(state.peerConnections);
      newPeerConnections[offer.sdp.hashCode.toString()] = peerConnection;
      log("newPeerConnections State: ${newPeerConnections.entries}");
      // After creating answer
      await completer.future;
      state.remoteRenderer.srcObject?.getAudioTracks().forEach((track) {
        print(" After creating answer");
        print(
            "Track state: ${track.label}, enabled: ${track.enabled}, ${state.isPlaying}");
        track.enabled = state.isPlaying;
      });

      emit(state.copyWith(isConnectionReady: true));
      emit(state.copyWith(peerConnections: newPeerConnections));
    } catch (e) {
      log("WebRTC Error: $e");
      emit(
          state.copyWith(errorMessage: e.toString(), isConnectionReady: false));
    }
  }

  Future<void> forceAudioPlaybackAfterGesture() async {
    const platform = MethodChannel('com.eblacorp.qrep/audio');
    try {
      await platform.invokeMethod('forceAudioPlayback');
      // await platform.invokeMethod('playSilentAudio');
      debugPrint('forceAudioPlayback called.');
    } on PlatformException catch (e) {
      debugPrint("Failed to force audio playback: '${e.message}'.");
    }
    state.remoteRenderer.srcObject
        ?.getAudioTracks()
        .forEach((t) => t.enabled = true);
  }
}
