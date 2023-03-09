// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    TabRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const TabPage(),
      );
    },
    ScreenShotRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const ScreenShotPage(),
      );
    },
    CompressMediaRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const CompressMediaPage(),
      );
    },
    WebViewRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewRouteArgs>(
          orElse: () => const WebViewRouteArgs());
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: WebViewPage(
          key: args.key,
          loadContent: args.loadContent,
        ),
      );
    },
    CoreRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const CorePage(),
      );
    },
    PluginRoute.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const PluginPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          TabRoute.name,
          path: '/',
          children: [
            RouteConfig(
              CoreRoute.name,
              path: '',
              parent: TabRoute.name,
            ),
            RouteConfig(
              PluginRoute.name,
              path: 'plugin-page',
              parent: TabRoute.name,
            ),
          ],
        ),
        RouteConfig(
          ScreenShotRoute.name,
          path: '/screen-shot-page',
        ),
        RouteConfig(
          CompressMediaRoute.name,
          path: '/compress-media-page',
        ),
        RouteConfig(
          WebViewRoute.name,
          path: '/web-view-page',
        ),
      ];
}

/// generated route for
/// [TabPage]
class TabRoute extends PageRouteInfo<void> {
  const TabRoute({List<PageRouteInfo>? children})
      : super(
          TabRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'TabRoute';
}

/// generated route for
/// [ScreenShotPage]
class ScreenShotRoute extends PageRouteInfo<void> {
  const ScreenShotRoute()
      : super(
          ScreenShotRoute.name,
          path: '/screen-shot-page',
        );

  static const String name = 'ScreenShotRoute';
}

/// generated route for
/// [CompressMediaPage]
class CompressMediaRoute extends PageRouteInfo<void> {
  const CompressMediaRoute()
      : super(
          CompressMediaRoute.name,
          path: '/compress-media-page',
        );

  static const String name = 'CompressMediaRoute';
}

/// generated route for
/// [WebViewPage]
class WebViewRoute extends PageRouteInfo<WebViewRouteArgs> {
  WebViewRoute({
    Key? key,
    void Function(WebViewController)? loadContent,
  }) : super(
          WebViewRoute.name,
          path: '/web-view-page',
          args: WebViewRouteArgs(
            key: key,
            loadContent: loadContent,
          ),
        );

  static const String name = 'WebViewRoute';
}

class WebViewRouteArgs {
  const WebViewRouteArgs({
    this.key,
    this.loadContent,
  });

  final Key? key;

  final void Function(WebViewController)? loadContent;

  @override
  String toString() {
    return 'WebViewRouteArgs{key: $key, loadContent: $loadContent}';
  }
}

/// generated route for
/// [CorePage]
class CoreRoute extends PageRouteInfo<void> {
  const CoreRoute()
      : super(
          CoreRoute.name,
          path: '',
        );

  static const String name = 'CoreRoute';
}

/// generated route for
/// [PluginPage]
class PluginRoute extends PageRouteInfo<void> {
  const PluginRoute()
      : super(
          PluginRoute.name,
          path: 'plugin-page',
        );

  static const String name = 'PluginRoute';
}
