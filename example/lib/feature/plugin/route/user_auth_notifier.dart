// Author: Dean.Liu
// DateTime: 2023/01/10 18:44

import 'package:flutter/cupertino.dart';

class UserAuthNotifier extends ChangeNotifier {
  bool _isLoggedIn = false;

  /// 用户是否已登录
  bool get isLoggedIn => _isLoggedIn;

  set isLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}
