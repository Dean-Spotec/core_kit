// Author: Dean.Liu
// DateTime: 2023/06/02 11:44

import 'package:auto_route/auto_route.dart';
import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/tool/user_manager.dart';
import '../../../common/view/navigation/ex_navigation_bar.dart';
import '../../../route/app_router.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({
    super.key,
    this.onLoginSuccess,
  });

  final VoidCallback? onLoginSuccess;

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: ExNavigationBar(
        middle: const Text('登录'),
        popType: PopButtonType.close,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
              onPressed: () {
                UserManager().login().then((isSuccess) {
                  if (isSuccess) {
                    context.router.root.pop();
                    widget.onLoginSuccess?.call();
                  }
                });
              },
              child: const Text('登录'),
            ),
            const SizedBox(height: 10),
            CupertinoButton.filled(
              onPressed: () {
                context.pushRoute(const RegisterRoute());
              },
              child: const Text('Push注册页面'),
            ),
          ],
        ),
      ),
    );
  }
}
