import 'package:flutter/material.dart';
import 'package:inline_video_flutter/core/theme/abstract_theme.dart';

class LightThemeColors implements ColorTheme {
  @override
  Color get accentColor => Colors.blue;

  @override
  Color get backgroundColor => const Color(0xffF4F9FD);

  @override
  Color get primaryColor => Colors.white;

  @override
  Color get headingTextColor => const Color(0xff0A1629);

  @override
  Color get backgroundColorWhite => const Color(0xffffffff);

  @override
  Color get headerStripColor => const Color(0xffD9EFFF);

  @override
  Color get darkButtenColor => const Color(0xff4F97D0);

  @override
  Color get backgroundColorAppBar => const Color(0xffF4F9FD);

  @override
  Color get backgroundColorScaffold => const Color(0xffF4F9FD);

  @override
  Color get cardColor => const Color(0xffFFFFFF);

  @override
  Color get tfBorderColor => const Color(0xffD8E0F0);

  @override
  Color get tfCursorColor => Colors.black;

  @override
  Color get tfErrorBorderColor => const Color(0xffD8E0F0);

  @override
  Color get tfHintColor => const Color(0xff7D8592);

  @override
  Color get tfLabelColor => const Color(0xff7D8592);

  @override
  Color get tfTextColor => const Color(0xff0A1629);

  @override
  Color get darkButtonTextColor => Colors.white;
}
