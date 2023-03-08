// Author: Dean.Liu
// DateTime: 2022/08/30 12:03

import 'package:core_kit/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../r.dart';

class HudLoadingView extends StatelessWidget {
  const HudLoadingView({super.key, this.msg});

  final String? msg;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: Lottie.asset(R.loadingIndicator),
        ),
        if (msg != null)
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              msg!,
              style:
                  const TextStyle(fontSize: 16, color: CupertinoColors.label),
            ),
          ),
      ],
    );
    return Blur(
      sigmaX: 6,
      sigmaY: 6,
      borderRadius: borderRadius,
      child: Container(
        padding: const EdgeInsets.all(18),
        constraints: const BoxConstraints(minWidth: 110, minHeight: 110),
        color: Colors.white38,
        child: content,
      ),
    );
  }
}
