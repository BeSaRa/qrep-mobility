// ignore_for_file: public_member_api_docs, sort_constructors_first
// video_lib_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:ebla/presentations/features/video_library/blocs/video_lib_cubit.dart';
import 'package:ebla/presentations/resources/resources.dart';

class VideoLibView extends StatelessWidget {
  const VideoLibView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoLibCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              ImageAssets.appbarBg,
              fit: BoxFit.fill,
            ),
          ),
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.maybePop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: ColorManager.cloudyGrey,
                    ),
                    SizedBox(width: AppSizeW.s5),
                    Text(
                      AppStrings().main,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
              Text(
                AppStrings().video,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        body: BlocBuilder<VideoLibCubit, VideoLibState>(
          builder: (context, state) {
            if (state is VideoInitial) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is! VideoLoaded) {
              return const Center(child: Text('Unexpected state'));
            }

            final loadedState = state;

            return Stack(
              children: [
                _buildVideoList(loadedState.videos, context),
                if (loadedState.isFullScreen &&
                    loadedState.fullScreenController != null)
                  FullScreenYoutubePlayer(
                      controller: loadedState.fullScreenController!),
                // _buildFullScreenPlayer(
                //     loadedState.fullScreenController!, context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildVideoList(List<VideoItem> videos, BuildContext context) {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];

        return Padding(
          padding: EdgeInsets.only(
              bottom: index == videos.length - 1 ? AppSizeH.s20 : AppSizeH.s0),
          child: GestureDetector(
            onTap: () => context.read<VideoLibCubit>().openFullScreen(video),
            child: Card(
              margin: EdgeInsets.symmetric(
                  vertical: AppSizeH.s10, horizontal: AppSizeW.s20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(AppSizeR.s10)),
                          child: Image.network(
                            video.thumbnailUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Center(child: Icon(Icons.error)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(AppSizeW.s10),
                            decoration: BoxDecoration(
                                color: ColorManager.primary,
                                borderRadius:
                                    BorderRadius.circular(AppSizeR.s5)),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: ColorManager.white,
                              size: AppSizeW.s30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(AppSizeW.s8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(video.title,
                            style: Theme.of(context).textTheme.titleLarge),
                        SizedBox(height: AppSizeH.s4),
                        Text(video.date,
                            style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

//   Widget _buildFullScreenPlayer(
//     YoutubePlayerController controller,
//     BuildContext context,
//   ) {
//                   bool _isPlayerReady = false;

//   }
}

class FullScreenYoutubePlayer extends StatefulWidget {
  const FullScreenYoutubePlayer({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final YoutubePlayerController controller;
  @override
  State<FullScreenYoutubePlayer> createState() =>
      _FullScreenYoutubePlayerState();
}

class _FullScreenYoutubePlayerState extends State<FullScreenYoutubePlayer> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<VideoLibCubit>().closeFullScreen();
        return false;
      },
      child: Container(
        color: Colors.black.withValues(alpha: .8),
        child: Stack(
          children: [
            Center(
              child: YoutubePlayer(
                controller: widget.controller,
                aspectRatio: 16 / 9,
                width: MediaQuery.of(context).size.width * 0.9,
                showVideoProgressIndicator: true,
                progressIndicatorColor: ColorManager.primary,
                onEnded: (metaData) {
                  context.read<VideoLibCubit>().closeFullScreen();
                },
              ),
            ),
            Positioned(
              top: AppSizeH.s30,
              right: AppSizeW.s20,
              child: IconButton(
                icon: Icon(Icons.close,
                    color: ColorManager.white, size: AppSizeSp.s30),
                onPressed: () =>
                    context.read<VideoLibCubit>().closeFullScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
