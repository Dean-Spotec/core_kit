// Author: Dean.Liu
// DateTime: 2021/12/13 10:47

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

/// 点击安卓返回按钮退出APP
class QuitAppScope extends StatefulWidget {
  const QuitAppScope({
    super.key,
    required this.child,
    required this.onWaitingQuit,
  });

  final Widget child;

  /// 第一次点击返回按钮的回调，等待第二次点击退出APP
  final VoidCallback onWaitingQuit;

  @override
  State<QuitAppScope> createState() => _QuitAppScopeState();
}

class _QuitAppScopeState extends State<QuitAppScope> {
  /// 已经点击过一次返回按钮，等待第二次点击退出APP
  bool _isWaitingQuit = false;

  /// 清除标记定时器
  Timer? _quitTimer;

  @override
  void dispose() {
    _quitTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!Navigator.canPop(context)) {
          if (_isWaitingQuit) {
            // 退出APP，强制结束，不需要原生做退出保存数据处理
            exit(0);
          } else {
            widget.onWaitingQuit.call();
            _isWaitingQuit = true;
            // 开启定时器，两秒后清除标记
            _quitTimer = Timer(const Duration(seconds: 2), () {
              _isWaitingQuit = false;
              _quitTimer?.cancel();
            });
          }
          return false;
        }
        return true;
      },
      child: widget.child,
    );
  }
}
