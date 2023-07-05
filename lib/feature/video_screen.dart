import 'package:flutter/material.dart';
import 'package:inline_video_flutter/components/video_component/video_button.dart';
import 'package:inline_video_flutter/components/video_component/video_player.dart';
import 'package:inline_video_flutter/services/bloc/system_bloc.dart';
import 'package:inline_video_flutter/services/bloc/video_file_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController? _controller;

  var videoList = vib.getVideoList.stream.value;

  bool _showGrid = false;
  bool _isFullScreen = false;

  @override
  void initState() {
    systemBloc.enableStatusBar();
    _controller = VideoPlayerController.networkUrl(vib.getSingleVideo())
      ..addListener(() {
        setState(() {});
        final currentPosition = _controller!.value.position;
        // Perform action at specific time (e.g., 5 seconds)
        if (currentPosition >= const Duration(seconds: 1)) {
          performAction();
        }
      })
      ..initialize();

    // })
    // ..setLooping(true)

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void performAction() {
    _controller!.pause();
    setState(() {
      _showGrid = true;
    });
    // log('Performing action at 5 seconds');
  }

  void _playNextVideo(int index) {
    if (vib.index < videoList.length - 1) {
      _controller!.pause();

      // setState(() {
      vib.index = index;
      // _selectedOptionIndex = index;
      // });

      // log("_selectedOptionIndex $_selectedOptionIndex");

      // initState();
      _controller = VideoPlayerController.networkUrl(vib.getSingleVideo())
        ..addListener(() {
          setState(() {});
        })
        ..initialize().then((_) {
          _controller!.play();
        });
    }
  }
  // @override
  // void initState() {
  //   // Set the status bar color

  //   super.initState();
  // }
  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    if (_isFullScreen) {
      systemBloc.disableStatusBar();
    } else {
      systemBloc.enableStatusBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isFullScreen
          ? null
          : AppBar(
              title: const Text('Video Player App'),
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
                  isFullScreen: _isFullScreen,
                )),
          )),
          _showGrid
              ? Positioned(
                  top: 10,
                  left: 20,
                  right: 20,
                  bottom: 20,
                  child: Container(
                    // height: 150,
                    child: GridView.count(
                      crossAxisCount: 4,
                      padding: EdgeInsets.zero,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      shrinkWrap: true,
                      children: List.generate(8, (index) {
                        return GestureDetector(
                          onTap: () {
                            _playNextVideo(index);
                            setState(() {
                              _showGrid = false;
                            });
                          },
                          child: Container(
                            color: Colors.grey,
                            child: Center(
                              child: Text(
                                'Square ${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                )
              : Container(),
          if (_controller!.value.isPlaying)
            Container()
          else if (_isFullScreen)
            Positioned(
              bottom: 16,
              right: 16,
              child: VideoButtonsWidget(
                onClick: _toggleFullScreen,
                icons: const Icon(Icons.fullscreen_exit),
              ),
            )
          else
            Positioned(
              top: 16,
              right: 16,
              child: VideoButtonsWidget(
                onClick: _toggleFullScreen,
                icons: const Icon(Icons.fullscreen),
              ),
            ),
        ],
      ),
    );
  }
}

