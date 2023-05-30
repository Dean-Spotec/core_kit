// Author: Dean.Liu
// DateTime: 2023/01/05 15:28

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/theme/ex_theme.dart';
import '../route/app_router.dart';

@RoutePage()
class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        CoreRoute(),
        PluginRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          backgroundColor: ExTheme.of(context).barBackgroundColor,
          body: child,
          bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
