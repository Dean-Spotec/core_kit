// Author: Dean.Liu
// DateTime: 2022/02/28 11:06

import 'dart:ui';
import 'package:flutter/material.dart';

class Blur extends StatelessWidget {
  const Blur({
    super.key,
    required this.child,
    required this.sigmaX,
    required this.sigmaY,
    this.borderRadius,
  });

  final Widget child;
  final double sigmaX;
  final double sigmaY;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: child,
      ),
    );
  }
}
