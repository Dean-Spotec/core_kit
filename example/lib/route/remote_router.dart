// Author: Dean.Liu
// DateTime: 2023/01/11 11:51

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_router.dart';

/// 处理远程推送的path路由
class RemoteRouter {
  factory RemoteRouter() => _instance;

  RemoteRouter._internal();

  static final RemoteRouter _instance = RemoteRouter._internal();

  /// push指定页面，[urlPath]需要遵循'xx://xx'的格式
  void push(String urlPath) {
    debugPrint('处理远程路由: $urlPath');
    final parts = urlPath.split('://');
    final scheme = parts.first.toLowerCase();
    if (scheme == 'ex') {
      final appRouter = GetIt.I.get<AppRouter>();
      appRouter.pushNamed(parts.last);
    } else if (scheme == 'https' || scheme == 'http') {
      final appRouter = GetIt.I.get<AppRouter>();
      final page = WebViewRoute(
        loadContent: (controller) {
          controller.loadRequest(Uri.parse(urlPath));
        },
      );
      appRouter.push(page);
    } else {
      // 启动其他app
      final uri = Uri.tryParse(urlPath);
      if (uri == null) return;
      canLaunchUrl(uri).then((canLaunch) {
        if (canLaunch) {
          launchUrl(uri);
        }
      });
    }
  }
}
