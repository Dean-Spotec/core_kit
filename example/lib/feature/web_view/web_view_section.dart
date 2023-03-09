// Author: Dean.Liu
// DateTime: 2023/03/09 16:41

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../r.dart';
import '../../route/app_router.dart';

class WebViewSection extends StatelessWidget {
  const WebViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection(
      header: const Text('网页'),
      children: [
        CupertinoListTile(
          title: const Text('加载Url网页'),
          onTap: () {
            final urlWebRoute = WebViewRoute(
              loadContent: (c) {
                c.loadRequest(Uri.parse('https://www.baidu.com/'));
              },
            );
            context.pushRoute(urlWebRoute);
          },
        ),
        CupertinoListTile(
          title: const Text('加载Html网页'),
          onTap: () {
            final htmlWebRoute = WebViewRoute(
              loadContent: (c) {
                c.loadFlutterAsset(R.htmlString);
              },
            );
            context.pushRoute(htmlWebRoute);
          },
        ),
      ],
    );
  }
}
