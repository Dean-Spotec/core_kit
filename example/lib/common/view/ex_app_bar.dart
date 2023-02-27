// Author: Dean.Liu
// DateTime: 2023/02/27 18:44

import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';

import '../../r.dart';

class ExAppBar extends StatelessWidget {
  const ExAppBar({
    super.key,
    this.leading,
    this.middle,
    this.trailing,
    this.backgroundColor,
    this.brightness,
    this.padding,
    this.border,
    this.heroTag,
  });

  final Widget? leading;
  final Widget? middle;
  final Widget? trailing;
  final Color? backgroundColor;
  final Brightness? brightness;
  final EdgeInsetsDirectional? padding;
  final Border? border;
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      leading: leading ??
          AppBarPopButton(
            backIcon: Image.asset(R.navBack),
            closeIcon: Image.asset(R.navClose),
          ),
    );
  }
}
