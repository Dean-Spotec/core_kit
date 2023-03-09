// Author: Dean.Liu
// DateTime: 2023/03/08 21:36

import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';

import '../../r.dart';

class ExBarPopButton extends AppBarPopButton {
  ExBarPopButton({
    super.key,
    required super.popType,
    super.popAction,
  }) : super(
          backIcon: Image.asset(
            R.navBack,
            color: CupertinoColors.systemBlue,
            width: 24,
            height: 24,
          ),
          closeIcon: Image.asset(
            R.navClose,
            color: CupertinoColors.systemBlue,
            width: 24,
            height: 24,
          ),
        );
}
