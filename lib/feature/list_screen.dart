import 'package:flutter/material.dart';
import 'package:inline_video_flutter/core/routes/route_constant.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutePath.videoScreen);
              },
              child: const Text("Process 1"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutePath.videoScreenTwo);
              },
              child: const Text("Process 2"),
            ),
          ],
        ),
      ),
    );
  }
}
