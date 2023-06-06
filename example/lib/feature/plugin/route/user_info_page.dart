// Author: Dean.Liu
// DateTime: 2023/06/06 13:46

import 'package:auto_route/auto_route.dart';
import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/event/close_user_drawer_event.dart';
import '../../../common/event/event_bus.dart';
import '../../../common/tool/user_manager.dart';
import '../../../common/view/navigation/ex_navigation_bar.dart';
import '../../../route/app_router.dart';

@RoutePage()
class UserInfoPage extends ConsumerStatefulWidget {
  const UserInfoPage({super.key});

  @override
  ConsumerState<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends ConsumerState<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: ExNavigationBar(
        middle: const Text('用户信息'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('用户名：xxx'),
            const SizedBox(height: 10),
            AppleButton.filled(
              child: const Text('退出登录'),
              onPressed: () {
                _logout(context, ref);
              },
            ),
            const SizedBox(height: 10),
            AppleButton.filled(
              child: const Text('跳转到"我的"页面'),
              onPressed: () {
                eventBus.fire(CloseUserDrawerEvent());
                context.navigateTo(const MineRoute());
              },
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context, WidgetRef ref) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('退出登录'),
          actions: [
            CupertinoDialogAction(
              child: const Text('取消'),
              onPressed: () => context.popRoute(),
            ),
            CupertinoDialogAction(
              onPressed: () {
                UserManager().logout().then((value) {
                  context.replaceRoute(const TabRoute());
                });
              },
              isDestructiveAction: true,
              child: const Text('确认'),
            ),
          ],
        );
      },
    );
  }
}
