import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inline_video_flutter/core/routes/route_constant.dart';

class SystemBloc {
  final _splashDelay = 3;

  enableStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  disableStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  closeKeyBoard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

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

SystemBloc systemBloc = SystemBloc();
