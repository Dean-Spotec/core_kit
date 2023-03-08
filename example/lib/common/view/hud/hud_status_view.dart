// Author: Dean.Liu
// DateTime: 2022/08/30 12:03

import 'package:core_kit/widget.dart';
import 'package:flutter/material.dart';

class HudStatusView extends StatelessWidget {
  const HudStatusView({
    super.key,
    required this.image,
    required this.msg,
    this.color,
  });

  final String image;
  final String msg;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);
    final maxWidth = MediaQuery.of(context).size.width;
    final content = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 38,
          height: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color ?? Colors.red,
            borderRadius: const BorderRadius.all(Radius.circular(19)),
          ),
          child: Image.asset(
            image,
            width: 32,
            height: 32,
          ),
        ),
        if (msg.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              msg,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
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
        constraints: BoxConstraints(
          minWidth: 110,
          minHeight: 110,
          maxWidth: maxWidth - 50 * 2,
        ),
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: borderRadius,
        ),
        child: content,
      ),
    );
  }
}
