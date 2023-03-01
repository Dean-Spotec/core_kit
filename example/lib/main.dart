import 'package:core_kit/singleton.dart';
import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';

import 'common/view/hud/hud_loading_view.dart';
import 'common/view/hud/hud_status_view.dart';
import 'common/view/toast_view.dart';
import 'feature/compress_media_page.dart';
import 'feature/screen_shot_page.dart';
import 'r.dart';

void main() {
  Hud.init(
    loadingBuilder: (context, msg) => HudLoadingView(msg: msg),
    successBuilder: (context, msg) =>
        HudStatusView(image: R.hudSuccess, msg: msg),
    errorBuilder: (context, msg) => HudStatusView(image: R.hudError, msg: msg),
    infoBuilder: (context, msg) => HudStatusView(image: R.hudInfo, msg: msg),
  );
  Toast.init(toastBuilder: (context, msg) => ToastView(msg: msg));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CornerBanner(
      message: 'CUSTOM',
      show: true,
      location: BannerLocation.topStart,
      child: CupertinoApp(
        title: 'Flutter Demo',
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: ListView(
        children: [
          CupertinoListSection(
            children: [
              CupertinoListTile(
                title: const Text('截屏'),
                onTap: () {
                  _pushPage(const ScreenShotPage());
                },
              ),
              CupertinoListTile(
                title: const Text('压缩'),
                onTap: () {
                  _pushPage(const CompressMediaPage());
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Future _pushPage(Widget page) {
    return Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) => page),
    );
  }
}
