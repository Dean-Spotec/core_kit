// Author: Dean.Liu
// DateTime: 2023/01/10 16:30

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

class RouterObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint('推出:${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    debugPrint('关闭:${route.settings.name}');
  }

  // @override
  // void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
  //   debugPrint('Tab route visited: ${route.name}');
  // }
  //
  // @override
  // void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
  //   debugPrint('Tab route re-visited: ${route.name}');
  // }
}
