import 'dart:async';

import 'package:core_kit/package.dart';
import 'package:core_kit/singleton.dart';
import 'package:core_kit/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/const/sp_keys.dart';
import 'common/tool/intl_tool.dart';
import 'common/view/hud/hud_loading_view.dart';
import 'common/view/hud/hud_status_view.dart';
import 'common/view/toast_view.dart';
import 'generated/l10n.dart';
import 'my_app.dart';
import 'r.dart';

// 使用flutter run --no-enable-impeller解决新版本flutter在iOS模拟器上运行卡顿的问题
// https://github.com/flutter/flutter/issues/128391

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpStorage.init();
  await _loadSavedLocale();
  _initHud();
  Toast.init(toastBuilder: (context, msg) => ToastView(msg: msg));
  runApp(const ProviderScope(child: MyApp()));
}

/// 加载本地保存的语言
Future<void> _loadSavedLocale() async {
  // 更新intl库中的systemLocale
  await findSystemLocale();

  final currentLocale = SpStorage().getString(SpKeys.currentLocale);
  if (currentLocale == null) {
    // 第一次启动，本地还未保存语言
    final systemLocale = IntlUtil.localeFromString(Intl.systemLocale);
    // 将系统语言转化为app内支持的语言
    final resolvedLocale = IntlTool().customLocaleResolution(
      systemLocale,
      IntlTool().supportedLocales(),
    );
    SpStorage().putString(SpKeys.currentLocale, resolvedLocale.toString());
    await S.load(resolvedLocale);
  } else {
    // 本地已经保存了语言，直接加载
    await S.load(IntlUtil.localeFromString(currentLocale));
  }
}

void _initHud() {
  Hud.init(
    loadingBuilder: (context, msg) => HudLoadingView(msg: msg),
    successBuilder: (context, msg) =>
        HudStatusView(image: R.hudSuccess, msg: msg),
    errorBuilder: (context, msg) => HudStatusView(image: R.hudError, msg: msg),
    infoBuilder: (context, msg) => HudStatusView(image: R.hudInfo, msg: msg),
  );
}
