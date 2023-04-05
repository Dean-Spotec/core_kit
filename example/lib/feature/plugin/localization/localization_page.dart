// Author: Dean.Liu
// DateTime: 2023/04/07 00:04

import 'package:auto_route/auto_route.dart';
import 'package:core_kit/package.dart';
import 'package:core_kit/singleton.dart';
import 'package:core_kit/util.dart';
import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../common/const/sp_keys.dart';
import '../../../common/event/event_bus.dart';
import '../../../common/event/locale_changed_event.dart';
import '../../../common/view/navigation/ex_navigation_bar.dart';
import '../../../generated/l10n.dart';

class LocalizationPage extends StatefulWidget {
  const LocalizationPage({super.key});

  @override
  State<LocalizationPage> createState() => _LocalizationPageState();
}

class _LocalizationPageState extends State<LocalizationPage> {
  final languageTitleMap = {
    const Locale.fromSubtags(languageCode: 'en'): 'English',
    const Locale.fromSubtags(
      languageCode: 'zh',
      scriptCode: 'Hans',
      countryCode: 'CN',
    ): '简体中文',
    const Locale.fromSubtags(languageCode: 'ar'): 'عربي',
  };

  var _selectedLocale = Intl.getCurrentLocale();

  @override
  Widget build(BuildContext context) {
    final locales = languageTitleMap.keys.toList();
    final titles = languageTitleMap.values.toList();

    return CupertinoPageScaffold(
      navigationBar: ExNavigationBar(
        middle: Text(S.of(context).localization),
        trailing: AppleButton(
          onPressed: _confirmChangeLocale,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(S.of(context).save),
        ),
      ),
      child: ListView.builder(
        itemCount: languageTitleMap.length,
        itemBuilder: (context, index) {
          final locale = locales[index];
          return CupertinoListTile(
            title: Text(titles[index]),
            onTap: () {
              setState(() {
                _selectedLocale = locale.toString();
              });
            },
            trailing: locale.toString() == _selectedLocale
                ? const Icon(CupertinoIcons.check_mark_circled_solid)
                : const Icon(CupertinoIcons.circle),
          );
        },
      ),
    );
  }

  void _confirmChangeLocale() {
    if (_selectedLocale == Intl.getCurrentLocale()) {
      context.popRoute();
      return;
    }
    Hud().show();
    // 修改本地语言，发送通知给MyApp全局刷新
    S.load(IntlUtil.localeFromString(_selectedLocale)).then((value) {
      eventBus.fire(LocaleChangedEvent());
      // 保存到本地
      SpStorage().putString(
        SpKeys.currentLocale,
        Intl.getCurrentLocale(),
      );
      context.popRoute();
    }).whenComplete(() => Hud().dismiss());
  }
}
