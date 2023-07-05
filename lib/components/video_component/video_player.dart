import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;
  final bool showSmallPlayButton;
  final bool isFullScreen;

  const VideoPlayerWidget({
    Key? key,
    required this.controller,
    this.showSmallPlayButton = true,
    this.isFullScreen = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      // (!controller.value)?
      (controller.value.isInitialized)
          ? Container(
              alignment: Alignment.topCenter,
              child: buildVideo(),
            )
          : Container(
              alignment: Alignment.topCenter,
              // height: 200,
              child: Center(child: CircularProgressIndicator()),
            );
  buildVideo() => Stack(
        children: [
          buildVideoPlayer(),
          Positioned.fill(
            child: BasicOverlayWidget(
              controller: controller,
              showSmallPlayButton: showSmallPlayButton,
            ),
          ),
        ],
      );
  buildVideoPlayer() => AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(
          controller,
        ),
      );
}

class BasicOverlayWidget extends StatefulWidget {
  const BasicOverlayWidget(
      {Key? key, required this.controller, this.showSmallPlayButton = false})
      : super(key: key);
  final VideoPlayerController controller;
  final bool showSmallPlayButton;

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
      // Start a timer to hide the controls after 1 second
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

        // (widget.controller.value.isPlaying)
        //     ? widget.controller.pause()
        //     : widget.controller.play(),
        child: Stack(
          children: [
            if (_showControls)
              Container(
                alignment: Alignment.center,
                color: Colors.black38,
                child: Icon(
                  widget.controller.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: Colors.white,
                  size: widget.showSmallPlayButton ? 20 : 80,
                ),
              ),
            if (_showControls)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 8,
                  child: VideoProgressIndicator(
                    widget.controller,
                    allowScrubbing: true,
                  ),
                ),
              ),
            // widget.showSmallPlayButton
            //     ? buildSmallPlayButton()
            //     : buildPlayButton(),
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: SizedBox(
            //     height: 12,
            //     child: buildVideoProgressIndecator(),
            //   ),
            // )
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

  Widget buildSmallPlayButton() => (widget.controller.value.isPlaying)
      ? Container()
      : Center(
          child: Container(
            height: 60,
            width: 60,
            // alignment: Alignment.center,
            decoration: BoxDecoration(
              // color: Colors.black54,
              color: Colors.black.withOpacity(0.4),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 40,
            ),
          ),
        );

  Widget buildVideoProgressIndecator() =>
      VideoProgressIndicator(widget.controller, allowScrubbing: true);
}
