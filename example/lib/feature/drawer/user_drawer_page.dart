import 'package:auto_route/auto_route.dart';
import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';

import '../../route/app_router.dart';

@RoutePage()
class UserDrawerPage extends StatelessWidget {
  const UserDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemTeal,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppleButton.filled(
              child: const Text('推出用户信息页'),
              onPressed: () {
                context.pushRoute(const UserInfoRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
