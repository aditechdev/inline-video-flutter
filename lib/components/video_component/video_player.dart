import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inline_video_flutter/components/video_component/video_button.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;
  final bool isFullScreen;
  final VoidCallback toggleFullScreen;

  const VideoPlayerWidget(
      {Key? key,
      required this.controller,
      this.isFullScreen = false,
      required this.toggleFullScreen})
      : super(key: key);
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
              controller: controller,
              isFullScreen: isFullScreen,
              toggleFullScreen: toggleFullScreen,
            ),
          ),
        ],
      );
  buildVideoPlayer() => AspectRatio(
        aspectRatio: controller.value.isInitialized
            ? controller.value.aspectRatio
            : 16 / 9,
        child: VideoPlayer(
          controller,
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
      Timer(const Duration(seconds: 1), () {
        setState(() {
          _showControls = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (widget.controller.value.isPlaying) {
            widget.controller.pause();
          } else {
            widget.controller.play();
          }
          _toggleControlsVisibility();
        },
        child: Stack(
          children: [
            if (widget.controller.value.isPlaying && _showControls)
              Center(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black38,
                  ),
                  height: 70,
                  width: 100,
                  child: Icon(
                    widget.controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              )
            else if (_showControls)
              Center(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black38,
                  ),
                  height: 70,
                  width: 100,
                  child: Icon(
                    widget.controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            getFullScreenControl(
                controller: widget.controller,
                isFullScreen: widget.isFullScreen,
                toggleFullScreen: widget.toggleFullScreen),
            Positioned(
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
            ),
          ],
        ),
      );

  Widget buildPlayButton() => (widget.controller.value.isPlaying)
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black38,
          child: const Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 80,
          ),
        );

  Widget buildVideoProgressIndecator() =>
      VideoProgressIndicator(widget.controller, allowScrubbing: true);

  Widget getFullScreenControl(
      {void Function()? toggleFullScreen,
      bool? isFullScreen,
      VideoPlayerController? controller}) {
    if (controller!.value.isPlaying) {
      return const SizedBox();
    }

    if (isFullScreen!) {
      return Positioned(
        bottom: 16,
        right: 16,
        child: VideoButtonsWidget(
          onClick: toggleFullScreen,
          icons: const Icon(Icons.fullscreen_exit),
        ),
      );
    } else {
      return Positioned(
        top: 16,
        right: 16,
        child: VideoButtonsWidget(
          onClick: toggleFullScreen,
          icons: const Icon(Icons.fullscreen),
        ),
      );
    }
  }
}
