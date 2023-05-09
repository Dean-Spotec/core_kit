// Author: Dean.Liu
// DateTime: 2023/05/06 14:32

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../../route/app_router.dart';

class AsyncSection extends StatefulWidget {
  const AsyncSection({super.key});

  @override
  State<AsyncSection> createState() => _AsyncSectionState();
}

class _AsyncSectionState extends State<AsyncSection> {
  @override
  Widget build(BuildContext context) {
    return CupertinoListSection(
      header: const Text('Async'),
      children: [
        CupertinoListTile(
          title: const Text('Isolate'),
          onTap: () {
            context.pushRoute(const IsolateRoute());
          },
        ),
      ],
    );
  }
}
