// Author: Dean.Liu
// DateTime: 2021/11/21 11:50

import 'dart:typed_data';

import 'package:core_kit/singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:screenshot/screenshot.dart';

export 'package:permission_handler/permission_handler.dart';

class ImageHandler {
  factory ImageHandler() => _instance;

  ImageHandler._internal();

  static final ImageHandler _instance = ImageHandler._internal();

  /// 对widget树外的widget截屏，并保存到相册
  /// - [widget] 需要截图的widget，其不在widget树中
  /// - [successHint] 保存成功的提示
  /// - [failHint] 保存失败的提示
  /// - [fileName] 截图的文件名
  /// - [onPermissionDenied] 获取相册权限失败的回调
  Future<void> saveInvisibleScreenshotToGallery({
    required Widget widget,
    required String successHint,
    required String failHint,
    String? fileName,
    VoidCallback? onPermissionDenied,
  }) async {
    // 请求权限
    final status = await Permission.photos.request();
    switch (status) {
      case PermissionStatus.granted:
        Hud().show();
        final controller = ScreenshotController();
        final imageUnits = await controller.captureFromWidget(widget);
        await _saveScreenshotToGallery(
          imageUnits: imageUnits,
          successHint: successHint,
          failHint: failHint,
          fileName: fileName,
        );
        break;
      default:
        onPermissionDenied?.call();
        break;
    }
  }

  /// 保存视图的截屏到相册
  /// - [controller] 视图持有的截屏控制器
  /// - [successHint] 保存成功的提示
  /// - [failHint] 保存失败的提示
  /// - [fileName] 截图的文件名
  /// - [onPermissionDenied] 获取相册权限失败的回调
  Future<void> saveScreenshotToGallery({
    required ScreenshotController controller,
    required String successHint,
    required String failHint,
    String? fileName,
    VoidCallback? onPermissionDenied,
  }) async {
    // 请求权限
    final status = await Permission.photos.request();
    switch (status) {
      case PermissionStatus.granted:
        Hud().show();
        final imageUnits = await controller.capture();
        await _saveScreenshotToGallery(
          imageUnits: imageUnits,
          successHint: successHint,
          failHint: failHint,
          fileName: fileName,
        );
        break;
      default:
        onPermissionDenied?.call();
        break;
    }
  }

  Future _saveScreenshotToGallery({
    required Uint8List? imageUnits,
    required String successHint,
    required String failHint,
    String? fileName,
  }) async {
    if (imageUnits == null) {
      Hud().showError(failHint);
      return;
    }
    return PhotoManager.editor
        .saveImage(
      imageUnits,
      title: fileName ?? DateTime.now().toString(), // Affects EXIF reading.
    )
        .then((value) {
      if (value == null) {
        Hud().showError(failHint);
      } else {
        Hud().showSuccess(successHint);
      }
    }).catchError((error) {
      Hud().showError(failHint);
    });
  }
}
