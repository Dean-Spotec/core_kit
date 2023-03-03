// Author: Dean.Liu
// DateTime: 2021/12/22 10:01

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'javascript_channel.dart';

export 'package:webview_flutter/webview_flutter.dart';

/// 网页
class BaseWebView extends StatefulWidget {
  const BaseWebView({
    super.key,
    required this.loadContent,
    this.controller,
    this.backgroundColor,
    this.navigationDelegate,
    this.channels = const [],
  });

  /// 加载内容的回调
  final ValueChanged<WebViewController>? loadContent;
  final WebViewController? controller;
  final Color? backgroundColor;

  /// 处理拦截、加载状态的代理
  final NavigationDelegate? navigationDelegate;

  /// 和js的交互
  final List<JavascriptChannel> channels;

  @override
  _BaseWebViewState createState() => _BaseWebViewState();
}

class _BaseWebViewState extends State<BaseWebView> {
  late final _controller = widget.controller ?? WebViewController();
  final _defaultNavigationDelegate = NavigationDelegate(
    onNavigationRequest: (request) {
      debugPrint('加载网页：${request.url}');
      return NavigationDecision.navigate;
    },
  );

  @override
  void initState() {
    super.initState();
    _initController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.loadContent?.call(_controller);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }

  void _initController() {
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.setNavigationDelegate(
      widget.navigationDelegate ?? _defaultNavigationDelegate,
    );
    if (widget.backgroundColor != null) {
      _controller.setBackgroundColor(widget.backgroundColor!);
    }
    for (final channel in widget.channels) {
      _controller.addJavaScriptChannel(
        channel.name,
        onMessageReceived: channel.onMessageReceived,
      );
    }
  }
}
