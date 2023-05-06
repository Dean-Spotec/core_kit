// Author: Dean.Liu
// DateTime: 2023/04/28 09:55

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../../route/app_router.dart';

class RefreshSection extends StatelessWidget {
  const RefreshSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection(
      header: const Text('下拉刷新、上拉加载'),
      children: [
        CupertinoListTile(
          title: const Text('普通列表'),
          onTap: () {
            context.pushRoute(const RefreshRoute());
          },
        ),
      ],
    );
  }
}
