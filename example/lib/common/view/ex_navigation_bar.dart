// Author: Dean.Liu
// DateTime: 2023/03/04 18:55

import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';

import 'ex_bar_pop_button.dart';

class ExNavigationBar extends CupertinoNavigationBar {
  ExNavigationBar({
    super.key,
    PopButtonType popType = PopButtonType.back,
    Widget? leading,
    super.automaticallyImplyLeading,
    super.automaticallyImplyMiddle,
    super.middle,
    super.trailing,
    super.border,
    super.backgroundColor,
    super.brightness,
    EdgeInsetsDirectional? padding,
    super.transitionBetweenRoutes,
    super.heroTag,
  }) : super(
          leading: leading ?? ExBarPopButton(popType: popType),
          padding: padding ?? EdgeInsetsDirectional.zero,
        );
}
