import 'package:flutter/material.dart';

class VideoButtonsWidget extends StatelessWidget {
  const VideoButtonsWidget({super.key, this.onClick, this.icons});
  final VoidCallback? onClick;
  final Widget? icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        color: Colors.black26,
      ),
      child: IconButton(
        icon: icons!,
        onPressed: onClick,
        color: Colors.white,
      ),
    );
  }
}
