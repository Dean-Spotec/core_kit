// Author: Dean.Liu
// DateTime: 2023/04/04 18:44

import 'package:flutter/cupertino.dart';

import 'dark_theme_data.dart';
import 'ex_theme_data.dart';
import 'light_theme_data.dart';

class ExTheme {
  static const lightThemeData = LightThemeData();
  static const darkThemeData = DarkThemeData();

  static ExThemeData of(BuildContext context) {
    final theme = CupertinoTheme.of(context);
    return theme.brightness == Brightness.light
        ? lightThemeData
        : darkThemeData;
  }
}
