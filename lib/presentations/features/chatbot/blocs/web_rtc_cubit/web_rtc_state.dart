import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
class WebRTCState {
  //  RTCVideoRenderer localRenderer;
   RTCVideoRenderer remoteRenderer; 
  final Map<String, RTCPeerConnection> peerConnections;
  final List<RTCIceCandidate> candidates;
  final RTCSessionDescription? answer;
  final String? errorMessage;
    final bool isPlaying;
  final int elapsedTime; // Timer in seconds
  final bool isComplete2Minutes;
  final bool isMiniScreen;
  Uint8List? lastFrame;
  final GlobalKey? videoKey;
    final bool isMuted;
    final Offset miniScreenPosition;
      bool isConnectionReady; 
          bool isRendererReady;
     final  RTCPeerConnectionState? rTCPeerConnectionState;

  WebRTCState({
    // required this.localRenderer,
    required this.remoteRenderer,
    required this.peerConnections,
    this.candidates = const [],
    this.answer,
    this.errorMessage,
        this.isPlaying = true, 
    this.elapsedTime = 0,
    this.isComplete2Minutes = false,
    this.isMiniScreen = false,
    this.lastFrame,
    this.videoKey,
    required this.isMuted,
    this.miniScreenPosition = Offset.zero,
    this.isConnectionReady = false,
    this.isRendererReady = false,
    this.rTCPeerConnectionState

  });

  WebRTCState copyWith({
    // RTCVideoRenderer? localRenderer,
    RTCVideoRenderer? remoteRenderer,
    Map<String, RTCPeerConnection>? peerConnections,
    List<RTCIceCandidate>? candidates,
    RTCSessionDescription? answer,
    String? errorMessage,
     bool? isPlaying,
    int? elapsedTime,
    bool? isComplete,
    bool? isMiniScreen,
    Uint8List? lastFrame,
   GlobalKey? videoKey,
       bool? isMuted,
       Offset? miniScreenPosition,
         bool? isConnectionReady,
         bool? isRendererReady,
         RTCPeerConnectionState? rTCPeerConnectionState
  }) {
    return WebRTCState(
      // localRenderer: localRenderer ?? this.localRenderer,
      remoteRenderer:
          remoteRenderer ?? this.remoteRenderer,
      peerConnections: peerConnections ?? this.peerConnections,
      candidates: candidates ?? this.candidates,
      answer: answer ?? this.answer,
      errorMessage: errorMessage,
      isPlaying: isPlaying ?? this.isPlaying,
      elapsedTime: elapsedTime ?? this.elapsedTime,
      isComplete2Minutes: isComplete ?? isComplete2Minutes,
      isMiniScreen: isMiniScreen ?? this.isMiniScreen,
        lastFrame: lastFrame ?? this.lastFrame,
        videoKey: videoKey ?? this.videoKey,
          isMuted: isMuted ?? this.isMuted,
          miniScreenPosition: miniScreenPosition ?? this.miniScreenPosition,
          isConnectionReady: isConnectionReady ?? this.isConnectionReady,
          isRendererReady: isRendererReady ?? this.isRendererReady,
          rTCPeerConnectionState: rTCPeerConnectionState ?? this.rTCPeerConnectionState,
    );
  }
}
