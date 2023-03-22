// Author: Dean.Liu
// DateTime: 2023/03/19 21:17

import 'package:flutter/cupertino.dart';

import 'ex_theme_data.dart';

class LightThemeData extends ExThemeData {
  const LightThemeData()
      : super(
          brightness: Brightness.light,
          primaryColor: CupertinoColors.systemBlue,
          barBackgroundColor: const Color(0xF0F9F9F9),
          scaffoldBackgroundColor: CupertinoColors.systemBackground,
        );

  @override
  @override
  TextStyle get sectionTitle => const TextStyle(
        fontSize: 15,
        color: CupertinoColors.systemBlue,
      );
}
