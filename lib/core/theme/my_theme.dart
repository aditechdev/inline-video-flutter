import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inline_video_flutter/core/theme/theme_manager.dart';

class MyAppTheme {
  var th = theme.currentTheme;

  /// Current Theme of the App
  ThemeData myAppTheme() {
    return ThemeData(
      primaryColor: th.primaryColor,
      scaffoldBackgroundColor: th.scaffoldBackgroundColor,
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android:
              CustomPageTransitionsBuilder(), // Customize transitions for Android
          TargetPlatform.iOS:
              CustomPageTransitionsBuilder(), // Customize transitions for iOS
        },
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: th.appBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: th.statusBarColor,
          statusBarBrightness: Brightness.light,
        ),
      ),
    );
  }
}

MyAppTheme myAppTheme = MyAppTheme();

class CustomPageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(animation),
      child: child,
    );
  }
}
