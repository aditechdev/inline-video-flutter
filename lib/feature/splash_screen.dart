import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inline_video_flutter/bloc/system_bloc.dart';
import 'package:inline_video_flutter/core/routes/route_constant.dart';

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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svg/musician-svg.svg",
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text("Inline Video Player")
          ],
        ),
      ),
    );
  }
}
