import 'package:inline_video_flutter/services/data/video_data.dart';

class VideoFileRepo {
  VideoData _videoData = VideoData();
  List<String> fetchVideo() {
    return _videoData.videoList;
  }
}
