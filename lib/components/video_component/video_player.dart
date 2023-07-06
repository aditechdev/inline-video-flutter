import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inline_video_flutter/components/video_component/video_button.dart';
import 'package:inline_video_flutter/services/bloc/system_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController controller;
  // final bool isFullScreen;
  final Function(bool) toggleFullScreen;

  const VideoPlayerWidget({
    Key? key,
    required this.controller,
    // this.isFullScreen = false,
    required this.toggleFullScreen,
  }) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  bool _isFullScreen = false;

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    systemBloc.enableAndDisableStatusBar(_isFullScreen);
    widget.toggleFullScreen(_isFullScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: buildVideo(),
    );
  }

  buildVideo() => Stack(
        children: [
          buildVideoPlayer(),
          Positioned.fill(
            child: BasicOverlayWidget(
              controller: widget.controller,
              isFullScreen: _isFullScreen,
              toggleFullScreen: _toggleFullScreen,
            ),
          ),
        ],
      );

  buildVideoPlayer() => AspectRatio(
        aspectRatio: widget.controller.value.isInitialized
            ? widget.controller.value.aspectRatio
            : 16 / 9,
        child: VideoPlayer(
          widget.controller,
        ),
      );
}

class BasicOverlayWidget extends StatefulWidget {
  const BasicOverlayWidget({
    Key? key,
    required this.controller,
    required this.toggleFullScreen,
    required this.isFullScreen,
  }) : super(key: key);
  final VideoPlayerController controller;
  final VoidCallback toggleFullScreen;
  final bool isFullScreen;

  @override
  State<BasicOverlayWidget> createState() => _BasicOverlayWidgetState();
}

class _BasicOverlayWidgetState extends State<BasicOverlayWidget> {
  bool _showControls = true;

  void _toggleControlsVisibility() {
    setState(() {
      _showControls = !_showControls;
    });

    if (_showControls) {
      Timer(const Duration(seconds: 2), () {
        removeControls();
      });
    }
  }

  removeControls() {
    setState(() {
      _showControls = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool showLoader = !widget.controller.value.isInitialized ||
        widget.controller.value.isBuffering;

    bool showAllControls =
        !showLoader && (_showControls || !widget.controller.value.isPlaying);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _toggleControlsVisibility();
      },
      child: Stack(
        children: [
          showLoader ? buildLoader() : Container(),
          showAllControls ? buildPlayButton() : Container(),
          showAllControls
              ? getFullScreenControl(
                  controller: widget.controller,
                  isFullScreen: widget.isFullScreen,
                  toggleFullScreen: widget.toggleFullScreen)
              : Container(),
          getVideoProgressIndicator()
        ],
      ),
    );
  }

  Widget buildLoader() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }

  Widget buildPlayButton() {
    return GestureDetector(
      onTap: () {
        if (widget.controller.value.isPlaying) {
          widget.controller.pause();
        } else {
          widget.controller.play();
          removeControls();
        }
      },
      child: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black38,
          ),
          height: 70,
          width: 100,
          child: Icon(
            widget.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }

  Widget getFullScreenControl(
      {void Function()? toggleFullScreen,
      bool? isFullScreen,
      VideoPlayerController? controller}) {
    return Positioned(
      top: 16,
      right: 16,
      child: VideoButtonsWidget(
        onClick: toggleFullScreen,
        icons: isFullScreen!
            ? const Icon(Icons.fullscreen_exit)
            : const Icon(Icons.fullscreen),
      ),
    );
  }

  Widget getVideoProgressIndicator() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 8,
        child: VideoProgressIndicator(
          widget.controller,
          allowScrubbing: true,
        ),
      ),
    );
  }
}

showOptionalWidget({
  bool condition = false,
  Widget? widgetOnTrue,
  Widget widgetOnFalse = const SizedBox(
    height: 0,
    width: 0,
  ),
}) {
  if (condition) {
    return widgetOnTrue;
  }

  return widgetOnFalse;
}
