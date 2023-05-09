// Author: Dean.Liu
// DateTime: 2021/11/21 11:50

import 'dart:io';
import 'dart:typed_data';

import 'package:core_kit/singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:screenshot/screenshot.dart';

export 'package:permission_handler/permission_handler.dart';

class ImageHandler {
  factory ImageHandler() => _instance;

  ImageHandler._internal();

  static final ImageHandler _instance = ImageHandler._internal();

  /// 压缩图片并保存，返回保存地址
  /// - [file] 需要压缩的图片
  /// - [targetPath] 压缩后图片保存的地址
  /// - [minWidth] 压缩后的最小宽度
  /// - [minHeight] 压缩后的最小高度
  /// - [quality] 压缩质量
  /// - [format] 压缩后图片的格式
  /// - [maxByteSize] 压缩后图片最大byte大小
  Future<XFile?> compressAndGetFile(
    File file,
    String targetPath, {
    int minWidth = 1920,
    int minHeight = 1080,
    int quality = 95,
    CompressFormat format = CompressFormat.jpeg,
    int? maxByteSize,
  }) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      minWidth: minWidth,
      minHeight: minHeight,
      quality: quality,
      format: format,
    );
    // 如果设置了最大内存大小，则减小质量重复压缩
    if (result != null &&
        maxByteSize != null &&
        await result.length() > maxByteSize) {
      result = await compressAndGetFile(
        file,
        targetPath,
        minWidth: minWidth,
        minHeight: minHeight,
        quality: quality - 20,
        format: format,
        maxByteSize: maxByteSize,
      );
    }
    return result;
  }

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
        await saveImageToGallery(
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
        await saveImageToGallery(
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

  /// 保存图片到相册
  /// - [imageUnits] 图片二进制数据
  /// - [successHint] 保存成功的提示
  /// - [failHint] 保存失败的提示
  /// - [fileName] 截图的文件名
  Future<AssetEntity?> saveImageToGallery({
    required Uint8List? imageUnits,
    required String successHint,
    required String failHint,
    String? fileName,
  }) async {
    if (imageUnits == null) {
      Hud().showError(failHint);
      return null;
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
