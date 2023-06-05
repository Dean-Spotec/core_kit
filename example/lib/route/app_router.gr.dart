// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    WebViewRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewRouteArgs>(
          orElse: () => const WebViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WebViewPage(
          key: args.key,
          loadContent: args.loadContent,
        ),
      );
    },
    CoreRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CorePage(),
      );
    },
    IsolateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const IsolatePage(),
      );
    },
    UserAuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserAuthPage(),
      );
    },
    RefreshRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RefreshPage(),
      );
    },
    PluginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PluginPage(),
      );
    },
    LocalizationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LocalizationPage(),
      );
    },
    CompressMediaRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompressMediaPage(),
      );
    },
    ScreenShotRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ScreenShotPage(),
      );
    },
    TabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TabPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginPage(
          key: args.key,
          onLoginSuccess: args.onLoginSuccess,
        ),
      );
    },
  };
}

/// generated route for
/// [WebViewPage]
class WebViewRoute extends PageRouteInfo<WebViewRouteArgs> {
  WebViewRoute({
    Key? key,
    void Function(WebViewController)? loadContent,
    List<PageRouteInfo>? children,
  }) : super(
          WebViewRoute.name,
          args: WebViewRouteArgs(
            key: key,
            loadContent: loadContent,
          ),
          initialChildren: children,
        );

  static const String name = 'WebViewRoute';

  static const PageInfo<WebViewRouteArgs> page =
      PageInfo<WebViewRouteArgs>(name);
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
  const CoreRoute({List<PageRouteInfo>? children})
      : super(
          CoreRoute.name,
          initialChildren: children,
        );

  static const String name = 'CoreRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IsolatePage]
class IsolateRoute extends PageRouteInfo<void> {
  const IsolateRoute({List<PageRouteInfo>? children})
      : super(
          IsolateRoute.name,
          initialChildren: children,
        );

  static const String name = 'IsolateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserAuthPage]
class UserAuthRoute extends PageRouteInfo<void> {
  const UserAuthRoute({List<PageRouteInfo>? children})
      : super(
          UserAuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserAuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RefreshPage]
class RefreshRoute extends PageRouteInfo<void> {
  const RefreshRoute({List<PageRouteInfo>? children})
      : super(
          RefreshRoute.name,
          initialChildren: children,
        );

  static const String name = 'RefreshRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PluginPage]
class PluginRoute extends PageRouteInfo<void> {
  const PluginRoute({List<PageRouteInfo>? children})
      : super(
          PluginRoute.name,
          initialChildren: children,
        );

  static const String name = 'PluginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LocalizationPage]
class LocalizationRoute extends PageRouteInfo<void> {
  const LocalizationRoute({List<PageRouteInfo>? children})
      : super(
          LocalizationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocalizationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompressMediaPage]
class CompressMediaRoute extends PageRouteInfo<void> {
  const CompressMediaRoute({List<PageRouteInfo>? children})
      : super(
          CompressMediaRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompressMediaRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ScreenShotPage]
class ScreenShotRoute extends PageRouteInfo<void> {
  const ScreenShotRoute({List<PageRouteInfo>? children})
      : super(
          ScreenShotRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScreenShotRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TabPage]
class TabRoute extends PageRouteInfo<void> {
  const TabRoute({List<PageRouteInfo>? children})
      : super(
          TabRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    void Function()? onLoginSuccess,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onLoginSuccess: onLoginSuccess,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.onLoginSuccess,
  });

  final Key? key;

  final void Function()? onLoginSuccess;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginSuccess: $onLoginSuccess}';
  }
}
