// Author: Dean.Liu
// DateTime: 2023/06/08 15:32

import 'package:auto_route/auto_route.dart';
import 'package:core_kit/singleton.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../route/app_router.dart';
import '../provider/user_auth_provider.dart';

class UserManager {
  factory UserManager() => _instance;

  UserManager._internal();

  static final UserManager _instance = UserManager._internal();

  static WidgetRef? _ref;

  // ignore: use_setters_to_change_properties
  static void init({required WidgetRef ref}) {
    _ref = ref;
  }

  /// 如果已登录，直接执行回调；如果未登录，跳转登录页面登录成功后再执行回调
  void loginIfNeeded({required VoidCallback onLoggedIn}) {
    bool isLoggedIn() => _ref?.read(userAuthProvider.notifier).state == true;
    // 已登录就返回
    if (_ref == null || isLoggedIn()) {
      onLoggedIn();
      return;
    }
    Context().navigatorContext.pushRoute(const UserAuthRoute()).then((value) {
      if (isLoggedIn()) {
        onLoggedIn();
      }
    });
  }

  Future<bool> login() {
    Hud().show();
    return _mockRequest().then((isSuccess) {
      if (isSuccess) {
        Hud().showSuccess('登录成功');
        _ref?.read(userAuthProvider.notifier).state = true;
        return true;
      } else {
        Hud().showSuccess('登录失败');
        return false;
      }
    }).catchError((error) {
      Hud().showError('登录失败:$error');
      return false;
    });
  }

  Future<bool> logout() async {
    Hud().show();
    return _mockRequest().then((isSuccess) {
      if (isSuccess) {
        Hud().showSuccess('退出登录成功');
        _ref?.read(userAuthProvider.notifier).state = false;
        return true;
      } else {
        Hud().showSuccess('退出登录失败');
        return false;
      }
    }).catchError((error) {
      Hud().showError('退出登录失败:$error');
      return false;
    });
  }

  Future<bool> _mockRequest() {
    return Future.delayed(const Duration(milliseconds: 500), () => true);
  }
}
