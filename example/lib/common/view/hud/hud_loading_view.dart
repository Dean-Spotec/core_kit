// Author: Dean.Liu
// DateTime: 2022/08/30 12:03

import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HudLoadingView extends StatelessWidget {
  const HudLoadingView({super.key, this.msg});

  final String? msg;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);
    final content = Container(
      constraints: const BoxConstraints(minWidth: 110, minHeight: 110),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: borderRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CupertinoActivityIndicator(),
          if (msg != null)
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                msg!,
                style: const TextStyle(fontSize: 16),
              ),
            ),
        ],
      ),
    );
    return Blur(
      sigmaX: 6,
      sigmaY: 6,
      borderRadius: borderRadius,
      child: content,
    );
  }
}
