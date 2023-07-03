import 'package:inline_video_flutter/services/repo/video_file_repo.dart';
import 'package:rxdart/subjects.dart';

class VideoFileBloc {
  final VideoFileRepo _videoFileRepo = VideoFileRepo();

  final BehaviorSubject<List<String>> _videoList = BehaviorSubject.seeded([]);

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

  BehaviorSubject<List<String>> get getVideoList => _videoList;
}

VideoFileBloc vib = VideoFileBloc();
