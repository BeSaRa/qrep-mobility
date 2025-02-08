import 'dart:developer';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/presentations/features/chatbot/blocs/web_rtc_cubit/web_rtc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:sdp_transform/sdp_transform.dart';

class WebRTCCubit extends Cubit<WebRTCState> {
  WebRTCCubit()
      : super(WebRTCState(
            localRenderer: RTCVideoRenderer(), peerConnections: {}));

  Future<void> initWebRTC(
      OfferModel? offer, List<ICEServerModel> iceServers) async {
    try {
      // Ensure initialization runs on UI thread
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await state.localRenderer.initialize();
        log("RTCVideoRenderer initialized successfully.");
      });

      if (offer == null || offer.sdp.isEmpty) {
        throw "Offer is null or empty, cannot set remote description.";
      }

      // Parse the SDP offer
      Map<String, dynamic> parsedSdp = parse(offer.sdp);
      log("Full SDP:\n${offer.sdp}");
      log("SDP Length: ${offer.sdp.length}");
      String encodedSDP = Uri.encodeComponent(offer.sdp);
      log("Encoded SDP: $encodedSDP");
      String decodedSDP = Uri.decodeComponent(encodedSDP);
      log("Decoded SDP: $decodedSDP");
      log("Parsed SDP: $parsedSdp");
      log("Parsed SDP zak: ${parsedSdp.toString()}");

      // Modify the SDP to use SAVPF instead of SAVP
      // if (parsedSdp['media'] != null) {
      //   for (var media in parsedSdp['media']) {
      //     if (media['proto'] == 'SAVP') {
      //       media['proto'] = 'SAVPF'; // Change SAVP to SAVPF
      //     }
      //   }
      // }
      if (parsedSdp.containsKey('media') &&
          parsedSdp['media'] != null &&
          parsedSdp['media'].isNotEmpty) {
        for (var media in parsedSdp['media']) {
          log("Processing media: $media");

          if (media.containsKey('proto') && media['proto'] == 'SAVP') {
            media['proto'] = 'SAVPF';
          }

          if (media.containsKey('rtp') && media['rtp'].isNotEmpty) {
            media['bandwidth'] = [
              {'type': 'AS', 'limit': 500}
            ];
          }
        }
      } else {
        log("No media lines found in SDP.");
      }

      // Rebuild the SDP with the modified protocol
      String modifiedSdp = write(parsedSdp, null);
      // debugPrint("Modified SDP: $modifiedSdp");

      String peerId =
          offer.sdp.hashCode.toString(); // Unique ID for each connection

      if (state.peerConnections.containsKey(peerId)) {
        log("Peer connection for this offer already exists.");
        return;
      }

      // Convert ICEServerModel list to Map format for WebRTC
      List<Map<String, dynamic>> iceServersList = iceServers.map((server) {
        return {
          'urls': server.urls,
          if (server.username != null && server.username!.isNotEmpty)
            'username': server.username,
          if (server.credential != null && server.credential!.isNotEmpty)
            'credential': server.credential,
        };
      }).toList();

      // Create a new PeerConnection
      RTCPeerConnection peerConnection = await createPeerConnection(
        {'iceServers': iceServersList},
      );
      //================================================
      // Request media permissions
      MediaStream localStream = await navigator.mediaDevices.getUserMedia({
        'video': true,
        'audio': true,
      });
      log("Local stream initialized: ${localStream.getVideoTracks().length} video tracks");
      // Add local stream to peer connection
      localStream.getTracks().forEach((track) {
        peerConnection.addTrack(track, localStream);
      });
      //================================================
      peerConnection.onTrack = (RTCTrackEvent event) {
        log("New track received: ${event.track.kind}");

        if (event.track.kind == 'video' && event.streams.isNotEmpty) {
          log("Remote video stream: ${event.streams[0]}");

          // Check if stream exists and assign it to the renderer
          if (event.streams.isNotEmpty) {
            state.localRenderer.srcObject = event.streams[0];
            log("Remote stream assigned: ${event.streams[0].getVideoTracks().length} video tracks");
            emit(state.copyWith(localRenderer: state.localRenderer));
          } else {
            log("No remote video stream found.");
          }
        }
      };
      await peerConnection.setRemoteDescription(
        RTCSessionDescription(modifiedSdp, offer.type),
      );

      RTCSessionDescription answer = await peerConnection.createAnswer({});
      await peerConnection.setLocalDescription(answer);

      // peerConnection.onTrack = (RTCTrackEvent event) {
      //   if (event.track.kind == 'video') {
      //     state.localRenderer.srcObject = event.streams[0];
      //     setState(() {}); // Trigger UI update
      //   }
      // };

      // // Store the peer connection
      // state.peerConnections[peerId] = peerConnection;
      // setState(() {});
      // Store the peer connection
      final newPeerConnections =
          Map<String, RTCPeerConnection>.from(state.peerConnections);
      newPeerConnections[offer.sdp.hashCode.toString()] = peerConnection;

      emit(state.copyWith(peerConnections: newPeerConnections));
    } catch (e) {
      log("WebRTC Error: $e");
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
}
