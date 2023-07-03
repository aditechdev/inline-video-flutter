import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    // Set the status bar color
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   statusBarColor: Colors.deepPurple,
        //   statusBarBrightness: Brightness.light,
        // ),
        title: const Text("Inline Video Player"),
      ),
      body: const Text(
        'Inline Video Body',
      ),
    );
  }
}
