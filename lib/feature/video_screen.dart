import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final bool _isFullScreen = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inline Video Player"),
      ),
      body: const Text(
        'Inline Video Body',
      ),
    );
  }
}


//


