// Author: Dean.Liu
// DateTime: 2023/03/09 16:51

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../../route/app_router.dart';
import '../../../route/remote_router.dart';

class RouteSection extends StatelessWidget {
  const RouteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection(
      header: const Text('路由'),
      children: [
        CupertinoListTile(
          title: const Text('Path方式打开本地页面'),
          onTap: () {
            RemoteRouter().push('ex:///screen-shot-route');
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
          title: const Text('Path方式打开短信APP'),
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
        CupertinoListTile(
          title: const Text('Present登录模块'),
          onTap: () {
            context.pushRoute(const UserAuthRoute());
          },
        ),
      ],
    );
  }
}
