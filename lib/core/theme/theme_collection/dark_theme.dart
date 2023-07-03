import 'package:flutter/material.dart';
import 'package:inline_video_flutter/core/theme/abstract_theme.dart';

class DarkTheme implements ColorTheme {
 

  @override
  Color get primaryColor => Colors.black;
  
  @override
  Color get appBackgroundColor =>  Colors.black45;
  
  @override
  Color get statusBarColor => throw UnimplementedError();

  
}
