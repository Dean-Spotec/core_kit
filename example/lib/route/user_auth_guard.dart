// Author: Dean.Liu
// DateTime: 2023/01/10 18:36

import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/provider/user_auth_provider.dart';
import 'app_router.dart';

/// 未登录时，推出需要登录的页面。先拦截后弹出登录模块，登录成功后重发路由
class AuthGuard extends AutoRouteGuard {
  AuthGuard({required this.ref});

  final WidgetRef ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isLoggedIn = ref.read(userAuthProvider.notifier).state;
    if (isLoggedIn) {
      resolver.next();
    } else {
      final loginRoute = LoginRoute(
        onLoginSuccess: () => resolver.next(),
      );
      router.push(UserAuthRoute(children: [loginRoute]));
    }
  }
}
