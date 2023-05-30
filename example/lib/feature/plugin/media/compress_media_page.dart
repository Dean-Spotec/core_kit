// Author: Dean.Liu
// DateTime: 2023/02/22 22:36

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../../../common/view/navigation/ex_navigation_bar.dart';
import '../../../kit/image_handler.dart';

@RoutePage()
class CompressMediaPage extends StatefulWidget {
  const CompressMediaPage({super.key});

  @override
  State<CompressMediaPage> createState() => _CompressMediaPageState();
}

class _CompressMediaPageState extends State<CompressMediaPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: ExNavigationBar(
        middle: const Text('压缩资源'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            _buildCompressedImageView(),
            CupertinoButton(
              child: const Text('压缩图片到指定大小'),
              onPressed: () => _compressToByteSize(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompressedImageView() {
    return FutureBuilder<Directory>(
      future: getTemporaryDirectory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError || snapshot.data == null) {
            return const Text('暂无被压缩的图片');
          } else {
            final imageFile = File('${snapshot.data!.path}/rectImg1.jpeg');
            if (imageFile.existsSync()) {
              return Column(
                children: [
                  Image.file(imageFile, height: 200),
                  Text('压缩后文件大小：${imageFile.lengthSync()}'),
                ],
              );
            } else {
              return const Text('暂无被压缩的图片');
            }
          }
        } else {
          return const CupertinoActivityIndicator();
        }
      },
    );
  }

  Future<void> _compressToByteSize() async {
    final file = await _getImg1FromAssets();
    final targetPath = '${(await getTemporaryDirectory()).path}/rectImg1.jpeg';
    ImageHandler()
        .compressAndGetFile(
      file,
      targetPath,
      minWidth: 500,
      minHeight: 210,
      maxByteSize: 50 * 1024,
    )
        .then((value) {
      setState(() {});
    });
  }

  Future<File> _getImg1FromAssets() async {
    final byteData = await rootBundle.load('assets/image/img1.png');
    final file = File('${(await getTemporaryDirectory()).path}/img1.jpeg');
    await file.writeAsBytes(
      byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
    );
    return file;
  }
}
