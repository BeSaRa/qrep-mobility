import 'package:flutter_webrtc/flutter_webrtc.dart';

class WebRTCState {
  final RTCVideoRenderer localRenderer;
  final Map<String, RTCPeerConnection> peerConnections;
  final String? errorMessage;

  WebRTCState({
    required this.localRenderer,
    required this.peerConnections,
    this.errorMessage,
  });

  WebRTCState copyWith({
    RTCVideoRenderer? localRenderer,
    Map<String, RTCPeerConnection>? peerConnections,
    String? errorMessage,
  }) {
    return WebRTCState(
      localRenderer: localRenderer ?? this.localRenderer,
      peerConnections: peerConnections ?? this.peerConnections,
      errorMessage: errorMessage,
    );
  }
}
