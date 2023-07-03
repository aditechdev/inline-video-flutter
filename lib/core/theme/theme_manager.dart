import 'package:inline_video_flutter/core/theme/abstract_theme.dart';
import 'package:inline_video_flutter/core/theme/theme_collection/dark_theme.dart';
import 'package:inline_video_flutter/core/theme/theme_collection/light_theme.dart';

enum ThemeType { light, dark }

class ThemeProvider {
  ThemeType _currentTheme = ThemeType.dark;

  void setTheme(ThemeType themeType) {
    _currentTheme = themeType;
  }

  ColorTheme get currentTheme {
    switch (_currentTheme) {
      case ThemeType.light:
        return LightThemeColors();
      case ThemeType.dark:
        return DarkTheme();
      default:
        return LightThemeColors();
    }
  }
}

ThemeProvider theme = ThemeProvider();


/*
! NoTe: Call this to change the theme
theme.setTheme(ThemeType.light);
setState(() {});
*/