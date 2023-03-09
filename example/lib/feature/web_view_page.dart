// Author: Dean.Liu
// DateTime: 2023/03/01 15:04

import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';

import '../common/view/ex_bar_pop_button.dart';
import '../common/view/ex_navigation_bar.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    super.key,
    this.loadContent,
  });

  /// 加载内容的回调
  final ValueChanged<WebViewController>? loadContent;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final _progressNotifier = ValueNotifier<int>(0);
  final _controller = WebViewController();

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return CupertinoPageScaffold(
      navigationBar: WebProgressBar(
        bar: ExNavigationBar(
          padding: EdgeInsetsDirectional.zero,
          middle: const Text('加载网页'),
          leading: ExBarPopButton(
            popType: PopButtonType.back,
            popAction: (type) async {
              if (await _controller.canGoBack()) {
                _controller.goBack();
              } else {
                navigator.maybePop();
              }
            },
          ),
        ),
        progressNotifier: _progressNotifier,
        progressValueColor: CupertinoColors.systemGreen,
        progressBackgroundColor: CupertinoColors.systemBlue,
      ),
      child: BaseWebView(
        controller: _controller,
        loadContent: widget.loadContent,
        navigationDelegate: NavigationDelegate(
          onProgress: (progress) {
            _progressNotifier.value = progress;
          },
          onPageFinished: (url) {
            _progressNotifier.value = 100;
          },
        ),
      ),
    );
  }
}
