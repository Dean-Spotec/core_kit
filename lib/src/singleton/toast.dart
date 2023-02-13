// Author: Dean.Liu
// DateTime: 2023/02/11 14:59

import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

/// 加载中的视图
typedef ToastBuilder = Widget Function(BuildContext context, String msg);

/// toast弹窗。功能依赖于FlutterSmartDialog，使用该类前必须已经调用过FlutterSmartDialog.init
class Toast {
  factory Toast() => _instance;

  Toast._internal();

  static final Toast _instance = Toast._internal();

  Duration? _displayTime;
  SmartToastType? _displayType;
  AlignmentGeometry? _alignment;
  ToastBuilder? _toastBuilder;

  /// 初始化toast样式
  /// - [displayTime] toast的显示时间
  /// - [displayType] toast堆栈如何调度显示
  /// - [alignment] toast对齐方式
  /// - [toastBuilder] toast视图
  void init({
    Duration? displayTime,
    SmartToastType? displayType = SmartToastType.last,
    AlignmentGeometry? alignment,
    ToastBuilder? toastBuilder,
  }) {
    _displayTime = displayTime;
    _displayType = displayType;
    _alignment = alignment;
    _toastBuilder = toastBuilder;
  }

  /// 显示toast
  /// - [displayTime] toast的显示时间
  /// - [alignment] toast对齐方式
  /// - [toastBuilder] toast视图
  void show(
    String msg, {
    Duration? displayTime,
    AlignmentGeometry? alignment,
    ToastBuilder? toastBuilder,
  }) {
    final builder = toastBuilder ?? _toastBuilder;
    SmartDialog.showToast(
      msg,
      displayTime: displayTime ?? _displayTime,
      displayType: _displayType,
      alignment: alignment ?? _alignment,
      builder: builder == null ? null : (context) => builder(context, msg),
    );
  }

  /// 隐藏所有toast弹窗
  Future<void> dismiss() {
    return SmartDialog.dismiss(status: SmartStatus.toast);
  }
}
