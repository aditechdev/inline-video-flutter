import 'package:flutter/material.dart';
import 'package:inline_video_flutter/constant/route_constant.dart';
import 'package:inline_video_flutter/feature/splash_screen.dart';
import 'package:inline_video_flutter/video_screen.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    RoutePath.splashScreen: (context) => const SplashScreen(),
    RoutePath.videoScreen: (context) => const VideoScreen(),

  };
}
