// Author: Dean.Liu
// DateTime: 2023/05/06 14:27

import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../common/view/navigation/ex_navigation_bar.dart';

class IsolatePage extends StatefulWidget {
  const IsolatePage({super.key});

  @override
  State<IsolatePage> createState() => _IsolatePageState();
}

class _IsolatePageState extends State<IsolatePage> {
  Isolate? _longChildIsolate;
  SendPort? _longChildSendPort;
  ReceivePort? _longMainReceivePort;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: ExNavigationBar(middle: const Text('Isolate')),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          const Text('模拟一个计算平方值很慢的方法'),
          CupertinoButton(
            onPressed: () => _calculateDirectly(10),
            child: const Text('直接计算'),
          ),
          CupertinoButton(
            onPressed: _calculateWithCompute,
            child: const Text('使用Compute计算'),
          ),
          CupertinoButton(
            onPressed: _calculateWithDisposableIsolate,
            child: const Text('使用一次性的Isolate计算'),
          ),
          Row(
            children: [
              Expanded(
                child: CupertinoButton(
                  onPressed: _calculateWithLongRunningIsolate,
                  child: const Text(
                    '使用长存的Isolate重复计算',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: CupertinoButton(
                  onPressed: _killLongIsolate,
                  child: const Text('关闭长存的Isolate'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 直接计算平方值
  void _calculateDirectly(int value) {
    _mockTimeConsumingTask();
    debugPrint('原始值:$value 平方值:$value * value');
    // 即便使用Future一样会造成页面卡顿
    // Future(() {
    //   _mockTimeConsumingTask();
    //   debugPrint('原始值:$value 平方值:${value * value}');
    // });
  }

  /// 使用compute方法计算平方值
  void _calculateWithCompute() {
    compute(_slowSquaredWithCompute, 10).then((map) {
      debugPrint('原始值:${map['raw']} 平方值:${map['squared']}');
    });
  }

  /// 使用一次性的Isolate计算平方值
  void _calculateWithDisposableIsolate() {
    /// 简单的双向通信
    Future<void> twoWayCommunication() async {
      // 主Isolate的receivePort
      final mainReceivePort = ReceivePort();
      final childIsolate = await Isolate.spawn(
        _slowSquaredWithIsolate,
        mainReceivePort.sendPort,
      );
      mainReceivePort.listen((data) {
        if (data is SendPort) {
          data.send(10);
        } else {
          final map = data as Map<String, int>;
          debugPrint('原始值:${map['raw']} 平方值:${map['squared']}');
          mainReceivePort.close();
          childIsolate.kill();
        }
      });
    }

    twoWayCommunication();
  }

  /// 使用长存的Isolate计算平方值
  void _calculateWithLongRunningIsolate() {
    /// 初始化长存的子Isolate
    Future<void> initLongChildIsolate(List<int> values) async {
      // 主Isolate的receivePort
      _longMainReceivePort = ReceivePort();
      _longChildIsolate = await Isolate.spawn(
        _slowSquaredWithIsolate,
        _longMainReceivePort!.sendPort,
      );
      _longMainReceivePort?.first;
      _longMainReceivePort?.listen((data) {
        if (data is SendPort) {
          // 子Isolate的SendPort，用来给子Isolate发送消息
          _longChildSendPort = data;
          for (final value in values) {
            // 发送value给子Isolate
            _longChildSendPort?.send(value);
          }
        } else {
          final map = data as Map<String, int>;
          debugPrint('原始值:${map['raw']} 平方值:${map['squared']}');
        }
      });
    }

    /// 使用长存的子Isolate和main Isolate双向通信
    Future<void> twoWayCommunication2(List<int> values) async {
      if (_longChildIsolate == null ||
          _longChildSendPort == null ||
          _longMainReceivePort == null) {
        await initLongChildIsolate(values);
      } else {
        for (final value in values) {
          // 发送value给子Isolate
          _longChildSendPort?.send(value);
        }
      }
    }

    twoWayCommunication2([10, 20, 30]);
  }

  /// 关闭长存的子Isolate
  void _killLongIsolate() {
    _longChildIsolate?.kill();
    _longChildIsolate = null;
    _longChildSendPort = null;
  }
}

/// 模拟耗时操作
void _mockTimeConsumingTask() {
  for (var i = 0; i < 3000000000; i++) {}
}

Map<String, int> _slowSquaredWithCompute(int value) {
  _mockTimeConsumingTask();
  return {'raw': value, 'squared': value * value};
}

void _slowSquaredWithIsolate(SendPort mainSendPort) {
  final childReceivePort = ReceivePort();
  // 将子Isolate的ReceivePort返回给主Isolate
  mainSendPort.send(childReceivePort.sendPort);
  childReceivePort.listen((message) {
    if (message is int) {
      _mockTimeConsumingTask();
      mainSendPort.send({'raw': message, 'squared': message * message});
    }
  });
}
