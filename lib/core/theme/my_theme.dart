import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inline_video_flutter/core/theme/theme_manager.dart';

class MyAppTheme {
  /// Current Theme of the App
  ThemeData myAppTheme() {
    return ThemeData(
      primaryColor: theme.currentTheme.primaryColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.deepPurple[400],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.deepPurple,
          statusBarBrightness: Brightness.light,
        ),
      ),
    );
  }
}

MyAppTheme myAppTheme = MyAppTheme();
