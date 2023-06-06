// Author: Dean.Liu
// DateTime: 2023/03/09 10:51

import 'package:auto_route/auto_route.dart';
import 'package:core_kit/package.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/page/web_view_page.dart';
import '../feature/core/async/isolate_page.dart';
import '../feature/core/core_page.dart';
import '../feature/drawer/user_drawer_page.dart';
import '../feature/mine/mine_page.dart';
import '../feature/plugin/localization/localization_page.dart';
import '../feature/plugin/media/compress_media_page.dart';
import '../feature/plugin/media/screen_shot_page.dart';
import '../feature/plugin/plugin_page.dart';
import '../feature/plugin/refresh/refresh_page.dart';
import '../feature/plugin/route/login_page.dart';
import '../feature/plugin/route/register_page.dart';
import '../feature/plugin/route/user_auth_page.dart';
import '../feature/plugin/route/user_info_page.dart';
import '../feature/tab_page.dart';
import 'user_auth_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  AppRouter({super.navigatorKey, required this.ref});

  final WidgetRef ref;

  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  late final List<AutoRoute> routes = [
    CustomRoute(
      path: '/',
      page: TabRoute.page,
      durationInMilliseconds: 0,
      children: [
        AutoRoute(page: CoreRoute.page),
        AutoRoute(page: PluginRoute.page),
        AutoRoute(page: MineRoute.page),
      ],
    ),
    AutoRoute(page: IsolateRoute.page),
    AutoRoute(page: ScreenShotRoute.page),
    AutoRoute(page: CompressMediaRoute.page),
    AutoRoute(page: WebViewRoute.page),
    AutoRoute(page: LocalizationRoute.page),
    AutoRoute(page: RefreshRoute.page),
    AutoRoute(
      page: UserAuthRoute.page,
      fullscreenDialog: true,
      children: [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: RegisterRoute.page),
      ],
    ),
    AutoRoute(
      page: UserInfoRoute.page,
      guards: [AuthGuard(ref: ref)],
    ),
    AutoRoute(page: DrawerRoute.page),
  ];
}
