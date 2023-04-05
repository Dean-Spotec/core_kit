// Author: Dean.Liu
// DateTime: 2023/04/08 12:56

import 'dart:ui';

class IntlUtil {
  /// 根据语言的字符串生成Locale类
  static Locale localeFromString(String locale, {String separator = '_'}) {
    final codeList = locale.split(separator);
    return Locale.fromSubtags(
      languageCode: codeList[0],
      scriptCode: codeList.length >= 2 ? codeList[1] : null,
      countryCode: codeList.length >= 3 ? codeList[2] : null,
    );
  }
}
