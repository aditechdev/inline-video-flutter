import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inline_video_flutter/constant/route_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   final splashDelay = 3;

    @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _closeKeyboard();
    _loadWidget();
    super.initState();
  }
  

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(RoutePath.videoScreen);
  }

  void _closeKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  _loadWidget() async {
    var duration = Duration(seconds: splashDelay);
    return Timer(duration, navigationPage);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(child: Text("Splash Screen")),
    );
  }
}
