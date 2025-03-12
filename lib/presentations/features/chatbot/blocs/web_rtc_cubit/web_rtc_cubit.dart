// ignore_for_file: unnecessary_null_comparison
import 'dart:async';
import 'dart:developer';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/presentations/features/chatbot/blocs/web_rtc_cubit/web_rtc_state.dart';
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
//------------------- Audio Actions in video ------------------
  void toggleMute() {
    bool newMuteState = !state.isMuted;

    // Mute/unmute all audio tracks
    state.remoteRenderer.srcObject?.getAudioTracks().forEach((track) {
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
  void togglePlayPause() async {
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
      if (state.elapsedTime >= 150) {
        // Assume video is 2.5 minutes long
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
    // emit(WebRTCState(
    //   peerConnections: {},
    //   remoteRenderer: RTCVideoRenderer(),
    //   isMuted: false,
    //   isPlaying: false,
    //   isMiniScreen: false,
    //   lastFrame: null,
    //   videoKey: null,
    //   answer: null,
    //   errorMessage: null,
    //   isComplete2Minutes: false,
    //   candidates: [],
    //   elapsedTime: 0,
    // ));
    for (RTCPeerConnection element in state.peerConnections.values) {
      // // Remove all event listeners
      // element.onTrack = null;
      // element.onRemoveStream = null;
      // element.onIceCandidate = null;
      // element.onIceConnectionState = null;
      // element.onSignalingState = null;

      // Close the connection
      element.close();
      // await element.close();
    }

    state.peerConnections.clear();
    // Remove any stream listeners
    // state.localRenderer.srcObject?.getTracks().forEach((track) {
    //   track.stop();
    // });
    state.remoteRenderer.srcObject?.getTracks().forEach((track) async {
      // if (track.kind == "audio") {
      //   await Helper.setMicrophoneMute(true, track);
      // }
      track.stop();
      track.enabled = false;
    });

    // await state.localRenderer.dispose();
    // state.localRenderer = RTCVideoRenderer();
    await state.remoteRenderer.dispose();
    state.remoteRenderer = RTCVideoRenderer();
    //     // Reset Audio Mode to Normal
    // final AudioManager audioManager = AudioManager();
    // audioManager.mode = Mode.normal;
    // audioManager.abandonAudioFocus();

    // Emit the new state to indicate the call has ended
//========================== Zak ===================================
    await resetAudioMode();
//=============================================================

    log("zak closed fro webRtc CUbit");
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

  Future<void> initializeRenderers() async {
    // Initialize the remote renderer
    await state.remoteRenderer.initialize();
    log("RTCVideoRenderer initialized successfully.");
  }

  Future<void> initWebRTC(
      OfferModel? offer, List<ICEServerModel> iceServers) async {
    try {
      // Ensure initialization runs on UI thread
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // await state.localRenderer.initialize();
        await initializeRenderers();
      });

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
      peerConnection.onConnectionState = (RTCPeerConnectionState state) {
        log("PeerConnection State: $state");
      };

      peerConnection.onSignalingState = (RTCSignalingState state) {
        log("Signaling State: $state");
      };
      peerConnection.onIceGatheringState = (RTCIceGatheringState state) {
        log("ICE Gathering State: $state");
      };
      //------------- just for debug ----------------
//=====================================================================================

      peerConnection.onTrack = (event) async {
        state.remoteRenderer.srcObject = event.streams[0];

        emit(state.copyWith(remoteRenderer: state.remoteRenderer));
      };

      //============================== Candidate ===========================
      await peerConnection.setRemoteDescription(
        RTCSessionDescription(offer.sdp, offer.type),
      );

      peerConnection.onIceCandidate = (RTCIceCandidate candidate) async {
        emit(state.copyWith(
          candidates: List.from(state.candidates)..add(candidate),
        ));
      };

      //============================== Answer ===========================

      RTCSessionDescription finalAnswer = await peerConnection.createAnswer({
        'offerToReceiveAudio': true,
        'offerToReceiveVideo': true,
      });
      await peerConnection.setLocalDescription(finalAnswer);
      // Update state with the final answer
      emit(state.copyWith(answer: finalAnswer));
      log('answerWebRtcCubit ${finalAnswer.sdp}');
      log('answerWebRtcCubit.type ${finalAnswer.type}');
      //================================================

      // Store the peer connection
      final newPeerConnections =
          Map<String, RTCPeerConnection>.from(state.peerConnections);
      newPeerConnections[offer.sdp.hashCode.toString()] = peerConnection;
      log("newPeerConnections State: ${newPeerConnections.entries}");
      emit(state.copyWith(peerConnections: newPeerConnections));
    } catch (e) {
      log("WebRTC Error: $e");
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
}
