// Author: Dean.Liu
// DateTime: 2023/03/09 11:01

import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';

import '../../common/view/navigation/ex_navigation_bar.dart';
import 'async/async_section.dart';

class CorePage extends StatefulWidget {
  const CorePage({super.key});

  @override
  State<CorePage> createState() => _CorePageState();
}

class _CorePageState extends State<CorePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: ExNavigationBar(
        popType: PopButtonType.none,
        middle: const Text('CoreKit'),
        // 关闭hero动画，否则要和PluginPage的导航栏冲突
        transitionBetweenRoutes: false,
      ),
      child: ListView(
        children: const [
          AsyncSection(),
        ],
      ),
    );
  }
}
