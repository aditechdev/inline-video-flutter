import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inline_video_flutter/core/routes/route_constant.dart';
import 'package:inline_video_flutter/services/bloc/video_file_bloc.dart';

class SplashBloc {
  final _splashDelay = 3;

  /// Navigate to Video Screen after 3 seconds
  splashDelayWidget(BuildContext context) async {
    appInitialCheck();
    var duration = Duration(seconds: _splashDelay);
    return Timer(duration, () {
      navigationPage(context);
    });
  }

  void navigationPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RoutePath.videoScreen);
  }

  appInitialCheck() {
    vib.fetchVideosBloc();
    vib.fetchEmotionsList();
  }
}

SplashBloc splashBloc = SplashBloc();
