// Author: Dean.Liu
// DateTime: 2023/03/09 11:06

import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';

import '../../common/view/navigation/ex_navigation_bar.dart';
import '../media/media_section.dart';
import '../route/route_section.dart';
import '../theme/theme_section.dart';
import '../web_view/web_view_section.dart';

class PluginPage extends StatefulWidget {
  const PluginPage({super.key});

  @override
  State<PluginPage> createState() => _PluginPageState();
}

class _PluginPageState extends State<PluginPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: ExNavigationBar(
        popType: PopButtonType.none,
        middle: const Text('插件功能'),
        // 关闭hero动画，否则要和CorePage的导航栏冲突
        transitionBetweenRoutes: false,
      ),
      child: ListView(
        children: const [
          RouteSection(),
          ThemeSection(),
          MediaSection(),
          WebViewSection(),
        ],
      ),
    );
  }
}
