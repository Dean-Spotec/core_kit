// Author: Dean.Liu
// DateTime: 2023/04/28 15:10

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';

import '../../../generated/l10n.dart';

class ExRefreshHeader extends ClassicHeader {
  ExRefreshHeader({super.key})
      : super(
          safeArea: false,
          showMessage: false,
          dragText: S.current.pullDownToRefresh,
          armedText: S.current.releaseToRefresh,
          readyText: S.current.refreshing,
          processingText: S.current.refreshing,
          processedText: S.current.refreshSucceeded,
          failedText: S.current.refreshFailed,
          noMoreText: S.current.noMore,
        );

  @override
  Widget build(BuildContext context, IndicatorState state) {
    final content = super.build(context, state);
    if (state.axis == Axis.vertical) {
      // 添加SafeArea适配iOS中ListView自动缩进
      return SafeArea(child: content);
    } else {
      return content;
    }
  }
}
