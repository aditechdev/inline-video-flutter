import 'package:flutter/material.dart';
import 'package:inline_video_flutter/components/video_component/video_player.dart';
import 'package:inline_video_flutter/feature/video_screen.dart';
import 'package:inline_video_flutter/r.dart';
import 'package:inline_video_flutter/services/bloc/video_file_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoScreenTwo extends StatefulWidget {
  const VideoScreenTwo({super.key});

  @override
  State<VideoScreenTwo> createState() => _VideoScreenTwoState();
}

class _VideoScreenTwoState extends State<VideoScreenTwo> {
  late VideoPlayerController? _controller;

  bool _showGrid = false;
  bool _isFullScreen = false;
  bool _isVideoInitialized = false;
  bool _shownGridOnce = false;

  @override
  void initState() {
    // systemBloc.enableStatusBar();
    _controller = VideoPlayerController.asset(AssetVideo.video)
      ..addListener(() {
        setState(() {
          final currentPosition = _controller!.value.position;
          if (currentPosition >= const Duration(seconds: 1)) {
            performAction();
          }
        });
      })
      ..initialize().then((value) {
        setState(() {
          _isVideoInitialized = true;
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void performAction() {
    if (_shownGridOnce == false) {
      _controller!.pause();
      setState(() {
        _showGrid = true;
      });
    }
  }

  void _seekVideo(Duration time) {
    if (_isVideoInitialized) {
      // _controller!.pause();

      _controller = VideoPlayerController.asset(AssetVideo.video)
        ..addListener(() {
          setState(() {});
        })
        ..initialize().then((_) {
          _controller!.seekTo(time);

          _controller!.play();
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isFullScreen
          ? null
          : AppBar(
              title: const Text('Video Player Process 2'),
            ),
      body: Stack(
        children: [
          Positioned.fill(
            child: RotatedBox(
              quarterTurns: _isFullScreen ? 1 : 0,
              child: AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayerWidget(
                  controller: _controller!,
                  toggleFullScreen: (value) {
                    setState(() {
                      _isFullScreen = value;
                    });
                  },
                ),
              ),
            ),
          ),
          _showGrid
              ? EmotionsGridWidget(
                  onTap: (index) {
                    // see(index);
                    _seekVideo(Duration(
                        seconds: int.parse(vib.getEmotionsList.stream
                            .value[index]["duration"]!)));
                    setState(() {
                      _showGrid = false;
                      _shownGridOnce = true;
                    });
                  },
                  isFullScreen: _isFullScreen,
                )
              : Container(),
        ],
      ),
    );
  }
}
