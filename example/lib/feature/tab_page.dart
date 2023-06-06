// Author: Dean.Liu
// DateTime: 2023/01/05 15:28

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/event/close_user_drawer_event.dart';
import '../common/event/event_bus.dart';
import '../common/theme/ex_theme.dart';
import '../common/tool/user_manager.dart';
import '../route/app_router.dart';
import 'drawer/user_drawer_page.dart';

@RoutePage()
class TabPage extends ConsumerStatefulWidget {
  const TabPage({super.key});

  @override
  ConsumerState<TabPage> createState() => _TabPageState();
}

class _TabPageState extends ConsumerState<TabPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  StreamSubscription? _closeUserDrawerSub;

  @override
  void initState() {
    super.initState();
    _registerEvents();
  }

  @override
  void dispose() {
    _closeUserDrawerSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        CoreRoute(onOpenDrawer: _onOpenUserDrawer),
        const PluginRoute(),
        const MineRoute(),
      ],
      duration: const Duration(milliseconds: 100),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: ExTheme.of(context).barBackgroundColor,
          body: child,
          drawer: const Drawer(child: UserDrawerPage()),
          bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) => _onSetActiveIndex(tabsRouter, index),
              selectedFontSize: 12,
              backgroundColor: ExTheme.of(context).barBackgroundColor,
              selectedItemColor: ExTheme.of(context).primaryColor,
              unselectedItemColor: CupertinoColors.systemGrey,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.folder),
                  label: 'Core',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.bag),
                  label: 'Plugin',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_circle),
                  label: 'Mine',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _registerEvents() {
    _closeUserDrawerSub = eventBus
        .on<CloseUserDrawerEvent>()
        .listen((event) => _closeUserDrawer());
  }

  void _onSetActiveIndex(TabsRouter tabsRouter, int index) {
    if (index == 2) {
      // auto_route的AutoTabsRouter目前暂时不支持使用guard，需要手动判断
      // https://github.com/Milad-Akarie/auto_route_library/issues/1278#issuecomment-1364648755
      UserManager()
          .loginIfNeeded(onLoggedIn: () => tabsRouter.setActiveIndex(index));
    } else {
      tabsRouter.setActiveIndex(index);
    }
  }

  void _onOpenUserDrawer() {
    UserManager().loginIfNeeded(
      onLoggedIn: () => _scaffoldKey.currentState?.openDrawer(),
    );
  }

  void _closeUserDrawer() {
    _scaffoldKey.currentState?.closeDrawer();
  }
}
