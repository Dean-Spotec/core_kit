// Author: Dean.Liu
// DateTime: 2023/03/09 11:06

import 'dart:async';

import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';

import '../../common/event/event_bus.dart';
import '../../common/event/locale_changed_event.dart';
import '../../common/view/navigation/ex_navigation_bar.dart';
import '../media/media_section.dart';
import '../route/route_section.dart';
import '../theme/theme_section.dart';
import '../web_view/web_view_section.dart';
import 'localization/localization_section.dart';

class PluginPage extends StatefulWidget {
  const PluginPage({super.key});

  @override
  State<PluginPage> createState() => _PluginPageState();
}

class _PluginPageState extends State<PluginPage> {
  StreamSubscription? _localChangedSub;

  @override
  void initState() {
    _registerEvents();
    super.initState();
  }

  @override
  void dispose() {
    _localChangedSub?.cancel();
    super.dispose();
  }

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
          LocalizationSection(),
          MediaSection(),
          WebViewSection(),
        ],
      ),
    );
  }

  void _registerEvents() {
    _localChangedSub = eventBus.on<LocaleChangedEvent>().listen((event) {
      // 重新发送和语言相关的请求，刷新页面
    });
  }
}