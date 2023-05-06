// Author: Dean.Liu
// DateTime: 2023/03/09 10:51

import 'package:auto_route/auto_route.dart';
import 'package:core_kit/package.dart';
import 'package:flutter/cupertino.dart';

import '../common/page/web_view_page.dart';
import '../feature/core/core_page.dart';
import '../feature/plugin/localization/localization_page.dart';
import '../feature/plugin/media/compress_media_page.dart';
import '../feature/plugin/media/screen_shot_page.dart';
import '../feature/plugin/plugin_page.dart';
import '../feature/plugin/refresh/refresh_page.dart';
import '../feature/tab_page.dart';

part 'app_router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    CupertinoRoute(
      path: '/',
      page: TabPage,
      children: [
        CupertinoRoute(page: CorePage, initial: true),
        CupertinoRoute(page: PluginPage),
      ],
    ),
    CupertinoRoute(page: ScreenShotPage),
    CupertinoRoute(page: CompressMediaPage),
    CupertinoRoute(page: WebViewPage),
    CupertinoRoute(page: LocalizationPage),
    CupertinoRoute(page: RefreshPage),
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter(super.navigatorKey);
}
