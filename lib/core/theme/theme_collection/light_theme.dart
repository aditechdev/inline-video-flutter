import 'package:flutter/material.dart';
import 'package:inline_video_flutter/core/theme/abstract_theme.dart';

class LightThemeColors implements ColorTheme {
  
  @override
  Color get primaryColor => Colors.white;
  
  @override
  Color get appBackgroundColor =>Colors.deepPurple.shade400;
  
  @override
  Color get statusBarColor => Colors.deepPurple;

}
