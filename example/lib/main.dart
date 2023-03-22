import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:core_kit/singleton.dart';
import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'common/theme/ex_theme.dart';
import 'common/view/hud/hud_loading_view.dart';
import 'common/view/hud/hud_status_view.dart';
import 'common/view/toast_view.dart';
import 'r.dart';
import 'route/app_router.dart';

void main() {
  Hud.init(
    loadingBuilder: (context, msg) => HudLoadingView(msg: msg),
    successBuilder: (context, msg) =>
        HudStatusView(image: R.hudSuccess, msg: msg),
    errorBuilder: (context, msg) => HudStatusView(image: R.hudError, msg: msg),
    infoBuilder: (context, msg) => HudStatusView(image: R.hudInfo, msg: msg),
  );
  Toast.init(toastBuilder: (context, msg) => ToastView(msg: msg));
  GetIt.I.registerSingleton<AppRouter>(AppRouter(Context().navigatorKey));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
            FlutterSmartDialog.observer,
          ],
        ),
        routeInformationParser: appRouter.defaultRouteParser(),
        localizationsDelegates: const [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
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
}
