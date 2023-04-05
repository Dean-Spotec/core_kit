// Author: Dean.Liu
// DateTime: 2023/04/10 22:35

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

import '../../generated/l10n.dart';

class IntlTool {
  factory IntlTool() => _instance;

  IntlTool._internal();

  static final IntlTool _instance = IntlTool._internal();

  /// 将英语放到支持语言的第一位，实现不支持的语言默认使用英语
  List<Locale> supportedLocales() {
    final rawLocales = S.delegate.supportedLocales;
    final enLocale = rawLocales.firstWhereOrNull((element) {
      return element.languageCode == 'en';
    });
    if (enLocale == null) {
      return rawLocales;
    } else {
      final tmpLocals = List.of(rawLocales);
      tmpLocals.remove(enLocale);
      tmpLocals.insert(0, enLocale);
      return tmpLocals;
    }
  }

  /// 根据传入的语言，返回app内支持的语言
  Locale customLocaleResolution(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    return basicLocaleListResolution(
      locale == null ? [] : [locale],
      supportedLocales,
    );
  }
}
