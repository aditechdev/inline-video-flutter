import 'package:color_log/color_log.dart';
import 'package:flutter/material.dart';
import 'package:inline_video_flutter/main.dart';

Future appInit() async {
  // All the services that need to start before run App

  clog.info("App Started Successfully");
  runApp(const MyApp());
}
