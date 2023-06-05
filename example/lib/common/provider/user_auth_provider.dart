// Author: Dean.Liu
// DateTime: 2023/06/03 17:01

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 是否已登录
var _isLoggedIn = false;

final userAuthProvider = StateProvider<bool>((ref) => _isLoggedIn);
