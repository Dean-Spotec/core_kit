// Author: Dean.Liu
// DateTime: 2023/03/01 14:01

import 'package:webview_flutter/webview_flutter.dart';

typedef JavascriptMessageHandler = void Function(JavaScriptMessage message);

class JavascriptChannel {
  JavascriptChannel({
    required this.name,
    required this.onMessageReceived,
  });

  final String name;
  final JavascriptMessageHandler onMessageReceived;
}
