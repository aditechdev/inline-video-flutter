import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inline_video_flutter/core/theme/theme_manager.dart';

class MyAppTheme {
  var th = theme.currentTheme;

  /// Current Theme of the App
  ThemeData myAppTheme() {
    return ThemeData(
      primaryColor: th.primaryColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: th.appBackgroundColor,
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: th.statusBarColor,
          statusBarBrightness: Brightness.light,
        ),
      ),
    );
  }
}

MyAppTheme myAppTheme = MyAppTheme();
