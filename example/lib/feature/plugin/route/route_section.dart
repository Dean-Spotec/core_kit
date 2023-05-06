// Author: Dean.Liu
// DateTime: 2023/03/09 16:51

import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../../../route/remote_router.dart';

class RouteSection extends StatelessWidget {
  const RouteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection(
      header: const Text('路由'),
      children: [
        CupertinoListTile(
          title: const Text('Path方式打开截屏页面'),
          onTap: () {
            RemoteRouter().push('ex:///screen-shot-page');
          },
        ),
        CupertinoListTile(
          title: const Text('Path方式打开网页'),
          onTap: () {
            const url = 'https://www.baidu.com/';
            RemoteRouter().push(url);
          },
        ),
        CupertinoListTile(
          title: const Text('Path方式打开短信'),
          onTap: () {
            // Android、iOS都要配置sms权限：https://pub.dev/packages/url_launcher
            if (Platform.isAndroid) {
              const url = 'sms:110?body=Hello World';
              RemoteRouter().push(url);
            } else if (Platform.isIOS) {
              const url = 'sms:110&body=Hello World';
              RemoteRouter().push(url);
            }
          },
        ),
      ],
    );
  }
}
