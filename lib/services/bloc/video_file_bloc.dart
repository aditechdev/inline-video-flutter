import 'package:inline_video_flutter/services/repo/video_file_repo.dart';
import 'package:rxdart/subjects.dart';

class VideoFileBloc {
  final VideoFileRepo _videoFileRepo = VideoFileRepo();

  final BehaviorSubject<List<String>> _videoList = BehaviorSubject.seeded([]);
  final BehaviorSubject<List<Map<String, String>>> _emotionsList =
      BehaviorSubject.seeded([]);

  int index = 0;

  fetchVideosBloc() {
    var data = _videoFileRepo.fetchVideo();
    _videoList.add(data);
  }

  Uri getSingleVideo() {
    var data = _videoList.stream.value;
    String video = data[index];
    return Uri.parse(video);
  }

  fetchEmotionsList() {
    var data = _videoFileRepo.fetchEmotionsList();
    _emotionsList.add(data);
  }

  BehaviorSubject<List<String>> get getVideoList => _videoList;
  BehaviorSubject<List<Map<String, String>>> get getEmotionsList =>
      _emotionsList;
}

VideoFileBloc vib = VideoFileBloc();
