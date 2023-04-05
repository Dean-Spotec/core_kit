// Author: Dean.Liu
// DateTime: 2023/03/08 21:36

import 'package:core_kit/singleton.dart';
import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../r.dart';
import '../../theme/ex_theme.dart';

class ExBarPopButton extends AppBarPopButton {
  ExBarPopButton({
    super.key,
    required super.popType,
    super.popAction,
  }) : super(
          backIcon: Image.asset(
            R.navBack,
            color: ExTheme.of(Context().navigatorContext).primaryColor,
            width: 24,
            height: 24,
            matchTextDirection: true,
          ),
          closeIcon: Image.asset(
            R.navClose,
            color: ExTheme.of(Context().navigatorContext).primaryColor,
            width: 24,
            height: 24,
            matchTextDirection: true,
          ),
        );
}
