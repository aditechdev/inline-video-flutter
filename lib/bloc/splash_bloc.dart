import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inline_video_flutter/core/routes/route_constant.dart';

class SplashBloc {
  final _splashDelay = 3;

  /// Navigate to Video Screen after 3 seconds
  splashDelayWidget(BuildContext context) async {
    var duration = Duration(seconds: _splashDelay);
    return Timer(duration, () {
      navigationPage(context);
    });
  }

  void navigationPage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(RoutePath.videoScreen);
  }
}

SplashBloc splashBloc = SplashBloc();
