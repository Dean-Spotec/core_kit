// Author: Dean.Liu
// DateTime: 2023/06/02 11:44

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../../common/view/navigation/ex_navigation_bar.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: ExNavigationBar(middle: const Text('注册')),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton.filled(
              onPressed: () {
                context.popRoute();
              },
              child: const Text('返回登录页面'),
            ),
            const SizedBox(height: 10),
            CupertinoButton.filled(
              onPressed: () {
                context.router.root.pop();
              },
              child: const Text('退出登录模块'),
            )
          ],
        ),
      ),
    );
  }
}
