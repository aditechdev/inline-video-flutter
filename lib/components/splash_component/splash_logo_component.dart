import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inline_video_flutter/r.dart';

/// This widget will display the logo of App, primarly used in Splash Screen
class SplashLogoWidget extends StatelessWidget {
  const SplashLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsSvg.splashLogo,
      height: 150,
      width: 150,
    );
  }
}
