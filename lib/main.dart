import 'package:flutter/material.dart';
import 'package:inline_video_flutter/constant/route_constant.dart';
import 'package:inline_video_flutter/core/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inline Video App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(),
      initialRoute: RoutePath.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}
