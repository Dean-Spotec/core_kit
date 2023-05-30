// Author: Dean.Liu
// DateTime: 2023/04/28 10:03

import 'package:auto_route/auto_route.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/view/navigation/ex_navigation_bar.dart';
import '../../../common/view/refresh/ex_refresh_header.dart';

@RoutePage()
class RefreshPage extends StatefulWidget {
  const RefreshPage({super.key});

  @override
  State<RefreshPage> createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: ExNavigationBar(
        middle: const Text('普通列表'),
        backgroundColor: Colors.transparent,
      ),
      // backgroundColor: Colors.yellow,
      child: EasyRefresh(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          return IndicatorResult.success;
        },
        onLoad: () async {
          await Future.delayed(const Duration(seconds: 1));
          return IndicatorResult.success;
        },
        header: ExRefreshHeader(),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return CupertinoListTile(
              title: Text('$index'),
              backgroundColor: Colors.transparent,
            );
          },
          itemCount: 20,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(height: 1);
          },
        ),
      ),
    );
  }
}
