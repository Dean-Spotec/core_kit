// Author: Dean.Liu
// DateTime: 2023/01/10 18:36

import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // final context = router.navigatorKey.currentContext;
    // final isAuthenticated =
    //     context?.read<UserAuthNotifier>().isAuthenticated ?? false;
    // if (isAuthenticated) {
    //   resolver.next(true);
    // } else {
    //   final loginRoute = LoginRoute(
    //     onLoginSuccess: () {
    //       resolver.next(true);
    //     },
    //   );
    //   router.push(UserAuthRoute(children: [loginRoute]));
    // }
  }
}
