// Author: Dean.Liu
// DateTime: 2023/01/10 18:44

import 'package:flutter/cupertino.dart';

class UserAuthNotifier extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }
}
