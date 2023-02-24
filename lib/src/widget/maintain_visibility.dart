// Author: Dean.Liu
// DateTime: 2022/02/18 17:16

import 'package:flutter/cupertino.dart';

/// 不可见时，依然在父视图中保留布局
class MaintainVisibility extends StatelessWidget {
  const MaintainVisibility({
    super.key,
    required this.child,
    this.visible = true,
  });

  final Widget child;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      maintainSize: true,
      maintainState: true,
      maintainAnimation: true,
      child: child,
    );
  }
}
