// Author: Dean.Liu
// DateTime: 2023/01/09 16:45

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

/// 路由返回按钮的类型
enum PopButtonType {
  back,
  close;
}

typedef PopButtonBuilder = Widget Function(
  BuildContext context,
  PopButtonType leadingType,
  VoidCallback? action,
);

/// CupertinoNavigationBar前面的返回按钮
///
/// 如果传入[builder]，显示自定义按钮。
/// 否则显示默认按钮：当前路由如果是堆栈里面的第一个，显示关闭按钮，否则显示返回按钮
class AppBarPopButton extends StatefulWidget {
  final Color? color;
  final PopButtonBuilder? builder;
  final Widget? backIcon;
  final Widget? closeIcon;

  const AppBarPopButton({
    super.key,
    this.color,
    this.builder,
    this.backIcon,
    this.closeIcon,
  }) : assert(color == null || builder == null);

  @override
  State<AppBarPopButton> createState() => _AppBarPopButtonState();
}

class _AppBarPopButtonState extends State<AppBarPopButton> {
  @override
  Widget build(BuildContext context) {
    final scope = RouterScope.of(context, watch: true);
    if (scope.controller.canPop()) {
      // 只有根page时，显示关闭，推出其他页面后显示返回按钮
      final useCloseButton = scope.controller.topMostRouter().pageCount == 1;
      if (widget.builder != null) {
        return widget.builder!(
          context,
          useCloseButton ? PopButtonType.close : PopButtonType.back,
          scope.controller.popTop,
        );
      }
      return useCloseButton
          ? CupertinoButton(
              onPressed: scope.controller.popTop,
              child: widget.backIcon ?? const Icon(CupertinoIcons.clear),
            )
          : CupertinoButton(
              onPressed: scope.controller.popTop,
              child: widget.closeIcon ?? const Icon(CupertinoIcons.back),
            );
    }
    return const SizedBox.shrink();
  }
}
