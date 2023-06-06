// Author: Dean.Liu
// DateTime: 2023/03/09 11:01

import 'package:auto_route/auto_route.dart';
import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';

import '../../common/view/navigation/ex_navigation_bar.dart';

@RoutePage()
class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CupertinoPageScaffold(
      navigationBar: ExNavigationBar(
        popType: PopButtonType.none,
        middle: const Text('我的'),
        // 关闭hero动画，否则要和PluginPage的导航栏冲突
        transitionBetweenRoutes: false,
      ),
      child: const Placeholder(),
    );
  }
}
