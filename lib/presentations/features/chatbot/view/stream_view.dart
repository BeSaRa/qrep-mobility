import 'dart:developer';

import 'package:ebla/app/depndency_injection.dart';
import 'package:ebla/domain/models/chatboot/chatbot_response_model.dart';
import 'package:ebla/presentations/features/chatbot/blocs/close_stream/close_stream_bloc.dart';
import 'package:ebla/presentations/features/chatbot/blocs/start_stream_bloc/start_stream_bloc.dart';
import 'package:ebla/presentations/resources/strings_manager.dart';
import 'package:ebla/presentations/resources/values_manager.dart';
import 'package:ebla/presentations/widgets/taost_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:sdp_transform/sdp_transform.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({Key? key}) : super(key: key);

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  late StartStreamBloc startStreamBloc;
  late CloseStreamBloc closeStreamBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startStreamBloc = instance<StartStreamBloc>();
    closeStreamBloc = instance<CloseStreamBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Stream")),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: startStreamBloc,
          ),
          BlocProvider.value(
            value: closeStreamBloc,
          ),
        ],
        child: AvatarStreamWidget1(),
      ),
    );
  }
}

class AvatarStreamWidget1 extends StatelessWidget {
  const AvatarStreamWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartStreamBloc, StartStreamState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state.isLoading) const CircularProgressIndicator(),
            if (state.hasError)
              Text("Error: ${state.errorMessage}",
                  style: TextStyle(color: Colors.red)),
            if (state.startStreamResponse.data?.webrtcData != null)
              Stack(
                children: [
                  // Wrap the VideoPlayerWidget with a Positioned widget to constrain its size
                  Positioned(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).width,
                      child: VideoPlayerWidget(
                        offer:
                            state.startStreamResponse.data!.webrtcData!.offer,
                        iceServers: state
                            .startStreamResponse.data!.webrtcData!.iceServers,
                      ),
                    ),
                  ),
                  Positioned(
                    child: BlocConsumer<CloseStreamBloc, CloseStreamState>(
                      listener: (context, state) {
                        state.mapOrNull(
                          error: (value) => errorToast(value.message, context),
                        );
                      },
                      builder: (context, closeState) {
                        return GestureDetector(
                          onTap: () {
                            context.read<CloseStreamBloc>().add(
                                 CloseStreamEvent.closeStream(
                                  //here i pass the streamID  
                                  context.read<StartStreamBloc>().state.startStreamResponse.data!.id
                                  ));
                          },
                          child: Container(
                            width: AppSizeW.s40,
                            height: AppSizeH.s40,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppSizeR.s100),
                              color: Colors.red,
                            ),
                            child: Icon(Icons.close),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<StartStreamBloc>()
                    .add(const StartStreamEvent.started());
              },
              child: const Text("Start Stream"),
            ),
          ],
        );
      },
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final OfferModel? offer;
  final List<ICEServerModel> iceServers;

  const VideoPlayerWidget(
      {required this.offer, required this.iceServers, Key? key})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  final _localRenderer = RTCVideoRenderer();
  final Map<String, RTCPeerConnection> _peerConnections =
      {}; // Store multiple connections

  @override
  void initState() {
    super.initState();
    _initWebRTC();
  }

  Future<void> _initWebRTC() async {
    await _localRenderer.initialize();

    if (widget.offer == null || widget.offer!.sdp.isEmpty) {
      debugPrint("Offer is null or empty, cannot set remote description.");
      return;
    }

    // Parse the SDP offer
    Map<String, dynamic> parsedSdp = parse(widget.offer!.sdp);
    log("zak: ${widget.offer!.sdp}");
    debugPrint("Parsed SDP: $parsedSdp");

    // Modify the SDP to use SAVPF instead of SAVP
    if (parsedSdp['media'] != null) {
      for (var media in parsedSdp['media']) {
        if (media['proto'] == 'SAVP') {
          media['proto'] = 'SAVPF'; // Change SAVP to SAVPF
        }
      }
    }

    // Rebuild the SDP with the modified protocol
    String modifiedSdp = write(parsedSdp, null);
    // debugPrint("Modified SDP: $modifiedSdp");

    String peerId =
        widget.offer!.sdp.hashCode.toString(); // Unique ID for each connection

    if (_peerConnections.containsKey(peerId)) {
      debugPrint("Peer connection for this offer already exists.");
      return;
    }

    // Convert ICEServerModel list into Map format required by createPeerConnection
    List<Map<String, dynamic>> iceServersList = widget.iceServers.map((server) {
      return {
        'urls': server.urls,
        if (server.username != null || server.username != "")
          'username': server.username,
        if (server.credential != null || server.credential != "")
          'credential': server.credential,
      };
    }).toList();

    // Create a new PeerConnection for this peer
    RTCPeerConnection peerConnection = await createPeerConnection(
      {'iceServers': iceServersList},
    );
    peerConnection.onTrack = (RTCTrackEvent event) {
      if (event.track.kind == 'video') {
        log("zak Received video track: ${event.track.kind}");
        if (event.streams.isNotEmpty) {
          _localRenderer.srcObject = event.streams[0];
          setState(() {}); // Trigger UI update
        }
      }
    };

    // debugPrint("Setting Remote Description: $modifiedSdp");
    await peerConnection.setRemoteDescription(
      RTCSessionDescription(modifiedSdp, widget.offer!.type),
    );

    RTCSessionDescription answer = await peerConnection.createAnswer({});
    await peerConnection.setLocalDescription(answer);

    // Attach the remote stream to the renderer
    //TO SHOW IN THE UI
    peerConnection.onTrack = (RTCTrackEvent event) {
      if (event.track.kind == 'video') {
        _localRenderer.srcObject = event.streams[0];
        setState(() {}); // Trigger UI update
      }
    };

    // Store the peer connection
    _peerConnections[peerId] = peerConnection;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RTCVideoView(_localRenderer);
  }

  @override
  void dispose() {
    for (var pc in _peerConnections.values) {
      pc.dispose();
    }
    _peerConnections.clear();
    _localRenderer.dispose();
    super.dispose();
  }
}
