// Author: Dean.Liu
// DateTime: 2023/04/08 13:50

import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:core_kit/package.dart';
import 'package:core_kit/singleton.dart';
import 'package:core_kit/util.dart';
import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import 'common/event/event_bus.dart';
import 'common/event/locale_changed_event.dart';
import 'common/theme/ex_theme.dart';
import 'common/tool/intl_tool.dart';
import 'common/tool/user_manager.dart';
import 'generated/l10n.dart';
import 'route/app_router.dart';
import 'route/router_observer.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  StreamSubscription? _localChangedSub;

  @override
  void initState() {
    super.initState();
    GetIt.I.registerSingleton<AppRouter>(
      AppRouter(navigatorKey: Context().navigatorKey, ref: ref),
    );
    UserManager.init(ref: ref);
    _registerEvents();
  }

  @override
  void dispose() {
    _localChangedSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I.get<AppRouter>();

    final themeApp = CupertinoAdaptiveTheme(
      light: ExTheme.lightThemeData,
      dark: ExTheme.darkThemeData,
      initial: AdaptiveThemeMode.light,
      builder: (theme) => CupertinoApp.router(
        title: 'ExApp',
        theme: theme,
        routerDelegate: appRouter.delegate(
          navigatorObservers: () => [
            RouterObserver(),
            FlutterSmartDialog.observer,
          ],
        ),
        routeInformationParser: appRouter.defaultRouteParser(),
        locale: IntlUtil.localeFromString(Intl.getCurrentLocale()),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: IntlTool().supportedLocales(),
        builder: FlutterSmartDialog.init(
          builder: (context, child) {
            return child ?? const Placeholder();
          },
        ),
      ),
    );
    return CornerBanner(
      message: 'CUSTOM',
      show: true,
      location: BannerLocation.topStart,
      child: themeApp,
    );
  }

  void _registerEvents() {
    _localChangedSub = eventBus.on<LocaleChangedEvent>().listen((event) {
      setState(() {});
    });
  }
}
