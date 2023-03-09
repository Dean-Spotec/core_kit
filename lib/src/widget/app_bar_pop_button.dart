// Author: Dean.Liu
// DateTime: 2023/01/09 16:45

import 'package:flutter/cupertino.dart';

/// 路由返回按钮的类型
enum PopButtonType {
  back,
  close;
}

typedef PopButtonBuilder = Widget Function(
  BuildContext context,
  PopButtonType leadingType,
);

/// CupertinoNavigationBar前面的返回按钮
///
/// 否则显示默认按钮：当前路由如果是堆栈里面的第一个，显示关闭按钮，否则显示返回按钮
class AppBarPopButton extends StatefulWidget {
  final PopButtonType popType;
  final Color? color;
  final Widget? backIcon;
  final Widget? closeIcon;
  final EdgeInsetsGeometry? padding;
  final double? minSize;
  final Function(PopButtonType)? popAction;

  const AppBarPopButton({
    super.key,
    required this.popType,
    this.color,
    this.backIcon,
    this.closeIcon,
    this.padding = EdgeInsets.zero,
    this.minSize = kMinInteractiveDimensionCupertino,
    this.popAction,
  });

  @override
  State<AppBarPopButton> createState() => _AppBarPopButtonState();
}

class _AppBarPopButtonState extends State<AppBarPopButton> {
  @override
  Widget build(BuildContext context) {
    // 是否是关闭模块
    final popEntireModule = widget.popType == PopButtonType.close;
    final child = popEntireModule
        ? widget.closeIcon ?? const Icon(CupertinoIcons.clear)
        : widget.backIcon ?? const Icon(CupertinoIcons.back);
    return CupertinoButton(
      onPressed: () {
        if (widget.popAction != null) {
          widget.popAction!(widget.popType);
        } else {
          popEntireModule
              ? Navigator.of(context, rootNavigator: true).maybePop()
              : Navigator.of(context).maybePop();
        }
      },
      color: widget.color,
      padding: widget.padding,
      minSize: widget.minSize,
      child: child,
    );
  }
}
