import 'package:flutter/material.dart';
import 'package:inline_video_flutter/core/theme/abstract_theme.dart';

class DarkTheme implements ColorTheme {
  @override
  Color get primaryColor => Colors.black;

  @override
  Color get appBackgroundColor => Colors.black54;

  @override
  Color get statusBarColor => Colors.black;

  @override
  Color get scaffoldBackgroundColor => const Color.fromARGB(255, 48, 47, 47);
}
