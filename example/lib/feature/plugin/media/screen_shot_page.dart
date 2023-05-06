// Author: Dean.Liu
// DateTime: 2023/02/10 17:12

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../../common/view/navigation/ex_navigation_bar.dart';
import '../../../kit/image_handler.dart';
import '../../../r.dart';

class ScreenShotPage extends StatefulWidget {
  const ScreenShotPage({super.key});

  @override
  State<ScreenShotPage> createState() => _ScreenShotPageState();
}

class _ScreenShotPageState extends State<ScreenShotPage> {
  final _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: ExNavigationBar(
        middle: const Text('截屏'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            Screenshot(
              controller: _screenshotController,
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.cyan,
                child: Image.asset(R.img1, width: 200),
              ),
            ),
            CupertinoButton(
              child: const Text('保存上面显示的图片'),
              onPressed: () {
                ImageHandler().saveScreenshotToGallery(
                  controller: _screenshotController,
                  successHint: '保存成功',
                  failHint: '保存失败',
                  onPermissionDenied: _showOpenAppSettingsDialog,
                );
              },
            ),
            CupertinoButton(
              child: const Text('保存未显示出来的图片'),
              onPressed: () {
                _saveWidgetOutTreeToGallery();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 对不在widget树中的widget进行截屏
  void _saveWidgetOutTreeToGallery() {
    final image = Container(
      padding: const EdgeInsets.all(10),
      color: Colors.red,
      child: Image.asset(R.img1, width: 200),
    );
    ImageHandler().saveInvisibleScreenshotToGallery(
      widget: image,
      successHint: '保存成功',
      failHint: '保存失败',
      onPermissionDenied: _showOpenAppSettingsDialog,
    );
  }

  /// 打开系统设置
  void _showOpenAppSettingsDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('无法使用你的照片'),
          content: const Text('当前没有获得照片使用权限，请前往设置开启'),
          actions: [
            CupertinoDialogAction(
              child: const Text('取消'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('开启权限'),
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
            ),
          ],
        );
      },
    );
  }
}
