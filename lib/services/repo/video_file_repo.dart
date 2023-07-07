import 'package:inline_video_flutter/services/data/video_data.dart';

class VideoFileRepo {
  final VideoData _videoData = VideoData();
  List<String> fetchVideo() {
    return _videoData.videoList;
  }

  List<Map<String, String>> fetchEmotionsList() {
    return _videoData.emotionsList;
  }
}
