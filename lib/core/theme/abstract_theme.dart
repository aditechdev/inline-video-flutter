import 'package:flutter/material.dart';

abstract class ColorTheme {
  Color get backgroundColor;
  Color get backgroundColorScaffold;
  Color get backgroundColorWhite;
  Color get headerStripColor;
  Color get primaryColor;
  Color get accentColor;
  Color get cardColor;

  Color get backgroundColorAppBar;

  // TextColor
  Color get headingTextColor;

  // Controller
  Color get tfLabelColor;
  Color get tfHintColor;
  Color get tfCursorColor;
  Color get tfErrorBorderColor;
  Color get tfBorderColor;
  Color get tfTextColor;

  // Button
  Color get darkButtenColor;
  Color get darkButtonTextColor;
}
