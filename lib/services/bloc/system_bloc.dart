import 'package:flutter/services.dart';

class SystemBloc {
  /// This will show the status bar of App
  enableStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  /// This will hide the status bar of App
  disableStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  /// Will close keyboard, if it was open by mistake
  closeKeyBoard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}

SystemBloc systemBloc = SystemBloc();
