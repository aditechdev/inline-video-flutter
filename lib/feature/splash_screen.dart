import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inline_video_flutter/bloc/system_bloc.dart';
import 'package:inline_video_flutter/r.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    systemBloc.disableStatusBar();
    systemBloc.closeKeyBoard();
    systemBloc.splashDelayWidget(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SplashLogoWidget(),
            SizedBox(height: 30),
            SplashAppNameText()
          ],
        ),
      ),
    );
  }
}

class SplashAppNameText extends StatelessWidget {
  const SplashAppNameText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("Inline Video Player");
  }
}

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
