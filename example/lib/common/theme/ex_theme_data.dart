// Author: Dean.Liu
// DateTime: 2023/03/19 21:27

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';

// 主题的基类，除CupertinoThemeData自带属性外，可以添加自定义样式
abstract class ExThemeData extends CupertinoThemeData {
  const ExThemeData({
    super.brightness,
    super.primaryColor,
    super.primaryContrastingColor,
    super.barBackgroundColor,
    super.scaffoldBackgroundColor,
  });

  TextStyle get sectionTitle;
}

