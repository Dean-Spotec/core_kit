// Author: Dean.Liu
// DateTime: 2023/03/19 21:17

import 'package:flutter/cupertino.dart';

import 'ex_theme_data.dart';

class DarkThemeData extends ExThemeData {
  const DarkThemeData()
      : super(
          brightness: Brightness.dark,
          primaryColor: CupertinoColors.systemGreen,
          barBackgroundColor: const Color(0xF01D1D1D),
          scaffoldBackgroundColor: CupertinoColors.systemBackground,
        );

  @override
  TextStyle get sectionTitle => const TextStyle(
        fontSize: 15,
        color: CupertinoColors.systemGreen,
      );
}
