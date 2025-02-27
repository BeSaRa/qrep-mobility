// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/presentations/features/chatbot/blocs/web_rtc_cubit/web_rtc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class WebRTCCubit extends Cubit<WebRTCState> {
  WebRTCCubit()
      : super(WebRTCState(
            localRenderer: RTCVideoRenderer(),
            peerConnections: {},
            remoteRenderer: RTCVideoRenderer()));

  Future<void> closeStreamCubit() async {
    for (RTCPeerConnection element in state.peerConnections.values) {
      element.close();
    }

    state.peerConnections.clear();
    // Remove any stream listeners
    state.localRenderer.srcObject?.getTracks().forEach((track) {
      track.stop();
    });
    state.remoteRenderer.srcObject?.getTracks().forEach((track) {
      track.stop();
    });
    state.localRenderer.dispose();
    state.localRenderer = RTCVideoRenderer();
    state.remoteRenderer.dispose();
    state.remoteRenderer = RTCVideoRenderer();
  }

  Future<void> initWebRTC(
      OfferModel? offer, List<ICEServerModel> iceServers) async {
    try {
      // Ensure initialization runs on UI thread
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await state.localRenderer.initialize();
        await state.remoteRenderer.initialize();
        log("RTCVideoRenderer initialized successfully.");
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
