// Author: Dean.Liu
// DateTime: 2021/12/22 16:12

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebProgressBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const WebProgressBar({
    super.key,
    required this.bar,
    required this.progressNotifier,
    this.progressValueColor,
    this.progressBackgroundColor,
    this.progressHeight = 2,
  });

  final PreferredSizeWidget bar;
  final ValueNotifier<int> progressNotifier;
  final Color? progressValueColor;
  final Color? progressBackgroundColor;
  final double progressHeight;

  @override
  Size get preferredSize => bar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        bar,
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ValueListenableBuilder<int>(
            valueListenable: progressNotifier,
            builder: (context, value, child) {
              return AnimatedOpacity(
                opacity: value >= 100 ? 0 : 1,
                duration: const Duration(milliseconds: 200),
                child: LinearProgressIndicator(
                  value: value / 100.0,
                  minHeight: progressHeight,
                  valueColor: AlwaysStoppedAnimation(progressValueColor),
                  backgroundColor: progressBackgroundColor,
                ),
              );
            },
          ),
        )
      ],
    );
  }

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
