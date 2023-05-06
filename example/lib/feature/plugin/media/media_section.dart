// Author: Dean.Liu
// DateTime: 2023/03/09 16:40

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../../route/app_router.dart';

class MediaSection extends StatelessWidget {
  const MediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection(
      header: const Text('Media'),
      children: [
        CupertinoListTile(
          title: const Text('截屏'),
          onTap: () {
            context.pushRoute(const ScreenShotRoute());
          },
        ),
        CupertinoListTile(
          title: const Text('压缩'),
          onTap: () {
            context.pushRoute(const CompressMediaRoute());
          },
        ),
      ],
    );
  }
}
