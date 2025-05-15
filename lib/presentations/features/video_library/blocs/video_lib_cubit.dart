// video_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'video_lib_state.dart';

class VideoLibCubit extends Cubit<VideoLibState> {
  VideoLibCubit() : super(const VideoInitial()) {
    // Initialize with some dummy data
    final videos = [
      VideoItem(
        url: "https://www.youtube.com/watch?v=zovcGxXcwQ0",
        title: "تنمية عمرانية شاملة",
        date: "7/21/2024",
      ),
      VideoItem(
        url: "https://youtu.be/L4RTEIYgeNg",
        title: "استراتيجية الهيئة العامة لتنظيم القطاع العقاري",
        date: "12/15/2024",
      ),
      VideoItem(
        url: "https://www.youtube.com/watch?v=dxSei9hus1E",
        title: "المؤتمر الصحفي للإعلان عن انعقاد منتدى قطر العقاري الثاني",
        date: "9/29/2024",
      ),
      VideoItem(
        url: "https://youtu.be/ecRhIxQQDGg",
        title:
            "مراسم توقيع اتفاقية الشراكة بين الهيئة العامة لتنظيم القطاع العقاري – عقارات وستي سكيب لإطلاق منتدى قطر العقاري الثاني 2024",
        date: "9/3/2024",
      ),
      VideoItem(
        url: "https://youtube.com/shorts/vYDwcGbW3ps?feature=share",
        title:
            "لقطات استثنائية من حفل إطلاق استراتيجية الهيئة العامة لتنظيم القطاع",
        date: "12/16/2024",
      ),
      VideoItem(
        url: "https://youtube.com/shorts/gl1f7Dfgo3U?feature=share",
        title: "ملتقى المطورين العقاريين",
        date: "7/22/2024",
      ),
      VideoItem(
        url: "https://www.youtube.com/watch?v=uoe5nH6VmOw",
        title: "منتدى قطر العقاري الثاني ( إعلان)",
        date: "10/13/2024",
      ),
      VideoItem(
        url: "https://youtu.be/ibVve-iu1Uk",
        title: "تفعيل قانون التطوير العقاري",
        date: "4/29/2025",
      ),
      VideoItem(
        url: "https://youtu.be/3pRRYjs8QRo?si=ZdFGCvh0_0f1qyXJ",
        title: "منتدى قطر العقاري الثاني (لقطات)",
        date: "10/17/2024",
      ),
    ];

    emit(VideoLoaded(videos: videos));
  }

  void openFullScreen(VideoItem video) {
    if (state is! VideoLoaded) return;

    final currentState = state as VideoLoaded;
    currentState.fullScreenController?.dispose();
    final controller = YoutubePlayerController(
      initialVideoId: video.videoId,
      flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          forceHD: true, // Better audio quality
          enableCaption: false),
    );

    emit(currentState.copyWith(
      fullScreenController: controller,
      isFullScreen: true,
    ));
  }

  void closeFullScreen() {
    if (state is! VideoLoaded) return;

    final currentState = state as VideoLoaded;
    // currentState.fullScreenController?.dispose();

    emit(currentState.copyWith(
      fullScreenController: null,
      isFullScreen: false,
    ));
  }

  @override
  Future<void> close() {
    if (state is VideoLoaded) {
      (state as VideoLoaded).fullScreenController?.dispose();
    }
    return super.close();
  }
}
