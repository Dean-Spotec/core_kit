// Author: Dean.Liu
// DateTime: 2023/03/09 10:51

import 'package:auto_route/auto_route.dart';
import 'package:core_kit/package.dart';
import 'package:flutter/cupertino.dart';

import '../common/page/web_view_page.dart';
import '../feature/core/async/isolate_page.dart';
import '../feature/core/core_page.dart';
import '../feature/plugin/localization/localization_page.dart';
import '../feature/plugin/media/compress_media_page.dart';
import '../feature/plugin/media/screen_shot_page.dart';
import '../feature/plugin/plugin_page.dart';
import '../feature/plugin/refresh/refresh_page.dart';
import '../feature/tab_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey});

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: TabRoute.page,
      children: [
        AutoRoute(page: CoreRoute.page, initial: true),
        AutoRoute(page: PluginRoute.page),
      ],
    ),
    AutoRoute(page: IsolateRoute.page),
    AutoRoute(page: ScreenShotRoute.page),
    AutoRoute(page: CompressMediaRoute.page),
    AutoRoute(page: WebViewRoute.page),
    AutoRoute(page: LocalizationRoute.page),
    AutoRoute(page: RefreshRoute.page),
  ];
}
