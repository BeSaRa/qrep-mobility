// video_state.dart
part of 'video_lib_cubit.dart';

abstract class VideoLibState {
  const VideoLibState();
}

class VideoInitial extends VideoLibState {
  const VideoInitial();
}

class VideoLoaded extends VideoLibState {
  final List<VideoItem> videos;
  final YoutubePlayerController? fullScreenController;
  final bool isFullScreen;

  const VideoLoaded({
    required this.videos,
    this.fullScreenController,
    this.isFullScreen = false,
  });

  VideoLoaded copyWith({
    List<VideoItem>? videos,
    YoutubePlayerController? fullScreenController,
    bool? isFullScreen,
  }) {
    return VideoLoaded(
      videos: videos ?? this.videos,
      fullScreenController: fullScreenController ?? this.fullScreenController,
      isFullScreen: isFullScreen ?? this.isFullScreen,
    );
  }
}

// video_model.dart
class VideoItem {
  final String url;
  final String title;
  final String date;

  VideoItem({required this.url, required this.title, required this.date});

  String get videoId {
    try {
      final uri = Uri.parse(url);

      // Handle youtu.be links
      if (uri.host.contains('youtu.be')) {
        return uri.pathSegments.first;
      }
      // Handle YouTube Shorts links
      else if (uri.pathSegments.contains('shorts')) {
        return uri.pathSegments[1];
      }
      // Handle regular YouTube watch links
      else if (uri.queryParameters.containsKey('v')) {
        return uri.queryParameters['v']!;
      }
      // Handle case where video ID is in the path (like some mobile links)
      else if (uri.pathSegments.isNotEmpty) {
        return uri.pathSegments[0];
      } else {
        throw Exception('Could not extract video ID from URL');
      }
    } catch (e) {
      throw Exception('Invalid YouTube URL: ${e.toString()}');
    }
  }

  String get thumbnailUrl => 'https://img.youtube.com/vi/$videoId/0.jpg';
}
