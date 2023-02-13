// Author: Dean.Liu
// DateTime: 2023/02/11 13:56

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

export 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

/// 加载中的视图
typedef HudLoadingBuilder = Widget Function(BuildContext context, String? msg);

/// 各种状态的视图
typedef HudStatusBuilder = Widget Function(BuildContext context, String msg);

/// hud弹窗。功能依赖于FlutterSmartDialog，使用该类前必须已经调用过FlutterSmartDialog.init
class Hud {
  factory Hud() => _instance;

  Hud._internal();

  static final Hud _instance = Hud._internal();

  /// 初始化各种hud弹窗样式
  /// - [displayTime] 成功、报错、info提示的显示时间
  /// - [loadingBuilder] 加载中的视图
  /// - [successBuilder] 成功提示
  /// - [errorBuilder] 报错提示
  /// - [infoBuilder] 普通信息提示
  void init({
    Duration displayTime = const Duration(seconds: 2),
    HudLoadingBuilder? loadingBuilder,
    HudStatusBuilder? successBuilder,
    HudStatusBuilder? errorBuilder,
    HudStatusBuilder? infoBuilder,
  }) {
    _displayTime = displayTime;
    _loadingBuilder = loadingBuilder;
    _successBuilder = successBuilder;
    _errorBuilder = errorBuilder;
    _infoBuilder = infoBuilder;
  }

  Duration? _displayTime;
  HudLoadingBuilder? _loadingBuilder;
  HudStatusBuilder? _successBuilder;
  HudStatusBuilder? _errorBuilder;
  HudStatusBuilder? _infoBuilder;

  /// 显示loading状态，事件不可穿透
  Future<void> show({
    String msg = 'loading...',
    SmartAnimationType? animationType,
    HudLoadingBuilder? loadingBuilder,
  }) async {
    final builder = loadingBuilder ?? _loadingBuilder;
    return SmartDialog.showLoading(
      msg: msg,
      maskColor: Colors.transparent,
      builder: builder == null ? null : (context) => builder(context, msg),
    );
  }

  /// 显示成功提示
  /// - [usePenetrate] 手势是否可以穿透到下层页面，默认可以穿透
  Future<void> showSuccess(
    String msg, {
    bool usePenetrate = true,
    Duration? displayTime,
    HudStatusBuilder? successBuilder,
  }) async {
    final builder = successBuilder ?? _successBuilder;
    return SmartDialog.showLoading(
      msg: msg,
      maskColor: Colors.transparent,
      usePenetrate: usePenetrate,
      displayTime: _displayTime,
      builder: builder == null ? null : (context) => builder(context, msg),
    );
  }

  /// 显示失败提示
  /// - [usePenetrate] 手势是否可以穿透到下层页面，默认可以穿透
  Future<void> showError(
    String msg, {
    bool usePenetrate = true,
    Duration? displayTime,
    HudStatusBuilder? errorBuilder,
  }) async {
    final builder = errorBuilder ?? _errorBuilder;
    return SmartDialog.showLoading(
      msg: msg,
      maskColor: Colors.transparent,
      usePenetrate: usePenetrate,
      displayTime: _displayTime,
      builder: builder == null ? null : (context) => builder(context, msg),
    );
  }

  /// 显示普通信息提示
  /// - [usePenetrate] 手势是否可以穿透到下层页面，默认可以穿透
  Future<void> showInfo(
    String msg, {
    bool usePenetrate = true,
    Duration? displayTime,
    HudStatusBuilder? infoBuilder,
  }) async {
    final builder = infoBuilder ?? _infoBuilder;
    return SmartDialog.showLoading(
      msg: msg,
      maskColor: Colors.transparent,
      usePenetrate: usePenetrate,
      displayTime: displayTime ?? _displayTime,
      builder: builder == null ? null : (context) => builder(context, msg),
    );
  }

  /// 隐藏所有hud弹窗
  Future<void> dismiss() {
    return SmartDialog.dismiss(status: SmartStatus.loading);
  }
}
