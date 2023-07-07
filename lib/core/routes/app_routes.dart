import 'package:flutter/material.dart';
import 'package:inline_video_flutter/core/routes/route_constant.dart';
import 'package:inline_video_flutter/feature/list_screen.dart';
import 'package:inline_video_flutter/feature/splash_screen.dart';
import 'package:inline_video_flutter/feature/video_screen.dart';
import 'package:inline_video_flutter/feature/video_screen_2.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    RoutePath.splashScreen: (context) => const SplashScreen(),
    RoutePath.videoScreen: (context) => const VideoScreen(),
    RoutePath.listScreen: (context) => const ListScreen(),
    RoutePath.videoScreenTwo: (context) => const VideoScreenTwo()
  };
}
