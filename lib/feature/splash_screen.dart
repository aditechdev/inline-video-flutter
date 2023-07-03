import 'package:flutter/material.dart';
import 'package:inline_video_flutter/services/bloc/splash_bloc.dart';
import 'package:inline_video_flutter/services/bloc/system_bloc.dart';
import '../components/splash_component/splash_lib.dart' as wd;

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
    splashBloc.splashDelayWidget(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            wd.SplashLogoWidget(),
            SizedBox(height: 30),
            wd.SplashAppNameText()
          ],
        ),
      ),
    );
  }
}
