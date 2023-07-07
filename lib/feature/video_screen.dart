import 'package:flutter/material.dart';

import 'package:inline_video_flutter/components/video_component/video_player.dart';
import 'package:inline_video_flutter/services/bloc/system_bloc.dart';
import 'package:inline_video_flutter/services/bloc/video_file_bloc.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;

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
        // Perform action at specific time (e.g., 1 seconds)
        if (currentPosition >= const Duration(seconds: 1)) {
          performAction();
        }
      })
      ..initialize();
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
  }

  void _playNextVideo(int index) {
    if (vib.index < videoList.length - 1) {
      _controller!.pause();

      vib.index = index;

      _controller = VideoPlayerController.networkUrl(vib.getSingleVideo())
        ..addListener(() {
          setState(() {});
        })
        ..initialize().then((_) {
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
                    _playNextVideo(index);
                    setState(() {
                      _showGrid = false;
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

class EmotionsGridWidget extends StatelessWidget {
  const EmotionsGridWidget({
    this.onTap,
    this.isFullScreen,
    super.key,
  });
  final Function(int)? onTap;
  final bool? isFullScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: isFullScreen! ? MediaQuery.of(context).size.width * 0.6 : 10,
      left: 20,
      right: 20,
      // bottom: 20,
      child: Container(
        color: Colors.blue.withOpacity(0.6),
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: isFullScreen! ? 100 : 10,
          bottom: isFullScreen! ? 100 : 10,
        ),
        child: Transform.rotate(
          angle: isFullScreen! ? math.pi / 2 : 0,
          child: Column(
            children: [
              const Text(
                "How do you feel now?",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: isFullScreen! ? 30 : 10,
              ),
              StreamBuilder<List<Map<String, String>>>(
                  stream: vib.getEmotionsList,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    }
                    return GridView.count(
                      crossAxisCount: 3,
                      padding: EdgeInsets.zero,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      shrinkWrap: true,
                      childAspectRatio: 17 / 7,
                      // childAspectRatio:,
                      children: List.generate(snapshot.data!.length, (index) {
                        var emoji = snapshot.data![index];
                        return ElevatedButton(
                          onPressed: () {
                            onTap!(index);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${emoji["name"]}'),
                              const SizedBox(
                                height: 2,
                              ),
                              Text('${emoji["emoji"]}'),
                            ],
                          ),
                        );
                      }),
                    );
                  }),
              SizedBox(
                height: isFullScreen! ? 30 : 10,
              ),
              const Text(
                "Click one option",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
