import 'package:flutter/material.dart';
import 'package:inline_video_flutter/core/routes/route_constant.dart';
import 'package:inline_video_flutter/core/routes/app_routes.dart';
import 'package:inline_video_flutter/core/theme/my_theme.dart';

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
      theme: myAppTheme.myAppTheme(),
      initialRoute: RoutePath.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}
