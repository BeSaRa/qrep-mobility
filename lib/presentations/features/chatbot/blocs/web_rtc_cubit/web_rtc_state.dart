import 'package:flutter_webrtc/flutter_webrtc.dart';
class WebRTCState {
   RTCVideoRenderer localRenderer;
   RTCVideoRenderer remoteRenderer; 
  final Map<String, RTCPeerConnection> peerConnections;
  final List<RTCIceCandidate> candidates;
  final RTCSessionDescription? answer;
  final String? errorMessage;

  WebRTCState({
    required this.localRenderer,
    required this.remoteRenderer,
    required this.peerConnections,
    this.candidates = const [],
    this.answer,
    this.errorMessage,
  });

  WebRTCState copyWith({
    RTCVideoRenderer? localRenderer,
    RTCVideoRenderer? remoteRenderer,
    Map<String, RTCPeerConnection>? peerConnections,
    List<RTCIceCandidate>? candidates,
    RTCSessionDescription? answer,
    String? errorMessage,
  }) {
    return WebRTCState(
      localRenderer: localRenderer ?? this.localRenderer,
      remoteRenderer:
          remoteRenderer ?? this.remoteRenderer,
      peerConnections: peerConnections ?? this.peerConnections,
      candidates: candidates ?? this.candidates,
      answer: answer ?? this.answer,
      errorMessage: errorMessage,
    );
  }
}
